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

    var track: Track!
    var tracks = Array<Track>()
    var jukebox : Jukebox!

    lazy var trackDetailView: TrackDetailView = {
        let view = TrackDetailView()

        return view
    }()
    
    //MARK: - Initilize -
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    convenience init(title: String, track: Track, tracks: Array<Track>) {
        self.init()
        
        self.title = title
        self.track = track
        self.tracks = tracks
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life cycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        baseConfig()
        output.viewIsReady()
    }
    
    // MARK: - Private Method -
    private func baseConfig() {
        self.view = trackDetailView
        
        resetUI()
        addTracks()
        
        trackDetailView.headerView.imageView.kf_setImageWithURL(NSURL(string: self.track.album.coverBig)!, placeholderImage: Image(named: "img_placeholder"))
        trackDetailView.infoView.titleLabel.text = self.track.title
        trackDetailView.infoView.dateLabel.text = self.track.releaseDate
    
        trackDetailView.actionView.volumeSlider.addTarget(self, action: #selector(TrackDetailViewController.volumeSliderValueChanged), forControlEvents: .ValueChanged)
        trackDetailView.actionView.slider.addTarget(self, action: #selector(TrackDetailViewController.progressSliderValueChanged), forControlEvents: .ValueChanged)
        trackDetailView.actionView.playPauseButton.addTarget(self, action: #selector(TrackDetailViewController.playPauseAction), forControlEvents: .TouchUpInside)
        trackDetailView.actionView.stopButton.addTarget(self, action: #selector(TrackDetailViewController.stopAction), forControlEvents: .TouchUpInside)
        trackDetailView.actionView.prevButton.addTarget(self, action: #selector(TrackDetailViewController.prevAction), forControlEvents: .TouchUpInside)
        trackDetailView.actionView.nextButton.addTarget(self, action: #selector(TrackDetailViewController.nextAction), forControlEvents: .TouchUpInside)
        trackDetailView.actionView.replayButton.addTarget(self, action: #selector(TrackDetailViewController.replayAction), forControlEvents: .TouchUpInside)
    }
    
    private func resetUI() {
        trackDetailView.actionView.durationLabel.text = "00:00"
        trackDetailView.actionView.currentTimeLabel.text = "00:00"
        trackDetailView.actionView.slider.value = 0
    }
    
    private func addTracks() {
        var jukeboxItems = Array<JukeboxItem>()
        for item in tracks {
            jukeboxItems.append(JukeboxItem(URL: NSURL(string: item.link)!))
        }
        self.jukebox = Jukebox(delegate: self, items: jukeboxItems)
    }
    
    // MARK:- Actions -
    func volumeSliderValueChanged() {
        if let jk = self.jukebox {
            jk.volume = trackDetailView.actionView.volumeSlider.value
        }
    }
    
    func progressSliderValueChanged() {
        if let duration = self.jukebox.currentItem?.duration {
            self.jukebox.seekToSecond(Int(Double(trackDetailView.actionView.slider.value) * duration))
        }
    }
    
    func prevAction() {
        if self.jukebox.currentItem?.currentTime > 5 || self.jukebox.playIndex == 0 {
            self.jukebox.replayCurrentItem()
        } else {
            self.jukebox.playPrevious()
        }
    }
    
    func nextAction() {
        self.jukebox.playNext()
    }
    
    func playPauseAction() {
        switch self.jukebox.state {
        case .Ready :
            self.jukebox.playAtIndex(0)
        case .Playing :
            self.jukebox.pause()
        case .Paused :
            self.jukebox.play()
        default:
            self.jukebox.stop()
        }
    }
    
    func replayAction() {
        self.resetUI()
        self.jukebox.replay()
        
    }
    
    func stopAction() {
        self.resetUI()
        self.jukebox.stop()
    }
    
    override func remoteControlReceivedWithEvent(event: UIEvent?) {
        if event?.type == .RemoteControl {
            switch event!.subtype {
            case .RemoteControlPlay :
                self.jukebox.play()
            case .RemoteControlPause :
                self.jukebox.pause()
            case .RemoteControlNextTrack :
                self.jukebox.playNext()
            case .RemoteControlPreviousTrack:
                self.jukebox.playPrevious()
            default:
                break
            }
        } else {
            print("NO EVENT!!!")
        }
    }
}

// MARK:- extension for JukeboxDelegate -
extension TrackDetailViewController: JukeboxDelegate {
    
    func jukeboxDidLoadItem(jukebox: Jukebox, item: JukeboxItem) {
        print("Jukebox did load: \(item.URL.lastPathComponent)")
    }

    func jukeboxPlaybackProgressDidChange(jukebox: Jukebox) {
        if let currentTime = jukebox.currentItem?.currentTime, let duration = jukebox.currentItem?.duration  {
            let value = Float(currentTime / duration)
            trackDetailView.actionView.slider.value = value
            self.populateLabelWithTime(trackDetailView.actionView.currentTimeLabel, time: currentTime)
            self.populateLabelWithTime(trackDetailView.actionView.durationLabel, time: duration)
        }
    }

    func jukeboxStateDidChange(jukebox: Jukebox) {
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
}

//MARK: - extension for TrackDetailViewInput -
extension TrackDetailViewController: TrackDetailViewInput {
    
    func setupInitialState() {

    }
}
