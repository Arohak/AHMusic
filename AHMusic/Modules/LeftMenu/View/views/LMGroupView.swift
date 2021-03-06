//
//  LMGroupView.swift
//  AHMusic
//
//  Created by Hakobyan Ara on 5/17/16.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class LMGroupView: UIView {
    
    var widthConstraints: NSLayoutConstraint!
    
    //MARK: - Create UIElements -
    lazy var label: AHLabel = {
        let view = AHLabel.newAutoLayoutView()
        view.font = LM_LBL_FONT
        view.textAlignment = .Center
        
        return view
    }()
    
    lazy var button: AHButton = {
        let view = AHButton.newAutoLayoutView()

        return view
    }()
    
    //MARK: - Initialize -
    init() {
        super.init(frame: CGRectZero)
        
        addAllUIElements()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private Methods -
    private func addAllUIElements() {
        addSubview(button)
        addSubview(label)

        setConstraints()
    }
    
    //MARK: - Constraints -
    func setConstraints() {
        button.autoPinEdgeToSuperviewEdge(.Top)
        button.autoAlignAxisToSuperviewAxis(.Vertical)
        button.autoMatchDimension(.Height, toDimension: .Width, ofView: button)
        widthConstraints = button.autoSetDimension(.Width, toSize: WIDTH)

        label.autoPinEdge(.Top, toEdge: .Bottom, ofView: button, withOffset: LM_OFFSET*2)
        label.autoPinEdgeToSuperviewEdge(.Left)
        label.autoPinEdgeToSuperviewEdge(.Right)
        label.autoPinEdgeToSuperviewEdge(.Bottom)
    }
}