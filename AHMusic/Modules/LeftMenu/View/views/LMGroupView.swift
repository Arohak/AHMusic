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
        let view = AHLabel.newAutoLayout()
        view.font = LM_LBL_FONT
        view.textAlignment = .center
        
        return view
    }()
    
    lazy var button: AHButton = {
        let view = AHButton.newAutoLayout()

        return view
    }()
    
    //MARK: - Initialize -
    init() {
        super.init(frame: CGRect.zero)
        
        addAllUIElements()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private Methods -
    fileprivate func addAllUIElements() {
        addSubview(button)
        addSubview(label)

        setConstraints()
    }
    
    //MARK: - Constraints -
    func setConstraints() {
        button.autoPinEdge(toSuperviewEdge: .top)
        button.autoAlignAxis(toSuperviewAxis: .vertical)
        button.autoMatch(.height, to: .width, of: button)
        widthConstraints = button.autoSetDimension(.width, toSize: WIDTH)

        label.autoPinEdge(.top, to: .bottom, of: button, withOffset: LM_OFFSET*2)
        label.autoPinEdge(toSuperviewEdge: .left)
        label.autoPinEdge(toSuperviewEdge: .right)
        label.autoPinEdge(toSuperviewEdge: .bottom)
    }
}
