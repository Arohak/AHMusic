//
//  LeftMenuView.swift
//  AHMusic
//
//  Created by Hakobyan Ara on 5/17/16.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class LeftMenuView: UIView {
    
    //MARK: - Create UIElements -
    lazy var profile: LMGroupView = {
        let view = LMGroupView.newAutoLayoutView()
        view.button.setBackgroundImage(UIImage(named: "img_lm_profile"), forState: .Normal)
        view.label.text = "Profile"
        
        return view
    }()
    
    lazy var favorite: LMGroupView = {
        let view = LMGroupView.newAutoLayoutView()
        view.button.setBackgroundImage(UIImage(named: "img_lm_favorite"), forState: .Normal)
        view.label.text = "Favorites"

        return view
    }()
    
    lazy var important: LMGroupView = {
        let view = LMGroupView.newAutoLayoutView()
        view.button.setBackgroundImage(UIImage(named: "img_lm_important"), forState: .Normal)
        view.label.text = "Important"

        return view
    }()
    
    lazy var settings: LMGroupView = {
        let view = LMGroupView.newAutoLayoutView()
        view.button.setBackgroundImage(UIImage(named: "img_lm_settings"), forState: .Normal)
        view.label.text = "Settings"

        return view
    }()
    
    lazy var logout: LMGroupView = {
        let view = LMGroupView.newAutoLayoutView()
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
        addSubview(favorite)
        addSubview(important)
        addSubview(settings)
        addSubview(logout)

        setConstraints()
    }
    
    //MARK: - Constraints -
    func setConstraints() {
        profile.autoPinEdgeToSuperviewEdge(.Top, withInset: LM_INSET)
        profile.autoPinEdgeToSuperviewEdge(.Left, withInset: LM_OFFSET)
        profile.autoPinEdgeToSuperviewEdge(.Right, withInset: LM_OFFSET)
//        profile.autoMatchDimension(.Height, toDimension: .Width, ofView: profile)
        
        favorite.autoPinEdge(.Top, toEdge: .Bottom, ofView: profile, withOffset: LM_INSET)
        favorite.autoPinEdgeToSuperviewEdge(.Left, withInset: LM_OFFSET*2)
        favorite.autoPinEdgeToSuperviewEdge(.Right, withInset: LM_OFFSET*2)
//        favorite.autoMatchDimension(.Height, toDimension: .Width, ofView: favorite)
        
        important.autoPinEdge(.Top, toEdge: .Bottom, ofView: favorite, withOffset: LM_INSET*0.5)
        important.autoPinEdgeToSuperviewEdge(.Left, withInset: LM_OFFSET*2)
        important.autoPinEdgeToSuperviewEdge(.Right, withInset: LM_OFFSET*2)
//        important.autoMatchDimension(.Height, toDimension: .Width, ofView: important)
        
        settings.autoPinEdge(.Bottom, toEdge: .Top, ofView: logout, withOffset: -LM_INSET*0.5)
        settings.autoPinEdgeToSuperviewEdge(.Left, withInset: LM_OFFSET*2)
        settings.autoPinEdgeToSuperviewEdge(.Right, withInset: LM_OFFSET*2)
//        settings.autoMatchDimension(.Height, toDimension: .Width, ofView: settings)
        
        logout.autoPinEdgeToSuperviewEdge(.Bottom, withInset: LM_INSET)
        logout.autoPinEdgeToSuperviewEdge(.Left, withInset: LM_OFFSET*2)
        logout.autoPinEdgeToSuperviewEdge(.Right, withInset: LM_OFFSET*2)
//        logout.autoMatchDimension(.Height, toDimension: .Width, ofView: logout)
    }
}