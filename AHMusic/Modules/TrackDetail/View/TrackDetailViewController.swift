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

    var output: TrackDetailViewOutput!
    
    var player: AHPlayer!
    var tracks: Array<Track>!
    var track: Track!

    lazy var trackDetailView: TrackDetailView = {
        let view = TrackDetailView()

        return view
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
        
        output.viewIsReady(self.tracks)
        baseConfig()
        player.playPause()
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        player.stop()
    }
    
    // MARK: - Private Method -
    private func baseConfig() {
        self.view = trackDetailView
        
        player = (output as! TrackDetailPresenter).player
        
        resetUI()
        
        trackDetailView.headerView.imageView.kf_setImageWithURL(NSURL(string: self.track.album.coverBig)!, placeholderImage: Image(named: "img_placeholder"))
        trackDetailView.infoView.titleLabel.text = self.track.title
        trackDetailView.infoView.dateLabel.text = self.track.releaseDate
    
        trackDetailView.actionView.volumeSlider.addTarget(self, action: #selector(TrackDetailViewController.volumeSliderValueChanged(_:)), forControlEvents: .ValueChanged)
        trackDetailView.actionView.slider.addTarget(self, action: #selector(TrackDetailViewController.progressSliderValueChanged(_:)), forControlEvents: .ValueChanged)
        trackDetailView.actionView.playPauseButton.addTarget(self, action: #selector(TrackDetailViewController.playPauseAction), forControlEvents: .TouchUpInside)
        trackDetailView.actionView.stopButton.addTarget(self, action: #selector(TrackDetailViewController.stopAction), forControlEvents: .TouchUpInside)
        trackDetailView.actionView.prevButton.addTarget(self, action: #selector(TrackDetailViewController.prevAction), forControlEvents: .TouchUpInside)
        trackDetailView.actionView.nextButton.addTarget(self, action: #selector(TrackDetailViewController.nextAction), forControlEvents: .TouchUpInside)
        trackDetailView.actionView.replayButton.addTarget(self, action: #selector(TrackDetailViewController.replayAction), forControlEvents: .TouchUpInside)
    }
    
    // MARK:- Actions -
    func volumeSliderValueChanged(sender: UISlider) {
        player.volumeSliderValue(sender.value)
    }
    
    func progressSliderValueChanged(sender: UISlider) {
        player.progressSliderValue(sender.value)
    }
    
    func prevAction() {
        player.prev()
    }
    
    func nextAction() {
        player.next()
    }
    
    func playPauseAction() {
        player.playPause()
    }
    
    func replayAction() {
        player.replay()
        
    }
    
    func stopAction() {
        player.stop()
    }
    
    override func remoteControlReceivedWithEvent(event: UIEvent?) {
        let jukebox = player.jukebox
        if event?.type == .RemoteControl {
            switch event!.subtype {
            case .RemoteControlPlay :
                jukebox.play()
            case .RemoteControlPause :
                jukebox.pause()
            case .RemoteControlNextTrack :
                jukebox.playNext()
            case .RemoteControlPreviousTrack:
                jukebox.playPrevious()
            default:
                break
            }
        } else {
            print("NO EVENT!!!")
        }
    }
}

//MARK: - extension for TrackDetailViewInput -
extension TrackDetailViewController: TrackDetailViewInput {

    func reset() {
        resetUI()
    }
    
    func didLoadItem(jukebox: Jukebox, item: JukeboxItem) {
        print("Jukebox did load: \(item.URL.lastPathComponent)")
    }
    
    func playback(currentTime: Double, duration: Double) {
        let value = Float(currentTime / duration)
        trackDetailView.actionView.slider.value = value
        self.populateLabelWithTime(trackDetailView.actionView.currentTimeLabel, time: currentTime)
        self.populateLabelWithTime(trackDetailView.actionView.durationLabel, time: duration)
    }
    
    func stateDidChange(jukebox: Jukebox) {
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            self.trackDetailView.actionView.playPauseButton.alpha = jukebox.state == .Loading ? 0 : 1
            self.trackDetailView.actionView.playPauseButton.enabled = jukebox.state == .Loading ? false : true
        })
        
        if jukebox.state == .Ready {
            trackDetailView.actionView.playPauseButton.setImage(UIImage(named: "playBtn"), forState: .Normal)
        } else if jukebox.state == .Loading  {
            trackDetailView.actionView.playPauseButton.setImage(UIImage(named: "pauseBtn"), forState: .Normal)
        } else {
            trackDetailView.actionView.volumeSlider.value = jukebox.volume
            trackDetailView.actionView.playPauseButton.setImage(UIImage(named: jukebox.state == .Paused ? "playBtn" : "pauseBtn"), forState: .Normal)
        }
        
        print("Jukebox state changed to \(jukebox.state)")
    }
    
    // MARK: - Private Method -
    private func populateLabelWithTime(label : UILabel, time: Double) {
        let minutes = Int(time / 60)
        let seconds = Int(time) - minutes * 60
        
        label.text = String(format: "%02d", minutes) + ":" + String(format: "%02d", seconds)
    }
    
    private func resetUI() {
        trackDetailView.actionView.durationLabel.text = "00:00"
        trackDetailView.actionView.currentTimeLabel.text = "00:00"
        trackDetailView.actionView.slider.value = 0
    }
}