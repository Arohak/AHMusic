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
        let view = LMGroupView.newAutoLayoutView()
        view.widthConstraints.constant = self.maxWidth
        view.button.setBackgroundImage(UIImage(named: "img_lm_profile"), forState: .Normal)
        view.label.text = "Profile"
        
        return view
    }()
    
    lazy var home: LMGroupView = {
        let view = LMGroupView.newAutoLayoutView()
        view.widthConstraints.constant = self.minWidth
        view.button.setBackgroundImage(UIImage(named: "img_lm_home"), forState: .Normal)
        view.button.setBackgroundImage(UIImage(named: "img_lm_home_select"), forState: .Selected)
        view.label.text = "Home"
        
        return view
    }()
    
    lazy var favorite: LMGroupView = {
        let view = LMGroupView.newAutoLayoutView()
        view.widthConstraints.constant = self.minWidth
        view.button.setBackgroundImage(UIImage(named: "img_lm_favorite"), forState: .Normal)
        view.button.setBackgroundImage(UIImage(named: "img_lm_favorite_select"), forState: .Selected)
        view.label.text = "Favorites"

        return view
    }()
    
    lazy var download: LMGroupView = {
        let view = LMGroupView.newAutoLayoutView()
        view.widthConstraints.constant = self.minWidth
        view.button.setBackgroundImage(UIImage(named: "img_lm_download"), forState: .Normal)
        view.button.setBackgroundImage(UIImage(named: "img_lm_download_select"), forState: .Selected)
        view.label.text = "Offline"

        return view
    }()
    
    lazy var settings: LMGroupView = {
        let view = LMGroupView.newAutoLayoutView()
        view.widthConstraints.constant = self.minWidth
        view.button.setBackgroundImage(UIImage(named: "img_lm_settings"), forState: .Normal)
        view.button.setBackgroundImage(UIImage(named: "img_lm_settings_select"), forState: .Selected)
        view.label.text = "Settings"

        return view
    }()
    
    lazy var logout: LMGroupView = {
        let view = LMGroupView.newAutoLayoutView()
        view.widthConstraints.constant = self.minWidth
        view.button.setBackgroundImage(UIImage(named: "img_lm_logout"), forState: .Normal)
        view.label.text = "Logut"

        return view
    }()
    
    //MARK: - Initialize -
    init() {
        super.init(frame: CGRectZero)
        
        backgroundColor = BLACK_59
        addAllUIElements()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private Methods -
    private func addAllUIElements() {
        addSubview(profile)
        addSubview(home)
        addSubview(favorite)
        addSubview(download)
        addSubview(settings)
        addSubview(logout)

        setConstraints()
    }
    
    //MARK: - Constraints -
    func setConstraints() {
        profile.autoPinEdgeToSuperviewEdge(.Top, withInset: LM_INSET)
        profile.autoPinEdgeToSuperviewEdge(.Left)
        profile.autoPinEdgeToSuperviewEdge(.Right)
        profile.autoPinEdge(.Bottom, toEdge: .Bottom, ofView: profile.label)
        
        home.autoPinEdge(.Top, toEdge: .Bottom, ofView: profile, withOffset: LM_INSET)
        home.autoPinEdgeToSuperviewEdge(.Left)
        home.autoPinEdgeToSuperviewEdge(.Right)
        home.autoPinEdge(.Bottom, toEdge: .Bottom, ofView: home.label)
        
        favorite.autoPinEdge(.Top, toEdge: .Bottom, ofView: home, withOffset: LM_INSET*0.5)
        favorite.autoPinEdgeToSuperviewEdge(.Left)
        favorite.autoPinEdgeToSuperviewEdge(.Right)
        favorite.autoPinEdge(.Bottom, toEdge: .Bottom, ofView: favorite.label)
        
        download.autoPinEdge(.Top, toEdge: .Bottom, ofView: favorite, withOffset: LM_INSET*0.5)
        download.autoPinEdgeToSuperviewEdge(.Left)
        download.autoPinEdgeToSuperviewEdge(.Right)
        download.autoPinEdge(.Bottom, toEdge: .Bottom, ofView: download.label)
        
        settings.autoPinEdge(.Bottom, toEdge: .Top, ofView: logout, withOffset: -LM_INSET*0.5)
        settings.autoPinEdgeToSuperviewEdge(.Left)
        settings.autoPinEdgeToSuperviewEdge(.Right)
        settings.autoPinEdge(.Bottom, toEdge: .Bottom, ofView: settings.label)
        
        logout.autoPinEdgeToSuperviewEdge(.Bottom, withInset: LM_INSET)
        logout.autoPinEdgeToSuperviewEdge(.Left)
        logout.autoPinEdgeToSuperviewEdge(.Right)
        logout.autoPinEdge(.Bottom, toEdge: .Bottom, ofView: logout.label)
    }
}