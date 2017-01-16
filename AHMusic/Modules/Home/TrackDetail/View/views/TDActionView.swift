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
        let view = UIImageView.newAutoLayout()

        return view
    }()

    lazy var slider: UISlider = {
        let view = UISlider.newAutoLayout()
        view.setThumbImage(UIImage(named: "img_max_pl_slider")!, for: .normal)
        view.tintColor = RED_LIGHT
        
        return view
    }()
    
    lazy var volumeImageView: UIImageView = {
        let view = UIImageView.newAutoLayout()
        view.image = UIImage(named: "img_max_pl_sound")
        
        return view
    }()
    
    lazy var volumeSlider: UISlider = {
        let view = UISlider.newAutoLayout()
        view.setThumbImage(UIImage(named: "img_max_pl_slider")!, for: .normal)
        view.tintColor = RED_LIGHT
        
        return view
    }()
    
    lazy var playPauseButton: AHButton = {
        let view = AHButton.newAutoLayout()
        view.setBackgroundImage(UIImage(named: "img_max_pl_play"), for: .normal)
        view.setBackgroundImage(UIImage(named: "img_max_pl_pause"), for: .selected)

        return view
    }()
    
    lazy var prevButton: AHButton = {
        let view = AHButton.newAutoLayout()
        view.setBackgroundImage(UIImage(named: "img_max_pl_prev"), for: .normal)

        return view
    }()
    
    lazy var nextButton: AHButton = {
        let view = AHButton.newAutoLayout()
        view.setBackgroundImage(UIImage(named: "img_max_pl_next"), for: .normal)

        return view
    }()
    
    lazy var replayButton: AHButton = {
        let view = AHButton.newAutoLayout()
        view.setBackgroundImage(UIImage(named: "img_max_pl_reset"), for: .normal)

        return view
    }()
    
    lazy var stopButton: AHButton = {
        let view = AHButton.newAutoLayout()
        view.setBackgroundImage(UIImage(named: "img_max_pl_stop"), for: .normal)

        return view
    }()
    
    lazy var currentTimeLabel: AHLabel = {
        let view = AHLabel.newAutoLayout()
        view.textColor = RED_LIGHT
        view.font = TD_TIME_FONT
        view.text = "00:00"

        return view
    }()
    
    lazy var durationLabel: AHLabel = {
        let view = AHLabel.newAutoLayout()
        view.textColor = RED_LIGHT
        view.font = TD_TIME_FONT
        view.text = "03:00"

        return view
    }()
    
    lazy var trackListButton: AHButton = {
        let view = AHButton.newAutoLayout()
        view.setBackgroundImage(UIImage(named: "img_max_pl_list"), for: .normal)

        return view
    }()
    
    //MARK: - Initialize -
    init() {
        super.init(frame: CGRect.zero)
        
        addAllUIElements()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private Methods -
    fileprivate func addAllUIElements() {
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
        
        slider.autoPinEdge(.bottom, to: .top, of: playPauseButton, withOffset: -TD_INSET)
        slider.autoPinEdge(.left, to: .right, of: currentTimeLabel, withOffset: TD_INSET)
        slider.autoPinEdge(.right, to: .left, of: durationLabel, withOffset: -TD_INSET)
        
        volumeImageView.autoAlignAxis(.horizontal, toSameAxisOf: volumeSlider)
        volumeImageView.autoPinEdge(.right, to: .left, of: volumeSlider, withOffset: -TD_INSET)
        volumeImageView.autoSetDimensions(to: CGSize(width: TD_BTN_SIZE*0.4, height: TD_BTN_SIZE*0.4))
        
        volumeSlider.autoPinEdge(.top, to: .bottom, of: playPauseButton, withOffset: TD_OFFSET)
        volumeSlider.autoPinEdge(.left, to: .right, of: currentTimeLabel, withOffset: TD_INSET)
        volumeSlider.autoMatch(.width, to: .width, of: slider, withMultiplier: 0.3)

        currentTimeLabel.autoAlignAxis(.horizontal, toSameAxisOf: slider)
        currentTimeLabel.autoPinEdge(toSuperviewEdge: .left, withInset: TD_OFFSET)
        currentTimeLabel.autoSetDimension(.width, toSize: TD_OFFSET*2)
        
        durationLabel.autoAlignAxis(.horizontal, toSameAxisOf: slider)
        durationLabel.autoPinEdge(toSuperviewEdge: .right, withInset: TD_OFFSET)
        durationLabel.autoSetDimension(.width, toSize: TD_OFFSET*2)

        trackListButton.autoAlignAxis(.horizontal, toSameAxisOf: volumeSlider)
        trackListButton.autoPinEdge(toSuperviewEdge: .right, withInset: TD_INSET)
        trackListButton.autoSetDimensions(to: CGSize(width: TD_BBTN_SIZE, height: TD_BBTN_SIZE))
        
        let items = [playPauseButton, stopButton, prevButton, nextButton, replayButton]
        
        for (index, item) in items.enumerated() {
            switch index {
            case 0, 1:
                item.autoSetDimensions(to: CGSize(width: TD_BBTN_SIZE, height: TD_BBTN_SIZE))
            default:
                item.autoSetDimensions(to: CGSize(width: TD_BBTN_SIZE*0.8, height: TD_BBTN_SIZE*0.8))
            }
        }
        
        items.first!.autoPinEdge(.left, to: .left, of: slider)
        items.first!.autoAlignAxis(toSuperviewAxis: .horizontal)
        for  (index, item) in items.enumerated() {
            if index != 0 {
                item.autoAlignAxis(toSuperviewAxis: .horizontal)
                item.autoPinEdge(.left, to: .right, of: items[index - 1], withOffset: TD_INSET/2)
            }
        }
        
    }
}
