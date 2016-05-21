//
//  TDActionView.swift
//  AHMusic
//
//  Created by Hakobyan Ara on 5/17/16.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class TDActionView: UIView {
    
    //MARK: - Create UIElements -
    lazy var bgImageView: UIView = {
        let view = UIImageView.newAutoLayoutView()

        return view
    }()

    lazy var slider: UISlider = {
        let view = UISlider.newAutoLayoutView()
        view.setThumbImage(UIImage(named: "img_max_pl_slider")!, forState: .Normal)
        view.tintColor = RED_LIGHT
        
        return view
    }()
    
    lazy var volumeImageView: UIImageView = {
        let view = UIImageView.newAutoLayoutView()
        view.image = UIImage(named: "img_max_pl_sound")
        
        return view
    }()
    
    lazy var volumeSlider: UISlider = {
        let view = UISlider.newAutoLayoutView()
        view.setThumbImage(UIImage(named: "img_max_pl_slider")!, forState: .Normal)
        view.tintColor = RED_LIGHT
        
        return view
    }()
    
    lazy var playPauseButton: AHButton = {
        let view = AHButton.newAutoLayoutView()
        view.setBackgroundImage(UIImage(named: "img_max_pl_play"), forState: .Normal)
        view.setBackgroundImage(UIImage(named: "img_max_pl_pause"), forState: .Selected)

        return view
    }()
    
    lazy var prevButton: AHButton = {
        let view = AHButton.newAutoLayoutView()
        view.setBackgroundImage(UIImage(named: "img_max_pl_prev"), forState: .Normal)

        return view
    }()
    
    lazy var nextButton: AHButton = {
        let view = AHButton.newAutoLayoutView()
        view.setBackgroundImage(UIImage(named: "img_max_pl_next"), forState: .Normal)

        return view
    }()
    
    lazy var replayButton: AHButton = {
        let view = AHButton.newAutoLayoutView()
        view.setBackgroundImage(UIImage(named: "img_max_pl_reset"), forState: .Normal)

        return view
    }()
    
    lazy var stopButton: AHButton = {
        let view = AHButton.newAutoLayoutView()
        view.setBackgroundImage(UIImage(named: "img_max_pl_stop"), forState: .Normal)

        return view
    }()
    
    lazy var currentTimeLabel: AHLabel = {
        let view = AHLabel.newAutoLayoutView()
        view.textColor = RED_LIGHT
        view.font = TD_TIME_FONT
        view.text = "00:00"

        return view
    }()
    
    lazy var durationLabel: AHLabel = {
        let view = AHLabel.newAutoLayoutView()
        view.textColor = RED_LIGHT
        view.font = TD_TIME_FONT
        view.text = "03:00"

        return view
    }()
    
    lazy var trackListButton: AHButton = {
        let view = AHButton.newAutoLayoutView()
        view.setBackgroundImage(UIImage(named: "img_max_pl_list"), forState: .Normal)

        return view
    }()
    
    //MARK: - Initialize -
    init() {
        super.init(frame: CGRectZero)
        
        addAllUIElements()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private Methods -
    private func addAllUIElements() {
        addSubview(bgImageView)
        addSubview(slider)
        addSubview(volumeImageView)
        addSubview(volumeSlider)
        addSubview(playPauseButton)
        addSubview(prevButton)
        addSubview(nextButton)
        addSubview(replayButton)
        addSubview(stopButton)
        addSubview(currentTimeLabel)
        addSubview(durationLabel)
        addSubview(trackListButton)

        setConstraints()
    }
    
    //MARK: - Constraints -
    func setConstraints() {
        bgImageView.autoPinEdgesToSuperviewEdges()
        
        slider.autoPinEdge(.Bottom, toEdge: .Top, ofView: playPauseButton, withOffset: -TD_INSET)
        slider.autoPinEdge(.Left, toEdge: .Right, ofView: currentTimeLabel, withOffset: TD_INSET)
        slider.autoPinEdge(.Right, toEdge: .Left, ofView: durationLabel, withOffset: -TD_INSET)
        
        volumeImageView.autoAlignAxis(.Horizontal, toSameAxisOfView: volumeSlider)
        volumeImageView.autoPinEdge(.Right, toEdge: .Left, ofView: volumeSlider, withOffset: -TD_INSET)
        volumeImageView.autoSetDimensionsToSize(CGSize(width: TD_BTN_SIZE*0.4, height: TD_BTN_SIZE*0.4))
        
        volumeSlider.autoPinEdge(.Top, toEdge: .Bottom, ofView: playPauseButton, withOffset: TD_OFFSET)
        volumeSlider.autoPinEdge(.Left, toEdge: .Right, ofView: currentTimeLabel, withOffset: TD_INSET)
        volumeSlider.autoMatchDimension(.Width, toDimension: .Width, ofView: slider, withMultiplier: 0.3)

        currentTimeLabel.autoAlignAxis(.Horizontal, toSameAxisOfView: slider)
        currentTimeLabel.autoPinEdgeToSuperviewEdge(.Left, withInset: TD_OFFSET)
        currentTimeLabel.autoSetDimension(.Width, toSize: TD_OFFSET*2)
        
        durationLabel.autoAlignAxis(.Horizontal, toSameAxisOfView: slider)
        durationLabel.autoPinEdgeToSuperviewEdge(.Right, withInset: TD_OFFSET)
        durationLabel.autoSetDimension(.Width, toSize: TD_OFFSET*2)

        trackListButton.autoAlignAxis(.Horizontal, toSameAxisOfView: volumeSlider)
        trackListButton.autoPinEdgeToSuperviewEdge(.Right, withInset: TD_INSET)
        trackListButton.autoSetDimensionsToSize(CGSize(width: TD_BBTN_SIZE, height: TD_BBTN_SIZE))
        
        let items = [playPauseButton, stopButton, prevButton, nextButton, replayButton]
        
        for (index, item) in items.enumerate() {
            switch index {
            case 0, 1:
                item.autoSetDimensionsToSize(CGSize(width: TD_BBTN_SIZE, height: TD_BBTN_SIZE))
            default:
                item.autoSetDimensionsToSize(CGSize(width: TD_BBTN_SIZE*0.8, height: TD_BBTN_SIZE*0.8))
            }
        }
        
        items.first!.autoPinEdge(.Left, toEdge: .Left, ofView: slider)
        items.first!.autoAlignAxisToSuperviewAxis(.Horizontal)
        for  (index, item) in items.enumerate() {
            if index != 0 {
                item.autoAlignAxisToSuperviewAxis(.Horizontal)
                item.autoPinEdge(.Left, toEdge: .Right, ofView: items[index - 1], withOffset: TD_INSET/2)
            }
        }
        
    }
}