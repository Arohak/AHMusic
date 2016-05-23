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
        let view = AHButton.newAutoLayoutView()
        view.backgroundColor = RED_LIGHT
        view.setTitle("Sign In", forState: .Normal)
        view.setTitleColor(WHITE, forState: .Normal)
        view.layer.cornerRadius = SI_OFFSET

        return view
    }()
    
    let facebookButton: AHButton = {
        let view = AHButton.newAutoLayoutView()
        view.backgroundColor = BLUE
        view.setTitle("Facebook", forState: .Normal)
        view.setTitleColor(WHITE, forState: .Normal)
        view.layer.cornerRadius = SI_OFFSET
        
        return view
    }()
    
    let googleButton: AHButton = {
        let view = AHButton.newAutoLayoutView()
        view.backgroundColor = RED
        view.setTitle("Google +", forState: .Normal)
        view.setTitleColor(WHITE, forState: .Normal)
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
    private func addAllUIElements() {
        addSubview(signInButton)
        addSubview(facebookButton)
        addSubview(googleButton)

        setConstraints()
    }
    
    //MARK: - Set Constraints -
    func setConstraints() {
        signInButton.autoPinEdge(.Bottom, toEdge: .Top, ofView: facebookButton, withOffset: -SI_OFFSET)
        signInButton.autoAlignAxisToSuperviewAxis(.Vertical)
        signInButton.autoSetDimensionsToSize(CGSize(width: AU_FIELD_WIDTH, height: AU_BTN_HEIGHT))
        
        facebookButton.autoPinEdge(.Bottom, toEdge: .Top, ofView: googleButton, withOffset: -SI_OFFSET)
        facebookButton.autoAlignAxisToSuperviewAxis(.Vertical)
        facebookButton.autoSetDimensionsToSize(CGSize(width: AU_FIELD_WIDTH, height: AU_BTN_HEIGHT))
        
        googleButton.autoPinEdgeToSuperviewEdge(.Bottom)
        googleButton.autoAlignAxisToSuperviewAxis(.Vertical)
        googleButton.autoSetDimensionsToSize(CGSize(width: AU_FIELD_WIDTH, height: AU_BTN_HEIGHT))
    }
}
