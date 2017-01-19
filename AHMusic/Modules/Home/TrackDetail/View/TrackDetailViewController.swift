//
//  TrackDetailViewController.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 17/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

import MediaPlayer
import Jukebox

//MARK: - class TrackDetailViewController -
class TrackDetailViewController: UIViewController {

    var trackDetailView = TrackDetailView()

    var output: TrackDetailViewOutput!
    var tracks: Array<Track>!
    var track: Track!
    var selectedTrack: Track!

    let shapeLayer = ShapeLayer(center: TD_BBTN_SIZE)
    var totalValue : Float = 0.0
    var startValue : Float = 0.0
    
    lazy var rightItem: UIBarButtonItem = {
        let shareButton = AHButton(frame: CGRect(x: 0, y: 0, width: 22, height: 30))
        shareButton.setBackgroundImage(UIImage(named:"img_share"), for: .normal)
        shareButton.addTarget(self, action: #selector(TrackDetailViewController.shareTrack(_:)), for: .touchUpInside)
        let item = UIBarButtonItem(customView: shareButton)
        
        return item
    }()
    
    //MARK: - Initilize -
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    convenience init(title: String, items: Array<Track>, track: Track) {
        self.init()
        
        self.title = title
        self.track = track
        self.tracks = items
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Life cycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        output.viewIsReady(tracks)
        baseConfig()
        playTrackInStart()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        output.stop()
    }
    
    override func remoteControlReceived(with event: UIEvent?) {
        output.remoteControlReceivedWithEvent(event)
    }
    
    // MARK: - Private Method -
    fileprivate func baseConfig() {
        self.view = trackDetailView
        
//        configureNavigationBar()
        
        resetUI()
        
        trackDetailView.headerView.imageView.kf.setImage(with: URL(string: self.track.album.coverBig)!, placeholder: Image(named: "img_placeholder"))
        trackDetailView.headerView.titleLabel.text = self.track.title
    
        trackDetailView.actionView.volumeSlider.addTarget(self, action: #selector(TrackDetailViewController.volumeSliderValueChanged(_:)), for: .valueChanged)
        trackDetailView.actionView.slider.addTarget(self, action: #selector(TrackDetailViewController.progressSliderValueChanged(_:)), for: .valueChanged)
        trackDetailView.actionView.playPauseButton.addTarget(self, action: #selector(TrackDetailViewController.playPauseAction), for: .touchUpInside)
        trackDetailView.actionView.stopButton.addTarget(self, action: #selector(TrackDetailViewController.stopAction), for: .touchUpInside)
        trackDetailView.actionView.prevButton.addTarget(self, action: #selector(TrackDetailViewController.prevAction), for: .touchUpInside)
        trackDetailView.actionView.nextButton.addTarget(self, action: #selector(TrackDetailViewController.nextAction), for: .touchUpInside)
        trackDetailView.actionView.replayButton.addTarget(self, action: #selector(TrackDetailViewController.replayAction), for: .touchUpInside)
        trackDetailView.actionView.trackListButton.addTarget(self, action: #selector(TrackDetailViewController.openActionSheet(sender:)), for: .touchUpInside)
        trackDetailView.headerView.favoriteButton.addTarget(self, action: #selector(TrackDetailViewController.favoriteAction), for: .touchUpInside)
        trackDetailView.headerView.downloadButton.addTarget(self, action: #selector(TrackDetailViewController.downloadAction), for: .touchUpInside)
        
        //shapeLayer
        trackDetailView.headerView.downloadButton.layer.addSublayer(shapeLayer.gradientMaskLayer)
        
        //state
        setFavoriteAndDownloadButtonState(track)
}

    fileprivate func configureNavigationBar() {
        navigationItem.setRightBarButton(rightItem, animated: false)
    }

    fileprivate func playTrackInStart() {
        let index = tracks.index {$0.id == track.id}
        if let index = index {
            output.playPauseAtIndex(index)
        }
    }
    
    fileprivate func setFavoriteAndDownloadButtonState(_ track: Track) {
        trackDetailView.headerView.favoriteButton.isSelected = Utils.favoriteState(track)
        
        let dState = Utils.downloadState(track)
        trackDetailView.headerView.downloadButton.isSelected = dState
        trackDetailView.headerView.downloadButton.isEnabled = !dState
        if dState {
            trackDetailView.headerView.downloadButton.setBackgroundImage(UIImage(named: "img_tr_download_select"), for: .normal)
        } else{
            trackDetailView.headerView.downloadButton.setBackgroundImage(UIImage(named: "img_tr_download"), for: .normal)
        }
    }
    
    // MARK:- Actions -
    func volumeSliderValueChanged(_ sender: UISlider) {
        output.volumeSliderValue(sender.value)
    }
    
    func progressSliderValueChanged(_ sender: UISlider) {
        output.progressSliderValue(sender.value)
    }
    
    func prevAction() {
        output.prev()
    }
    
    func nextAction() {
        output.next()
    }
    
    func playPauseAction() {
        output.playPause()
    }
    
    func replayAction() {
        output.replay()
        
    }
    
    func stopAction() {
        output.stop()
    }
    
    func openActionSheet(sender: UIButton) {
        output.openActionSheet(sender: sender, items: tracks)
    }
    
    func shareTrack(_ sender: AHButton) {
        output.shareTrack(sender, items: tracks)
    }
    
    func favoriteAction(_ sender: AHButton) {
        sender.isSelected = !sender.isSelected
        
        output.favoriteTrack(sender.isSelected, track: selectedTrack)
    }
    
    func downloadAction(_ sender: AHButton) {
        downloadProgress(sender)
    }
    
    // MARK: - Private Method -
    fileprivate func downloadProgress(_ sender: AHButton) {
        sender.isSelected = !sender.isSelected
        sender.isEnabled = !sender.isSelected
        sender.setBackgroundImage(UIImage(named: "img_bg_transparent"), for: .normal)
       
        apiHelper.download(track: selectedTrack, inProgress: { value in
            self.totalValue = Float(value)
            self.shapeLayer.animateProgressView(self.startValue, toV: self.totalValue, dur: 0.0001)
            self.startValue = self.totalValue
        }) { state in
            self.startValue = 0.0
            self.totalValue = 0.0
            if state {
                sender.setBackgroundImage(UIImage(named: "img_tr_download_select"), for: .normal)
                self.shapeLayer.hideProgressView()
                
                self.output.downloadTrack(sender.isSelected, track: self.selectedTrack)
                
                self.setFavoriteAndDownloadButtonState(self.selectedTrack)
            }
        }
    }
}

//MARK: - extension for TrackDetailViewInput -
extension TrackDetailViewController: TrackDetailViewInput {

    func reset() {
        resetUI()
    }
    
    func didLoadItem(_ jukebox: Jukebox, item: JukeboxItem) {
        updateUIFromChangeTrack(tracks[jukebox.playIndex])
    }
    
    func playback(_ currentTime: Double, duration: Double) {
        let value = Float(currentTime / duration)
        trackDetailView.actionView.slider.value = value
        self.populateLabelWithTime(trackDetailView.actionView.currentTimeLabel, time: currentTime)
        self.populateLabelWithTime(trackDetailView.actionView.durationLabel, time: duration)
    }
    
    func stateDidChange(_ jukebox: Jukebox) {
        UIView.animate(withDuration: 0.3, animations: { () -> Void in
            self.trackDetailView.actionView.playPauseButton.isEnabled = jukebox.state == .loading ? false : true
        })
        
        if jukebox.state == .ready {
            trackDetailView.actionView.playPauseButton.setBackgroundImage(UIImage(named: "img_max_pl_play"), for: .normal)
        } else if jukebox.state == .loading  {
            trackDetailView.actionView.playPauseButton.setBackgroundImage(UIImage(named: "img_max_pl_pause"), for: .normal)
        } else {
            trackDetailView.actionView.volumeSlider.value = jukebox.volume
            trackDetailView.actionView.playPauseButton.setBackgroundImage(UIImage(named: jukebox.state == .paused ? "img_max_pl_play" : "img_max_pl_pause"), for: .normal)
        }
        
        updateUIFromChangeTrack(tracks[jukebox.playIndex])
    }
    
    // MARK: - Private Method -
    fileprivate func populateLabelWithTime(_ label : UILabel, time: Double) {
        let minutes = Int(time / 60)
        let seconds = Int(time) - minutes * 60
        
        label.text = String(format: "%02d", minutes) + ":" + String(format: "%02d", seconds)
    }
    
    fileprivate func resetUI() {
        trackDetailView.actionView.durationLabel.text = "00:00"
        trackDetailView.actionView.currentTimeLabel.text = "00:00"
        trackDetailView.actionView.slider.value = 0
    }
    
    fileprivate func updateUIFromChangeTrack(_ track: Track) {
        selectedTrack = track
        setFavoriteAndDownloadButtonState(track)
        
        if !track.artist.pictureBig.isEmpty {
            trackDetailView.headerView.imageView.kf.setImage(with: URL(string: track.artist.pictureBig), placeholder: Image(named: "img_placeholder"))
            trackDetailView.headerView.titleLabel.text = track.title + "\nby " + track.artist.name

        } else {
            trackDetailView.headerView.titleLabel.text = track.title
        }
    }
}
