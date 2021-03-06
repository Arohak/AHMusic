//
//  SettingsDetailView.swift
//  AHMusic
//
//  Created by Hakobyan Ara on 5/17/16.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class SettingsDetailView: UIView {
    
    let maxWidth = WIDTH*0.8
    
    //MARK: - Create UIElements -
    lazy var profile: LMGroupView = {
        let view = LMGroupView.newAutoLayoutView()
        view.widthConstraints.constant = self.maxWidth
        view.button.setBackgroundImage(UIImage(named: "img_lm_profile"), forState: .Normal)
        view.label.text = "Profile"
        
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

        setConstraints()
    }
    
    //MARK: - Constraints -
    func setConstraints() {
        profile.autoPinEdgeToSuperviewEdge(.Top, withInset: LM_INSET)
        profile.autoPinEdgeToSuperviewEdge(.Left)
        profile.autoPinEdgeToSuperviewEdge(.Right)
        profile.autoPinEdge(.Bottom, toEdge: .Bottom, ofView: profile.label)

    }
}