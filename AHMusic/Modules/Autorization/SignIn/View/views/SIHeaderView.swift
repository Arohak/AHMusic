//
//  SIHeaderView.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 5/22/16.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//


class SIHeaderView: UIView {
    
    //MARK: - Create UIElements -
    let logoImageView: UIImageView = {
        let view = UIImageView.newAutoLayoutView()
        view.backgroundColor = RED_LIGHT
        view.image = UIImage(named: "img_login_logo")
        
        return view
    }()
    
    let titleLabel: AHLabel = {
        let view = AHLabel.newAutoLayoutView()
        view.text = "AAA BBB CCC"
        view.textAlignment = .Center
        
        return view
    }()
    
    //MARK: - Initialize -
    override init(frame : CGRect) {
        super.init(frame: frame)
        
        self.addAllUIElements()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private Methods -
    private func addAllUIElements() {
        self.addSubview(logoImageView)
        self.addSubview(titleLabel)
        
        self.setConstraints()
    }
    
    //MARK: - Constraints -
    func setConstraints() {
        logoImageView.autoAlignAxisToSuperviewAxis(.Horizontal)
        logoImageView.autoAlignAxisToSuperviewAxis(.Vertical)
        logoImageView.autoSetDimensionsToSize(CGSizeMake(100, 100))
        
        titleLabel.autoPinEdge(.Top, toEdge: .Bottom, ofView: logoImageView, withOffset: 10)
        titleLabel.autoAlignAxisToSuperviewAxis(.Vertical)
        titleLabel.autoMatchDimension(.Width, toDimension: .Width, ofView: logoImageView, withMultiplier: 1.5)
    }
}