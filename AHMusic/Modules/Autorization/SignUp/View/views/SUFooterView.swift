//
//  SUFooterView.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 5/22/16.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//


class SUFooterView: UIView {
    
    //MARK: - Create UIElements -
    let button: AHButton = {
        let view = AHButton.newAutoLayoutView()
        view.backgroundColor = RED_LIGHT
        view.setTitle("Sign Up", forState: .Normal)
        view.setTitleColor(WHITE, forState: .Normal)
        view.layer.cornerRadius = SI_OFFSET

        return view
    }()
    
    //MARK: - Initialize -
    override init(frame : CGRect) {
        super.init(frame: frame)
        
        addAllUIElements()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private Methods -
    private func addAllUIElements() {
        addSubview(button)
        
        setConstraints()
    }
    
    //MARK: - Set Constraints -
    func setConstraints() {
        button.autoPinEdgeToSuperviewEdge(.Bottom)
        button.autoAlignAxisToSuperviewAxis(.Vertical)
        button.autoSetDimensionsToSize(CGSize(width: AU_FIELD_WIDTH, height: AU_BTN_HEIGHT))
    }
}
