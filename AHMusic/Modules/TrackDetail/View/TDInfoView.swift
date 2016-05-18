//
//  TDInfoView.swift
//  AHMusic
//
//  Created by Hakobyan Ara on 5/17/16.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class TDInfoView: UIView {
    
    //MARK: - Create UIElements -
    lazy var bgImageView: UIImageView = {
        let view = UIImageView.newAutoLayoutView()
        view.backgroundColor = BLUE_LIGHT
        
        return view
    }()
    
    lazy var titleLabel: AHLabel = {
        let view = AHLabel.newAutoLayoutView()
        view.text = "Name AAAA"
        
        return view
    }()
    
    lazy var shareButton: AHButton = {
        let view = AHButton.newAutoLayoutView()
        view.backgroundColor = WHITE

        return view
    }()
    
    lazy var loveButton: AHButton = {
        let view = AHButton.newAutoLayoutView()
        view.backgroundColor = UIColor.orangeColor()

        return view
    }()
    
    lazy var ratingImageView: UIImageView = {
        let view = UIImageView.newAutoLayoutView()
        view.backgroundColor = UIColor.blackColor()

        return view
    }()
    
    lazy var dateLabel: AHLabel = {
        let view = AHLabel.newAutoLayoutView()
        view.font = TD_DATE_FONT
        view.text = "2016.11.09"

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
        addSubview(bgImageView)
        addSubview(titleLabel)
        addSubview(shareButton)
        addSubview(loveButton)
        addSubview(ratingImageView)
        addSubview(dateLabel)
        
        setConstraints()
    }
    
    //MARK: - Constraints -
    func setConstraints() {
        bgImageView.autoPinEdgesToSuperviewEdges()
        
        titleLabel.autoPinEdgeToSuperviewEdge(.Top, withInset: TD_INSET)
        titleLabel.autoPinEdgeToSuperviewEdge(.Left, withInset: TD_OFFSET)
        titleLabel.autoPinEdgeToSuperviewEdge(.Right, withInset: TD_OFFSET)

        shareButton.autoPinEdgeToSuperviewEdge(.Bottom, withInset: TD_INSET)
        shareButton.autoPinEdgeToSuperviewEdge(.Left, withInset: TD_OFFSET)
        shareButton.autoSetDimensionsToSize(CGSize(width: TD_BTN_SIZE, height: TD_BTN_SIZE))
        
        loveButton.autoAlignAxis(.Horizontal, toSameAxisOfView: shareButton)
        loveButton.autoPinEdge(.Left, toEdge: .Right, ofView: shareButton, withOffset: TD_OFFSET)
        loveButton.autoSetDimensionsToSize(CGSize(width: TD_BTN_SIZE, height: TD_BTN_SIZE))
        
        ratingImageView.autoAlignAxis(.Horizontal, toSameAxisOfView: shareButton)
        ratingImageView.autoPinEdge(.Left, toEdge: .Right, ofView: loveButton, withOffset: TD_OFFSET)
        ratingImageView.autoSetDimensionsToSize(CGSize(width: TD_BTN_SIZE*4, height: TD_BTN_SIZE))
        
        dateLabel.autoAlignAxis(.Horizontal, toSameAxisOfView: shareButton)
        dateLabel.autoPinEdgeToSuperviewEdge(.Right, withInset: TD_OFFSET)
    }
}