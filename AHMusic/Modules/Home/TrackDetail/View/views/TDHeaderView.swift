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
        let gif = UIImage.gif(name: "gif_sound1")
        let view = UIImageView(image: gif)

        return view
    }()
    
    lazy var imageView: UIImageView = {
        let view = UIImageView.newAutoLayout()
        view.isUserInteractionEnabled = true
        view.layer.cornerRadius = TD_INSET
        view.clipsToBounds = true
        view.contentMode = .scaleAspectFill

        return view
    }()
    
    lazy var favoriteButton: AHButton = {
        let view = AHButton.newAutoLayout()
        view.setBackgroundImage(UIImage(named: "img_tr_favorite"), for: .normal)
        view.setBackgroundImage(UIImage(named: "img_tr_favorite_select"), for: .selected)

        return view
    }()
    
    lazy var downloadButton: AHButton = {
        let view = AHButton.newAutoLayout()
        view.setBackgroundImage(UIImage(named: "img_tr_download"), for: .normal)
        view.setBackgroundImage(UIImage(named: "img_tr_download_select"), for: .selected)
        
        return view
    }()
    
    lazy var titleLabel: AHLabel = {
        let view = AHLabel.newAutoLayout()
        view.textAlignment = .center
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
        addSubview(gifImageView)
        addSubview(imageView)
        imageView.addSubview(favoriteButton)
//        imageView.addSubview(downloadButton)
        addSubview(titleLabel)
        
        setConstraints()
    }
    
    //MARK: - Constraints -
    func setConstraints() {
        gifImageView.autoPinEdge(toSuperviewEdge: .top)
        gifImageView.autoPinEdge(toSuperviewEdge: .left)
        gifImageView.autoPinEdge(toSuperviewEdge: .right)
        gifImageView.autoSetDimension(.height, toSize: TD_HEIGHT*0.35)
        
        favoriteButton.autoPinEdge(toSuperviewEdge: .left)
        favoriteButton.autoPinEdge(toSuperviewEdge: .bottom)
        favoriteButton.autoSetDimensions(to: CGSize(width: TD_BBTN_SIZE, height: TD_BBTN_SIZE))

//        downloadButton.autoPinEdge(toSuperviewEdge: .right)
//        downloadButton.autoPinEdge(toSuperviewEdge: .bottom)
//        downloadButton.autoSetDimensions(to: CGSize(width: TD_BBTN_SIZE, height: TD_BBTN_SIZE))
        
        imageView.autoPinEdge(.top, to: .bottom, of: gifImageView)
        imageView.autoPinEdge(toSuperviewEdge: .left, withInset: TD_OFFSET)
        imageView.autoPinEdge(toSuperviewEdge: .right, withInset: TD_OFFSET)
        imageView.autoPinEdge(.bottom, to: .top, of: titleLabel, withOffset: -TD_INSET)
        
        titleLabel.autoPinEdge(.top, to: .bottom, of: imageView, withOffset: TD_INSET)
        titleLabel.autoPinEdge(toSuperviewEdge: .left, withInset: TD_OFFSET)
        titleLabel.autoPinEdge(toSuperviewEdge: .right, withInset: TD_OFFSET)
        titleLabel.autoPinEdge(toSuperviewEdge: .bottom)
    }
}
