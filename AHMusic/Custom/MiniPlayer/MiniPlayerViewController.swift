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
    
    fileprivate func baseConfig() {
        self.view = miniPlayerView
        
        miniPlayerView.player.titleLabel.text = items[index].title
        
        miniPlayerView.player.slider.addTarget(self, action: #selector(MiniPlayerViewController.progressSliderValueChanged(_:)), for: .valueChanged)
        miniPlayerView.player.playPauseButton.addTarget(self, action: #selector(MiniPlayerViewController.playPauseAction), for: .touchUpInside)
        miniPlayerView.player.prevButton.addTarget(self, action: #selector(MiniPlayerViewController.prevAction), for: .touchUpInside)
        miniPlayerView.player.nextButton.addTarget(self, action: #selector(MiniPlayerViewController.nextAction), for: .touchUpInside)
        
        miniPlayerView.bgView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(MiniPlayerViewController.close)))
    }
    
    // MARK:- Actions -
    func progressSliderValueChanged(_ sender: UISlider) {
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
        
        index = player.jukebox.playIndex
        output.playPauseTrack(index)
    }
    
    func close() {
        self.dismiss(animated: true) {
            self.output.stopPlayer(self.index)
            self.player.stop()
        }
    }
}

//MARK: - extension for PlayerOutputProtocol -
extension MiniPlayerViewController: PlayerOutputProtocol {
    
    func reset() {
        
    }
    
    func didLoadItem(_ jukebox: Jukebox, item: JukeboxItem) {
//        print("Jukebox did load: \(item.URL.lastPathComponent)")

        index = player.jukebox.playIndex
        output.changeTrack(index)
        
        miniPlayerView.player.titleLabel.text = items[index].title
    }
    
    func playback(_ currentTime: Double, duration: Double) {
        let value = Float(currentTime / duration)
        miniPlayerView.player.slider.value = value
    }
    
    func stateDidChange(_ jukebox: Jukebox) {
        UIView.animate(withDuration: 0.3, animations: { () -> Void in
            self.miniPlayerView.player.playPauseButton.isEnabled = jukebox.state == .loading ? false : true
        })
        
        if jukebox.state == .ready {
            miniPlayerView.player.playPauseButton.setBackgroundImage(UIImage(named: "img_pl_play"), for: .normal)
        } else if jukebox.state == .loading  {
            miniPlayerView.player.playPauseButton.setBackgroundImage(UIImage(named: "img_pl_pause"), for: .normal)
        } else {
            miniPlayerView.player.playPauseButton.setBackgroundImage(UIImage(named: jukebox.state == .paused ? "img_pl_play" : "img_pl_pause"), for: .normal)
        }
        
//        print("Jukebox state changed to \(jukebox.state)")
    }
}
