//
//  WelcomeView.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 5/23/16.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class WelcomeView: BaseView {
    
    lazy var imageView: UIImageView = {
        let view = UIImageView(image: UIImage(named: "img_wl_logo"))
        
        return view
    }()
    
    lazy var signInButton: AHButton = {
        let view = AHButton.newAutoLayoutView()
        view.setTitle("Sign In", forState: .Normal)
        view.titleLabel?.font = WE_BTN_FONT
        view.layer.cornerRadius = WE_INSET/3
        view.layer.borderColor = WHITE.CGColor
        view.layer.borderWidth = 1
        
        return view
    }()
    
    lazy var signUpButton: AHButton = {
        let view = AHButton.newAutoLayoutView()
        view.setTitle("Sign Up", forState: .Normal)
        view.titleLabel?.font = WE_BTN_FONT
        view.layer.cornerRadius = WE_INSET/3
        view.layer.borderColor = WHITE.CGColor
        view.layer.borderWidth = 1
        
        return view
    }()
    
    lazy var guestButton: AHButton = {
        let view = AHButton.newAutoLayoutView()
        view.setTitle("Guest", forState: .Normal)
        view.titleLabel?.font = WE_BTN_FONT
        view.layer.cornerRadius = WE_INSET/3
        view.layer.borderColor = WHITE.CGColor
        view.layer.borderWidth = 1
        
        return view
    }()
    
    //MARK: - Initialize -
    override init() {
        super.init()
        
        bgImageView.image = UIImage(named: "bg_2")
        addAllUIElements()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private Methods -
    private func addAllUIElements() {
        addSubview(imageView)
        addSubview(signInButton)
        addSubview(signUpButton)
        addSubview(guestButton)

        setConstraints()
    }
    
    //MARK: - Constraints -
    func setConstraints() {
        imageView.autoPinEdgeToSuperviewEdge(.Top, withInset: WE_INSET)
        imageView.autoAlignAxisToSuperviewAxis(.Vertical)
        imageView.autoSetDimensionsToSize(CGSize(width: WE_LOGO_SIZE, height: WE_LOGO_SIZE))
        
        signInButton.autoPinEdge(.Bottom, toEdge: .Top, ofView: signUpButton, withOffset: -WE_OFFSET)
        signInButton.autoAlignAxisToSuperviewAxis(.Vertical)
        signInButton.autoSetDimensionsToSize(CGSize(width: WE_LOGO_SIZE*1.5, height: WE_BTN_HEIGHT))
        
        signUpButton.autoPinEdge(.Bottom, toEdge: .Top, ofView: guestButton, withOffset: -WE_OFFSET)
        signUpButton.autoAlignAxisToSuperviewAxis(.Vertical)
        signUpButton.autoSetDimensionsToSize(CGSize(width: WE_LOGO_SIZE*1.5, height: WE_BTN_HEIGHT))
        
        guestButton.autoPinEdgeToSuperviewEdge(.Bottom, withInset: WE_INSET)
        guestButton.autoAlignAxisToSuperviewAxis(.Vertical)
        guestButton.autoSetDimensionsToSize(CGSize(width: WE_LOGO_SIZE*1.5, height: WE_BTN_HEIGHT))
    }
}
