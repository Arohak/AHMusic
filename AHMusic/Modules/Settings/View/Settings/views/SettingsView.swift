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
        let view = LMGroupView.newAutoLayoutView()
        view.widthConstraints.constant = self.minWidth
        view.button.setBackgroundImage(UIImage(named: "img_lm_home"), forState: .Normal)
        view.button.setBackgroundImage(UIImage(named: "img_lm_home_select"), forState: .Selected)
        view.button.selected = true
        view.label.text = "Home"
        
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
        addSubview(home)

        setConstraints()
    }
    
    //MARK: - Constraints -
    func setConstraints() {
        
        home.autoPinEdgeToSuperviewEdge(.Top)
        home.autoPinEdgeToSuperviewEdge(.Left)
        home.autoPinEdgeToSuperviewEdge(.Right)
        home.autoPinEdge(.Bottom, toEdge: .Bottom, ofView: home.label)
    }
}