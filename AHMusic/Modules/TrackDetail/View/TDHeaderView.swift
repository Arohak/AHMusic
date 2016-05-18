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
        addSubview(gifImageView)
        addSubview(imageView)
        
        setConstraints()
    }
    
    //MARK: - Constraints -
    func setConstraints() {
        gifImageView.autoPinEdgeToSuperviewEdge(.Top)
        gifImageView.autoPinEdgeToSuperviewEdge(.Left)
        gifImageView.autoPinEdgeToSuperviewEdge(.Right)
        gifImageView.autoSetDimension(.Height, toSize: TD_HEIGHT*0.35)
        
        imageView.autoPinEdge(.Top, toEdge: .Bottom, ofView: gifImageView)
        imageView.autoPinEdgeToSuperviewEdge(.Left)
        imageView.autoPinEdgeToSuperviewEdge(.Right)
        imageView.autoPinEdgeToSuperviewEdge(.Bottom)
    }
}