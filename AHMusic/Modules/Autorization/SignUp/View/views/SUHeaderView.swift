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
        let view = UIImageView.newAutoLayout()
        view.image = UIImage(named: "img_si_logo")
        
        return view
    }()
    
    let titleLabel: AHLabel = {
        let view = AHLabel.newAutoLayout()
        view.text = ""
        view.textAlignment = .center
        
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
    fileprivate func addAllUIElements() {
        self.addSubview(logoImageView)
        self.addSubview(titleLabel)
        
        self.setConstraints()
    }
    
    //MARK: - Constraints -
    func setConstraints() {
//        logoImageView.autoAlignAxis(.Horizontal, toSameAxisOfView: self, withOffset: -SI_OFFSET*2)
//        logoImageView.autoAlignAxisToSuperviewAxis(.Vertical)
        logoImageView.autoCenterInSuperview()
        logoImageView.autoSetDimensions(to: CGSize(width: SI_LOGO_SIZE, height: SI_LOGO_SIZE))
        
        titleLabel.autoPinEdge(.top, to: .bottom, of: logoImageView, withOffset: SI_OFFSET)
        titleLabel.autoAlignAxis(toSuperviewAxis: .vertical)
        titleLabel.autoMatch(.width, to: .width, of: logoImageView, withMultiplier: 1.5)
    }
}
