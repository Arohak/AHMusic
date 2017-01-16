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
        let view = LMGroupView.newAutoLayout()
        view.widthConstraints.constant = self.maxWidth
        view.button.setBackgroundImage(UIImage(named: "img_lm_profile"), for: .normal)
        view.label.text = "Profile"
        
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
        addSubview(profile)

        setConstraints()
    }
    
    //MARK: - Constraints -
    func setConstraints() {
        profile.autoPinEdge(toSuperviewEdge: .top, withInset: LM_INSET)
        profile.autoPinEdge(toSuperviewEdge: .left)
        profile.autoPinEdge(toSuperviewEdge: .right)
        profile.autoPinEdge(.bottom, to: .bottom, of: profile.label)

    }
}
