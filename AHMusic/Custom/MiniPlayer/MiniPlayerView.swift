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
        player.autoSetDimension(.height, toSize: PL_HEIGHT)
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
        view.setImage(UIImage(named: "img_pl_play"), for: .normal)
        view.setImage(UIImage(named: "img_pl_pause"), for: .selected)
        view.imageEdgeInsets = UIEdgeInsets(top: PL_HEIGHT*0.13, left: PL_HEIGHT*0.13, bottom: PL_HEIGHT*0.13, right: PL_HEIGHT*0.13)

        return view
    }()
    
    lazy var prevButton: AHButton = {
        let view = AHButton.newAutoLayout()
        view.setImage(UIImage(named: "img_pl_prev"), for: .normal)
        view.imageEdgeInsets = UIEdgeInsets(top: PL_HEIGHT*0.27, left: PL_HEIGHT*0.27, bottom: PL_HEIGHT*0.27, right: PL_HEIGHT*0.27)

        return view
    }()
    
    lazy var nextButton: AHButton = {
        let view = AHButton.newAutoLayout()
        view.setImage(UIImage(named: "img_pl_next"), for: .normal)
        view.imageEdgeInsets = UIEdgeInsets(top: PL_HEIGHT*0.27, left: PL_HEIGHT*0.27, bottom: PL_HEIGHT*0.27, right: PL_HEIGHT*0.27)

        return view
    }()
    
    lazy var closeButton: AHButton = {
        let view = AHButton.newAutoLayout()
        view.setImage(UIImage(named: "img_pl_close"), for: .normal)
        view.imageEdgeInsets = UIEdgeInsets(top: PL_HEIGHT*0.27, left: PL_HEIGHT*0.27, bottom: PL_HEIGHT*0.27, right: PL_HEIGHT*0.27)

        return view
    }()
    
    lazy var titleLabel: AHLabel = {
        let view = AHLabel.newAutoLayout()
        view.font = TD_TIME_FONT
        view.numberOfLines = 3

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
        
        slider.autoPinEdge(toSuperviewEdge: .top)
        slider.autoPinEdge(toSuperviewEdge: .left)
        slider.autoPinEdge(toSuperviewEdge: .right)
        
        titleLabel.autoAlignAxis(.horizontal, toSameAxisOf: playPauseButton)
        titleLabel.autoPinEdge(.left, to: .right, of: nextButton)
        titleLabel.autoPinEdge(.right, to: .left, of: closeButton)
        
        prevButton.autoAlignAxis(.horizontal, toSameAxisOf: playPauseButton)
        prevButton.autoPinEdge(toSuperviewEdge: .left)
        prevButton.autoSetDimensions(to: CGSize(width: PL_HEIGHT, height: PL_HEIGHT))
        
        playPauseButton.autoAlignAxis(toSuperviewAxis: .horizontal)
        playPauseButton.autoPinEdge(.left, to: .right, of: prevButton)
        playPauseButton.autoSetDimensions(to: CGSize(width: PL_HEIGHT, height: PL_HEIGHT))
        
        nextButton.autoAlignAxis(.horizontal, toSameAxisOf: playPauseButton)
        nextButton.autoPinEdge(.left, to: .right, of: playPauseButton)
        nextButton.autoSetDimensions(to: CGSize(width: PL_HEIGHT, height: PL_HEIGHT))
        
        closeButton.autoAlignAxis(.horizontal, toSameAxisOf: playPauseButton)
        closeButton.autoPinEdge(toSuperviewEdge: .right)
        closeButton.autoSetDimensions(to: CGSize(width: PL_HEIGHT, height: PL_HEIGHT))
    }
}
