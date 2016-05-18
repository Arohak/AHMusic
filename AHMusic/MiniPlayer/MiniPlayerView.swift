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
        let view = UIView.newAutoLayoutView()
        view.backgroundColor = BLACK
        view.alpha = 0.2
            
        return view
    }()
    
    lazy var player: PlayerView = {
        let view = PlayerView.newAutoLayoutView()
        
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
    
    //MARK: - Privat Methods -
    func addAllUIElements() {
        addSubview(bgView)
        addSubview(player)
        
        setConstraints()
    }
    
    //MARK: - Constraints -
    func setConstraints() {
        bgView.autoPinEdgesToSuperviewEdges()
        
        player.autoPinEdgeToSuperviewEdge(.Left)
        player.autoPinEdgeToSuperviewEdge(.Right)
        player.autoPinEdgeToSuperviewEdge(.Bottom)
        player.autoSetDimension(.Height, toSize: TD_BBTN_SIZE*2)
    }
}

//MARK: - PlayerView -
class PlayerView: UIView {
    
    //MARK: - Create UIElements -
    lazy var bgImageView: UIImageView = {
        let view = UIImageView.newAutoLayoutView()
        view.backgroundColor = BLACK

        return view
    }()

    lazy var slider: UISlider = {
        let view = UISlider.newAutoLayoutView()
        
        return view
    }()
    
    lazy var playPauseButton: AHButton = {
        let view = AHButton.newAutoLayoutView()
        view.backgroundColor = WHITE

        return view
    }()
    
    lazy var prevButton: AHButton = {
        let view = AHButton.newAutoLayoutView()
        view.backgroundColor = WHITE

        return view
    }()
    
    lazy var nextButton: AHButton = {
        let view = AHButton.newAutoLayoutView()
        view.backgroundColor = WHITE

        return view
    }()
    
    lazy var titleLabel: AHLabel = {
        let view = AHLabel.newAutoLayoutView()
        view.font = TD_TIME_FONT
        view.text = "03dhgdfhbdfgbfd:0dgdfbvdbdbdvbd0"
        view.numberOfLines = 0

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
    
    //MARK: - Privat Methods -
    private func addAllUIElements() {
        addSubview(bgImageView)
        addSubview(slider)
        addSubview(titleLabel)
        addSubview(playPauseButton)
        addSubview(prevButton)
        addSubview(nextButton)

        setConstraints()
    }
    
    //MARK: - Constraints -
    func setConstraints() {
        bgImageView.autoPinEdgesToSuperviewEdges()
        
        slider.autoPinEdgeToSuperviewEdge(.Top, withInset: 0)
        slider.autoPinEdgeToSuperviewEdge(.Left, withInset: TD_OFFSET)
        slider.autoPinEdgeToSuperviewEdge(.Right, withInset: TD_OFFSET)
        
        titleLabel.autoAlignAxis(.Horizontal, toSameAxisOfView: playPauseButton)
        titleLabel.autoPinEdge(.Left, toEdge: .Right, ofView: nextButton, withOffset: TD_OFFSET)
        titleLabel.autoPinEdgeToSuperviewEdge(.Right, withInset: TD_OFFSET)
        
        prevButton.autoAlignAxis(.Horizontal, toSameAxisOfView: playPauseButton)
        prevButton.autoPinEdgeToSuperviewEdge(.Left, withInset: TD_OFFSET)
        prevButton.autoSetDimensionsToSize(CGSize(width: TD_BTN_SIZE, height: TD_BTN_SIZE))
        
        playPauseButton.autoPinEdgeToSuperviewEdge(.Bottom, withInset: TD_INSET)
        playPauseButton.autoPinEdge(.Left, toEdge: .Right, ofView: prevButton, withOffset: TD_INSET)
        playPauseButton.autoSetDimensionsToSize(CGSize(width: TD_BBTN_SIZE, height: TD_BBTN_SIZE))
        
        nextButton.autoAlignAxis(.Horizontal, toSameAxisOfView: playPauseButton)
        nextButton.autoPinEdge(.Left, toEdge: .Right, ofView: playPauseButton, withOffset: TD_INSET)
        nextButton.autoSetDimensionsToSize(CGSize(width: TD_BTN_SIZE, height: TD_BTN_SIZE))
    }
}