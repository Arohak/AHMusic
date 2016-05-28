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
        slider.addTarget(self, action: #selector(MiniPlayerViewRoot.progressSliderValueChanged(_:)), forControlEvents: .ValueChanged)
        playPauseButton.addTarget(self, action: #selector(MiniPlayerViewRoot.playPauseAction), forControlEvents: .TouchUpInside)
        prevButton.addTarget(self, action: #selector(MiniPlayerViewRoot.prevAction), forControlEvents: .TouchUpInside)
        nextButton.addTarget(self, action: #selector(MiniPlayerViewRoot.nextAction), forControlEvents: .TouchUpInside)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK:- Public Methods -
    func setTrackers(index: Int, items: Array<Track>) {
        self.index = index
        self.items = items
        
        player.setTrackers(items)
        player.jukebox.playAtIndex(index)
    }

    // MARK:- Actions -
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
        index = player.jukebox.playIndex
        player.playPauseAtIndex(index)
    }
    
    func close() {

    }
}

//MARK: - extension for PlayerOutputProtocol -
extension MiniPlayerViewRoot: PlayerOutputProtocol {
    
    func reset() {
        
    }
    
    func didLoadItem(jukebox: Jukebox, item: JukeboxItem) {
        index = player.jukebox.playIndex
        titleLabel.text = items[index].title
        
        EventCenter.defaultCenter.post(MiniPlayerEvent(result: items[index], state: .Change))
    }
    
    func playback(currentTime: Double, duration: Double) {
        let value = Float(currentTime / duration)
        slider.value = value
    }
    
    func stateDidChange(jukebox: Jukebox) {
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            self.playPauseButton.enabled = jukebox.state == .Loading ? false : true
        })
        
        if jukebox.state == .Ready {
            playPauseButton.setBackgroundImage(UIImage(named: "img_pl_play"), forState: .Normal)
        } else if jukebox.state == .Loading  {
           playPauseButton.setBackgroundImage(UIImage(named: "img_pl_pause"), forState: .Normal)
        } else {
            playPauseButton.setBackgroundImage(UIImage(named: jukebox.state == .Paused ? "img_pl_play" : "img_pl_pause"), forState: .Normal)
        }
        
        
        switch jukebox.state {
        case .Playing:
            EventCenter.defaultCenter.post(MiniPlayerEvent(result: items[index], state: .Play))
            
        case .Paused:
            EventCenter.defaultCenter.post(MiniPlayerEvent(result: items[index], state: .Pause))

        default:
            EventCenter.defaultCenter.post(MiniPlayerEvent(result: items[index], state: .Stop))
        }
    }
}