//
//  BaseView.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 06/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

//import MarqueeLabel

//MARK: - AUTHTextField
class AUTHTextField: UITextField {
    
    //MARK: - Initialize
    override init(frame : CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = WHITE
        self.font = TITLE_BTN_FONT
        self.textAlignment = .Center
        self.layer.cornerRadius = 4
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func textRectForBounds(bounds: CGRect) -> CGRect {
        return CGRectInset(bounds, 10, 10)
    }
    
    override func editingRectForBounds(bounds: CGRect) -> CGRect {
        return CGRectInset(bounds, 10, 10)
    }
}

//MARK: - AHLabel
class AHLabel: UILabel {
    
    //MARK: - Initialize
    init() {
        super.init(frame: CGRectZero)
        
        font = TITLE_BTN_FONT
        textColor = WHITE
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - AHTextField
class AHTextField: UITextField {
    
    var indexPath = NSIndexPath(forRow: 0, inSection: 0)

    //MARK: - Initialize
    override init(frame : CGRect) {
        super.init(frame: frame)
        
        layer.cornerRadius = 4
        keyboardAppearance = .Dark
        font = TITLE_BTN_FONT
        textColor = BLUE
        tintColor = BLUE
    }
    
    override func textRectForBounds(bounds: CGRect) -> CGRect {
        return CGRectInset(bounds, 3, 3)
    }
    
    override func editingRectForBounds(bounds: CGRect) -> CGRect {
        return CGRectInset(bounds, 3, 3)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - AHButton
class AHButton: UIButton {
    
    var indexPath = NSIndexPath(forRow: 0, inSection: 0)

    //MARK: - Initialize
    override init(frame : CGRect) {
        super.init(frame: frame)
        
        self.exclusiveTouch = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}