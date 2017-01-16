//
//  MiniPlayerView.swift
//  AHMusic
//
//  Created by Hakobyan Ara on 5/17/16.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

//MARK: - MiniPlayerView -
class MiniPlayerView: UIView {
    
    //MARK: - Create UIElements -
    lazy var bgView: UIView = {
        let view = UIView.newAutoLayout()
        view.backgroundColor = BLACK
        view.alpha = 0.1
            
        return view
    }()
    
    lazy var player: PlayerView = {
        let view = PlayerView.newAutoLayout()
        
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
        addSubview(bgView)
        addSubview(player)
        
        setConstraints()
    }
    
    //MARK: - Constraints -
    func setConstraints() {
        bgView.autoPinEdgesToSuperviewEdges()
        
        player.autoPinEdge(toSuperviewEdge: .left)
        player.autoPinEdge(toSuperviewEdge: .right)
        player.autoPinEdge(toSuperviewEdge: .bottom)
        player.autoSetDimension(.height, toSize: TD_BTN_SIZE*1.5)
    }
}

//MARK: - PlayerView -
class PlayerView: UIView {
    
    //MARK: - Create UIElements -
    lazy var bgImageView: UIImageView = {
        let view = UIImageView.newAutoLayout()
        view.backgroundColor = BLACK
        view.alpha = 0.6

        return view
    }()

    lazy var slider: UISlider = {
        let view = UISlider.newAutoLayout()
        view.minimumTrackTintColor = BLUE_LIGHT
        view.setThumbImage(UIImage(named: "img_pl_slider")!, for: .normal)
        
        return view
    }()
    
    lazy var playPauseButton: AHButton = {
        let view = AHButton.newAutoLayout()
        view.setBackgroundImage(UIImage(named: "img_pl_play"), for: .normal)
        view.setBackgroundImage(UIImage(named: "img_pl_pause"), for: .selected)

        return view
    }()
    
    lazy var prevButton: AHButton = {
        let view = AHButton.newAutoLayout()
        view.setBackgroundImage(UIImage(named: "img_pl_prev"), for: .normal)

        return view
    }()
    
    lazy var nextButton: AHButton = {
        let view = AHButton.newAutoLayout()
        view.setBackgroundImage(UIImage(named: "img_pl_next"), for: .normal)

        return view
    }()
    
    lazy var closeButton: AHButton = {
        let view = AHButton.newAutoLayout()
        view.setBackgroundImage(UIImage(named: "img_pl_close"), for: .normal)
        
        return view
    }()
    
    lazy var titleLabel: AHLabel = {
        let view = AHLabel.newAutoLayout()
        view.font = TD_TIME_FONT
        view.numberOfLines = 0

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
        addSubview(titleLabel)
        addSubview(playPauseButton)
        addSubview(prevButton)
        addSubview(nextButton)
        addSubview(closeButton)

        setConstraints()
    }
    
    //MARK: - Constraints -
    func setConstraints() {
        bgImageView.autoPinEdgesToSuperviewEdges()
        
        slider.autoPinEdge(toSuperviewEdge: .top, withInset: 0)
        slider.autoPinEdge(toSuperviewEdge: .left, withInset: 0)
        slider.autoPinEdge(toSuperviewEdge: .right, withInset: 0)
        
        titleLabel.autoAlignAxis(.horizontal, toSameAxisOf: playPauseButton)
        titleLabel.autoPinEdge(.left, to: .right, of: nextButton, withOffset: TD_OFFSET)
        titleLabel.autoPinEdge(.right, to: .left, of: closeButton, withOffset: -TD_OFFSET)
        
        prevButton.autoAlignAxis(.horizontal, toSameAxisOf: playPauseButton)
        prevButton.autoPinEdge(toSuperviewEdge: .left, withInset: TD_OFFSET)
        prevButton.autoSetDimensions(to: CGSize(width: TD_BTN_SIZE*0.7, height: TD_BTN_SIZE*0.7))
        
        playPauseButton.autoAlignAxis(toSuperviewAxis: .horizontal)
        playPauseButton.autoPinEdge(.left, to: .right, of: prevButton, withOffset: TD_OFFSET)
        playPauseButton.autoSetDimensions(to: CGSize(width: TD_BTN_SIZE, height: TD_BTN_SIZE))
        
        nextButton.autoAlignAxis(.horizontal, toSameAxisOf: playPauseButton)
        nextButton.autoPinEdge(.left, to: .right, of: playPauseButton, withOffset: TD_OFFSET)
        nextButton.autoSetDimensions(to: CGSize(width: TD_BTN_SIZE*0.7, height: TD_BTN_SIZE*0.7))
        
        closeButton.autoAlignAxis(.horizontal, toSameAxisOf: playPauseButton)
        closeButton.autoPinEdge(toSuperviewEdge: .right, withInset: TD_OFFSET)
        closeButton.autoSetDimensions(to: CGSize(width: TD_BTN_SIZE*0.7, height: TD_BTN_SIZE*0.7))
    }
}
