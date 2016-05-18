//
//  MiniPlayerViewController.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 06/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class MiniPlayerViewController: UIViewController {

    var items = Array<Track>()
    var player: AHPlayer!
    
    var miniPlayerView = MiniPlayerView()
    var index: Int!
    
    var output: MiniPlayerProtocol!

    //MARK: - Initilize -
    init() {
        super.init(nibName: nil, bundle:nil)
    }

    convenience init(index: Int, items: Array<Track>, output: MiniPlayerProtocol) {
        self.init()
        
        self.index = index
        self.items = items
        self.output = output

        self.player = AHPlayer(items: self.items, playerOutput: self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life cycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        baseConfig()
        
        player.playPauseAtIndex(index)
        output.playPauseTrack(index)
    }
    
    private func baseConfig() {
        self.view = miniPlayerView
        
        miniPlayerView.player.titleLabel.text = items[index].title
        
        miniPlayerView.player.slider.addTarget(self, action: #selector(MiniPlayerViewController.progressSliderValueChanged(_:)), forControlEvents: .ValueChanged)
        miniPlayerView.player.playPauseButton.addTarget(self, action: #selector(MiniPlayerViewController.playPauseAction), forControlEvents: .TouchUpInside)
        miniPlayerView.player.prevButton.addTarget(self, action: #selector(MiniPlayerViewController.prevAction), forControlEvents: .TouchUpInside)
        miniPlayerView.player.nextButton.addTarget(self, action: #selector(MiniPlayerViewController.nextAction), forControlEvents: .TouchUpInside)
        
        miniPlayerView.bgView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(MiniPlayerViewController.close)))
    }
    
    // MARK:- Actions -
    func progressSliderValueChanged(sender: UISlider) {
        player.progressSliderValue(sender.value)
    }
    
    func prevAction() {
        player.prev()
        
        index = player.jukebox.playIndex
        output.prevTrack(index)
    }
    
    func nextAction() {
        player.next()
        
        index = player.jukebox.playIndex
        output.nextTrack(index)
    }
    
    func playPauseAction() {
        player.playPause()
        
        index = player.jukebox.playIndex
        output.playPauseTrack(index)
    }
    
    func close() {
        self.dismissViewControllerAnimated(true) {
            self.output.stopPlayer(self.index)
            self.player.stop()
        }
    }
}

//MARK: - extension for PlayerOutputProtocol -
extension MiniPlayerViewController: PlayerOutputProtocol {
    
    func reset() {
        
    }
    
    func didLoadItem(jukebox: Jukebox, item: JukeboxItem) {
        print("Jukebox did load: \(item.URL.lastPathComponent)")
        
        let index = player.jukebox.playIndex
        if index != 0 { output.nextTrack(index) }
        
        miniPlayerView.player.titleLabel.text = items[index].title
    }
    
    func playback(currentTime: Double, duration: Double) {
        let value = Float(currentTime / duration)
        miniPlayerView.player.slider.value = value
    }
    
    func stateDidChange(jukebox: Jukebox) {
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            self.miniPlayerView.player.playPauseButton.alpha = jukebox.state == .Loading ? 0 : 1
            self.miniPlayerView.player.playPauseButton.enabled = jukebox.state == .Loading ? false : true
        })
        
        if jukebox.state == .Ready {
            miniPlayerView.player.playPauseButton.setImage(UIImage(named: "playBtn"), forState: .Normal)
        } else if jukebox.state == .Loading  {
            miniPlayerView.player.playPauseButton.setImage(UIImage(named: "pauseBtn"), forState: .Normal)
        } else {
            miniPlayerView.player.playPauseButton.setImage(UIImage(named: jukebox.state == .Paused ? "playBtn" : "pauseBtn"), forState: .Normal)
        }
        
        print("Jukebox state changed to \(jukebox.state)")
    }
}