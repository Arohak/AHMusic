//
//  SettingsView.swift
//  AHMusic
//
//  Created by Hakobyan Ara on 5/17/16.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class SettingsView: UIView {
    
    let minWidth = WIDTH*0.4
    
    //MARK: - Create UIElements -
    lazy var home: LMGroupView = {
        let view = LMGroupView.newAutoLayout()
        view.widthConstraints.constant = self.minWidth
        view.button.setBackgroundImage(UIImage(named: "img_lm_home"), for: .normal)
        view.button.setBackgroundImage(UIImage(named: "img_lm_home_select"), for: .selected)
        view.button.isSelected = true
        view.label.text = "Home"
        
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
        addSubview(home)

        setConstraints()
    }
    
    //MARK: - Constraints -
    func setConstraints() {
        
        home.autoPinEdge(toSuperviewEdge: .top)
        home.autoPinEdge(toSuperviewEdge: .left)
        home.autoPinEdge(toSuperviewEdge: .right)
        home.autoPinEdge(.bottom, to: .bottom, of: home.label)
    }
}
