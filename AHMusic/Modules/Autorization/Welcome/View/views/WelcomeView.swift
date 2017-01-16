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
        let view = AHButton.newAutoLayout()
        view.setTitle("Sign In", for: .normal)
        view.titleLabel?.font = AU_BTN_FONT
        view.layer.cornerRadius = WE_INSET/3
        view.layer.borderColor = WHITE.cgColor
        view.layer.borderWidth = 1
        
        return view
    }()
    
    lazy var signUpButton: AHButton = {
        let view = AHButton.newAutoLayout()
        view.setTitle("Sign Up", for: .normal)
        view.titleLabel?.font = AU_BTN_FONT
        view.layer.cornerRadius = WE_INSET/3
        view.layer.borderColor = WHITE.cgColor
        view.layer.borderWidth = 1
        
        return view
    }()
    
    lazy var guestButton: AHButton = {
        let view = AHButton.newAutoLayout()
        view.setTitle("Guest", for: .normal)
        view.titleLabel?.font = AU_BTN_FONT
        view.layer.cornerRadius = WE_INSET/3
        view.layer.borderColor = WHITE.cgColor
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
    fileprivate func addAllUIElements() {
        addSubview(imageView)
        addSubview(signInButton)
        addSubview(signUpButton)
        addSubview(guestButton)

        setConstraints()
    }
    
    //MARK: - Constraints -
    func setConstraints() {
        imageView.autoPinEdge(toSuperviewEdge: .top, withInset: WE_INSET)
        imageView.autoAlignAxis(toSuperviewAxis: .vertical)
        imageView.autoSetDimensions(to: CGSize(width: WE_LOGO_SIZE, height: WE_LOGO_SIZE))
        
        signInButton.autoPinEdge(.bottom, to: .top, of: signUpButton, withOffset: -WE_OFFSET)
        signInButton.autoAlignAxis(toSuperviewAxis: .vertical)
        signInButton.autoSetDimensions(to: CGSize(width: WE_LOGO_SIZE*1.5, height: AU_BTN_HEIGHT))
        
        signUpButton.autoPinEdge(.bottom, to: .top, of: guestButton, withOffset: -WE_OFFSET)
        signUpButton.autoAlignAxis(toSuperviewAxis: .vertical)
        signUpButton.autoSetDimensions(to: CGSize(width: WE_LOGO_SIZE*1.5, height: AU_BTN_HEIGHT))
        
        guestButton.autoPinEdge(toSuperviewEdge: .bottom, withInset: WE_INSET)
        guestButton.autoAlignAxis(toSuperviewAxis: .vertical)
        guestButton.autoSetDimensions(to: CGSize(width: WE_LOGO_SIZE*1.5, height: AU_BTN_HEIGHT))
    }
}
