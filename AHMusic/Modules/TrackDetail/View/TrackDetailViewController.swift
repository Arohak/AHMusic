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
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        output.stop()
    }
    
    override func remoteControlReceivedWithEvent(event: UIEvent?) {
        output.remoteControlReceivedWithEvent(event)
    }
    
    // MARK: - Private Method -
    private func baseConfig() {
        self.view = trackDetailView
        
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
        trackDetailView.actionView.trackListButton.addTarget(self, action: #selector(TrackDetailViewController.openActionSheet), forControlEvents: .TouchUpInside)
    }
    
    private func playTrackInStart() {
        let index = tracks.indexOf {$0.id == track.id}
        if let index = index {
            output.playPauseAtIndex(index)
        }
    }
    
    // MARK:- Actions -
    func volumeSliderValueChanged(sender: UISlider) {
        output.volumeSliderValue(sender.value)
    }
    
    func progressSliderValueChanged(sender: UISlider) {
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
    
    func openActionSheet() {
        output.openActionSheet(tracks)
    }
}

//MARK: - extension for TrackDetailViewInput -
extension TrackDetailViewController: TrackDetailViewInput {

    func reset() {
        resetUI()
    }
    
    func didLoadItem(jukebox: Jukebox, item: JukeboxItem) {
//        print("Jukebox did load: \(item.URL.lastPathComponent)")
        
        updateUIFromChangeTrack(tracks[jukebox.playIndex])
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
    
    private func updateUIFromChangeTrack(track: Track) {
        if !track.artist.pictureBig.isEmpty {
            trackDetailView.headerView.imageView.kf_setImageWithURL(NSURL(string: track.artist.pictureBig)!, placeholderImage: Image(named: "img_placeholder"))
        }
        trackDetailView.infoView.titleLabel.text = track.title
        trackDetailView.infoView.dateLabel.text = track.releaseDate
    }
}