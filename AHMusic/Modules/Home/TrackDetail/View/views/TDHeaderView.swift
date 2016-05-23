//
//  TDHeaderView.swift
//  AHMusic
//
//  Created by Hakobyan Ara on 5/17/16.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

import SwiftGifOrigin

class TDHeaderView: UIView {
    
    //MARK: - Create UIElements -
    lazy var gifImageView: UIImageView = {
        let gif = UIImage.gifWithName("gif_sound1")
        let view = UIImageView(image: gif)

        return view
    }()
    
    lazy var imageView: UIImageView = {
        let view = UIImageView.newAutoLayoutView()
        view.userInteractionEnabled = true
        view.layer.cornerRadius = TD_INSET
        view.clipsToBounds = true
        view.contentMode = .ScaleAspectFill

        return view
    }()
    
    lazy var favoriteButton: AHButton = {
        let view = AHButton.newAutoLayoutView()
        view.setBackgroundImage(UIImage(named: "img_tr_favorite"), forState: .Normal)
        view.setBackgroundImage(UIImage(named: "img_tr_favorite_select"), forState: .Selected)

        return view
    }()
    
    lazy var downloadButton: AHButton = {
        let view = AHButton.newAutoLayoutView()
        view.setBackgroundImage(UIImage(named: "img_tr_download"), forState: .Normal)
        view.setBackgroundImage(UIImage(named: "img_tr_download_select"), forState: .Selected)
        
        return view
    }()
    
    lazy var titleLabel: AHLabel = {
        let view = AHLabel.newAutoLayoutView()
        view.textAlignment = .Center
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
    
    //MARK: - Private Methods -
    private func addAllUIElements() {
        addSubview(gifImageView)
        addSubview(imageView)
        imageView.addSubview(favoriteButton)
        imageView.addSubview(downloadButton)
        addSubview(titleLabel)
        
        setConstraints()
    }
    
    //MARK: - Constraints -
    func setConstraints() {
        gifImageView.autoPinEdgeToSuperviewEdge(.Top)
        gifImageView.autoPinEdgeToSuperviewEdge(.Left)
        gifImageView.autoPinEdgeToSuperviewEdge(.Right)
        gifImageView.autoSetDimension(.Height, toSize: TD_HEIGHT*0.35)
        
        favoriteButton.autoPinEdgeToSuperviewEdge(.Left)
        favoriteButton.autoPinEdgeToSuperviewEdge(.Bottom)
        favoriteButton.autoSetDimensionsToSize(CGSize(width: TD_BBTN_SIZE, height: TD_BBTN_SIZE))

        downloadButton.autoPinEdgeToSuperviewEdge(.Right)
        downloadButton.autoPinEdgeToSuperviewEdge(.Bottom)
        downloadButton.autoSetDimensionsToSize(CGSize(width: TD_BBTN_SIZE, height: TD_BBTN_SIZE))
        
        imageView.autoPinEdge(.Top, toEdge: .Bottom, ofView: gifImageView)
        imageView.autoPinEdgeToSuperviewEdge(.Left, withInset: TD_OFFSET)
        imageView.autoPinEdgeToSuperviewEdge(.Right, withInset: TD_OFFSET)
        imageView.autoPinEdge(.Bottom, toEdge: .Top, ofView: titleLabel, withOffset: -TD_INSET)
        
        titleLabel.autoPinEdge(.Top, toEdge: .Bottom, ofView: imageView, withOffset: TD_INSET)
        titleLabel.autoPinEdgeToSuperviewEdge(.Left, withInset: TD_OFFSET)
        titleLabel.autoPinEdgeToSuperviewEdge(.Right, withInset: TD_OFFSET)
        titleLabel.autoPinEdgeToSuperviewEdge(.Bottom)
    }
}