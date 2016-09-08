//
//  SUHeaderView.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 5/22/16.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class SUHeaderView: UIView {
    
    //MARK: - Create UIElements -
    let logoImageView: UIImageView = {
        let view = UIImageView.newAutoLayoutView()
        view.image = UIImage(named: "img_si_logo")
        
        return view
    }()
    
    let titleLabel: AHLabel = {
        let view = AHLabel.newAutoLayoutView()
        view.text = ""
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
//        logoImageView.autoAlignAxis(.Horizontal, toSameAxisOfView: self, withOffset: -SI_OFFSET*2)
//        logoImageView.autoAlignAxisToSuperviewAxis(.Vertical)
        logoImageView.autoCenterInSuperview()
        logoImageView.autoSetDimensionsToSize(CGSizeMake(SI_LOGO_SIZE, SI_LOGO_SIZE))
        
        titleLabel.autoPinEdge(.Top, toEdge: .Bottom, ofView: logoImageView, withOffset: SI_OFFSET)
        titleLabel.autoAlignAxisToSuperviewAxis(.Vertical)
        titleLabel.autoMatchDimension(.Width, toDimension: .Width, ofView: logoImageView, withMultiplier: 1.5)
    }
}