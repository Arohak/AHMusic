//
//  SIFooterView.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 5/22/16.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//


class SIFooterView: UIView {
    
    //MARK: - Create UIElements -
    let signInButton: AHButton = {
        let view = AHButton.newAutoLayout()
        view.backgroundColor = RED_LIGHT
        view.setTitle("Sign In", for: .normal)
        view.setTitleColor(WHITE, for: .normal)
        view.layer.cornerRadius = SI_OFFSET

        return view
    }()
    
    let facebookButton: AHButton = {
        let view = AHButton.newAutoLayout()
        view.backgroundColor = BLUE
        view.setTitle("Facebook", for: .normal)
        view.setTitleColor(WHITE, for: .normal)
        view.layer.cornerRadius = SI_OFFSET
        
        return view
    }()
    
    let googleButton: AHButton = {
        let view = AHButton.newAutoLayout()
        view.backgroundColor = RED
        view.setTitle("Google +", for: .normal)
        view.setTitleColor(WHITE, for: .normal)
        view.layer.cornerRadius = SI_OFFSET
        
        return view
    }()
    
    //MARK: - Initialize -
    override init(frame : CGRect) {
        super.init(frame: frame)
        
        addAllUIElements()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private Methods -
    fileprivate func addAllUIElements() {
        addSubview(signInButton)
        addSubview(facebookButton)
        addSubview(googleButton)

        setConstraints()
    }
    
    //MARK: - Set Constraints -
    func setConstraints() {
        signInButton.autoPinEdge(.bottom, to: .top, of: facebookButton, withOffset: -SI_OFFSET)
        signInButton.autoAlignAxis(toSuperviewAxis: .vertical)
        signInButton.autoSetDimensions(to: CGSize(width: AU_FIELD_WIDTH, height: AU_BTN_HEIGHT))
        
        facebookButton.autoPinEdge(.bottom, to: .top, of: googleButton, withOffset: -SI_OFFSET)
        facebookButton.autoAlignAxis(toSuperviewAxis: .vertical)
        facebookButton.autoSetDimensions(to: CGSize(width: AU_FIELD_WIDTH, height: AU_BTN_HEIGHT))
        
        googleButton.autoPinEdge(toSuperviewEdge: .bottom)
        googleButton.autoAlignAxis(toSuperviewAxis: .vertical)
        googleButton.autoSetDimensions(to: CGSize(width: AU_FIELD_WIDTH, height: AU_BTN_HEIGHT))
    }
}
