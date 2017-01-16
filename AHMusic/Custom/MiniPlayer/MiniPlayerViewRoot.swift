//
//  MiniPlayerViewRoot.swift
//  AHMusic
//
//  Created by Hakobyan Ara on 5/17/16.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

//MARK: - MiniPlayerViewRoot -
class MiniPlayerViewRoot: PlayerView {
    
    var items = Array<Track>()
    var player: AHPlayer!
    var index: Int!
        
    //MARK: - Initialize -
    override init() {
        super.init()
    }
    
    convenience init(index: Int, items: Array<Track>, isOffline: Bool = false) {
        self.init()
        
        self.index = index
        self.items = items
        
        player = AHPlayer(items: self.items, playerOutput: self, isOffline: isOffline)
        player.playPauseAtIndex(index)
        
        titleLabel.text = items[index].title
        slider.addTarget(self, action: #selector(MiniPlayerViewRoot.progressSliderValueChanged(_:)), for: .valueChanged)
        playPauseButton.addTarget(self, action: #selector(MiniPlayerViewRoot.playPauseAction), for: .touchUpInside)
        prevButton.addTarget(self, action: #selector(MiniPlayerViewRoot.prevAction), for: .touchUpInside)
        nextButton.addTarget(self, action: #selector(MiniPlayerViewRoot.nextAction), for: .touchUpInside)
        closeButton.addTarget(self, action: #selector(MiniPlayerViewRoot.closeAction), for: .touchUpInside)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK:- Public Methods -
    func setTrackers(_ index: Int, items: Array<Track>) {
        self.index = index
        self.items = items
        
        player.setTrackers(items)
        player.jukebox.play(atIndex: index)
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
        index = player.jukebox.playIndex
        player.playPauseAtIndex(index)
    }
    
    func closeAction() {
        SwiftEventBus.post(kEvantMiniPlayer, userInfo: [ "info" : MiniPlayerEvent(result: items[index], state: .stop)])
        UIHelper.closeMiniPlayer()
    }
}

//MARK: - extension for PlayerOutputProtocol -
extension MiniPlayerViewRoot: PlayerOutputProtocol {
    
    func reset() {
        
    }
    
    func didLoadItem(_ jukebox: Jukebox, item: JukeboxItem) {
        index = player.jukebox.playIndex
        titleLabel.text = items[index].title
        
        SwiftEventBus.post(kEvantMiniPlayer, userInfo: [ "info" : MiniPlayerEvent(result: items[index], state: .change)])
    }
    
    func playback(_ currentTime: Double, duration: Double) {
        let value = Float(currentTime / duration)
        slider.value = value
    }
    
    func stateDidChange(_ jukebox: Jukebox) {
        UIView.animate(withDuration: 0.3, animations: { () -> Void in
            self.playPauseButton.isEnabled = jukebox.state == .loading ? false : true
        })
        
        if jukebox.state == .ready {
            playPauseButton.setBackgroundImage(UIImage(named: "img_pl_play"), for: .normal)
        } else if jukebox.state == .loading  {
           playPauseButton.setBackgroundImage(UIImage(named: "img_pl_pause"), for: .normal)
        } else {
            playPauseButton.setBackgroundImage(UIImage(named: jukebox.state == .paused ? "img_pl_play" : "img_pl_pause"), for: .normal)
        }
        
        switch jukebox.state {
        case .playing:
            SwiftEventBus.post(kEvantMiniPlayer, userInfo: [ "info" : MiniPlayerEvent(result: items[index], state: .play)])
            
        case .paused:
            SwiftEventBus.post(kEvantMiniPlayer, userInfo: [ "info" : MiniPlayerEvent(result: items[index], state: .pause)])

        default:
            SwiftEventBus.post(kEvantMiniPlayer, userInfo: [ "info" : MiniPlayerEvent(result: items[index], state: .stop)])
        }
    }
}
