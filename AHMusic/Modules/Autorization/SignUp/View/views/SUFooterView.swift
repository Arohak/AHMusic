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
        let view = AHButton.newAutoLayout()
        view.backgroundColor = RED_LIGHT
        view.setTitle("Sign Up", for: .normal)
        view.setTitleColor(WHITE, for: .normal)
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
    fileprivate func addAllUIElements() {
        addSubview(button)
        
        setConstraints()
    }
    
    //MARK: - Set Constraints -
    func setConstraints() {
        button.autoPinEdge(toSuperviewEdge: .bottom)
        button.autoAlignAxis(toSuperviewAxis: .vertical)
        button.autoSetDimensions(to: CGSize(width: AU_FIELD_WIDTH, height: AU_BTN_HEIGHT))
    }
}
