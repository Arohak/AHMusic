//
//  LeftMenuView.swift
//  AHMusic
//
//  Created by Hakobyan Ara on 5/17/16.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class LeftMenuView: UIView {
    
    let maxWidth = WIDTH*0.8
    let minWidth = WIDTH*0.4
    
    //MARK: - Create UIElements -
    lazy var profile: LMGroupView = {
        let view = LMGroupView.newAutoLayout()
        view.widthConstraints.constant = self.maxWidth
        view.button.setBackgroundImage(UIImage(named: "img_lm_profile"), for: .normal)
        view.label.text = "Profile"
        
        return view
    }()
    
    lazy var home: LMGroupView = {
        let view = LMGroupView.newAutoLayout()
        view.widthConstraints.constant = self.minWidth * 1.5
        view.button.setBackgroundImage(UIImage(named: "img_lm_home"), for: .normal)
        view.button.setBackgroundImage(UIImage(named: "img_lm_home_select"), for: .selected)
        view.button.isSelected = true
        view.label.text = "Home"
        
        return view
    }()
    
    lazy var favorite: LMGroupView = {
        let view = LMGroupView.newAutoLayout()
        view.widthConstraints.constant = self.minWidth * 1.5
        view.button.setBackgroundImage(UIImage(named: "img_lm_favorite"), for: .normal)
        view.button.setBackgroundImage(UIImage(named: "img_lm_favorite_select"), for: .selected)
        view.label.text = "Favorites"

        return view
    }()
    
    lazy var download: LMGroupView = {
        let view = LMGroupView.newAutoLayout()
        view.widthConstraints.constant = self.minWidth
        view.button.setBackgroundImage(UIImage(named: "img_lm_download"), for: .normal)
        view.button.setBackgroundImage(UIImage(named: "img_lm_download_select"), for: .selected)
        view.label.text = "Offline"

        return view
    }()
    
    lazy var settings: LMGroupView = {
        let view = LMGroupView.newAutoLayout()
        view.widthConstraints.constant = self.minWidth
        view.button.setBackgroundImage(UIImage(named: "img_lm_settings"), for: .normal)
        view.button.setBackgroundImage(UIImage(named: "img_lm_settings_select"), for: .selected)
        view.label.text = "Settings"

        return view
    }()
    
    lazy var logout: LMGroupView = {
        let view = LMGroupView.newAutoLayout()
        view.widthConstraints.constant = self.minWidth
        view.button.setBackgroundImage(UIImage(named: "img_lm_logout"), for: .normal)
        view.label.text = "Logut"

        return view
    }()
    
    //MARK: - Initialize -
    init() {
        super.init(frame: CGRect.zero)
        
        backgroundColor = BLACK_59
        addAllUIElements()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private Methods -
    fileprivate func addAllUIElements() {
//        addSubview(profile)
        addSubview(home)
        addSubview(favorite)
//        addSubview(download)
//        addSubview(settings)
//        addSubview(logout)

        setConstraints()
    }
    
    //MARK: - Constraints -
    func setConstraints() {
//        profile.autoPinEdge(toSuperviewEdge: .top, withInset: LM_INSET)
//        profile.autoPinEdge(toSuperviewEdge: .left)
//        profile.autoPinEdge(toSuperviewEdge: .right)
//        profile.autoPinEdge(.bottom, to: .bottom, of: profile.label)
        
//        home.autoPinEdge(.top, to: .bottom, of: profile, withOffset: LM_INSET)
        home.autoPinEdge(toSuperviewEdge: .top, withInset: LM_INSET)
        home.autoPinEdge(toSuperviewEdge: .left)
        home.autoPinEdge(toSuperviewEdge: .right)
        home.autoPinEdge(.bottom, to: .bottom, of: home.label)
        
//        favorite.autoPinEdge(.top, to: .bottom, of: home, withOffset: LM_INSET*0.5)
        favorite.autoPinEdge(.top, to: .bottom, of: home, withOffset: LM_INSET)
        favorite.autoPinEdge(toSuperviewEdge: .left)
        favorite.autoPinEdge(toSuperviewEdge: .right)
        favorite.autoPinEdge(.bottom, to: .bottom, of: favorite.label)
        
//        download.autoPinEdge(.top, to: .bottom, of: favorite, withOffset: LM_INSET*0.5)
//        download.autoPinEdge(toSuperviewEdge: .left)
//        download.autoPinEdge(toSuperviewEdge: .right)
//        download.autoPinEdge(.bottom, to: .bottom, of: download.label)
        
//        settings.autoPinEdge(.Bottom, toEdge: .Top, ofView: logout, withOffset: -LM_INSET*0.5)
//        settings.autoPinEdgeToSuperviewEdge(.Left)
//        settings.autoPinEdgeToSuperviewEdge(.Right)
//        settings.autoPinEdge(.Bottom, toEdge: .Bottom, ofView: settings.label)
//        
//        logout.autoPinEdgeToSuperviewEdge(.Bottom, withInset: LM_INSET)
//        logout.autoPinEdgeToSuperviewEdge(.Left)
//        logout.autoPinEdgeToSuperviewEdge(.Right)
//        logout.autoPinEdge(.Bottom, toEdge: .Bottom, ofView: logout.label)
    }
}
