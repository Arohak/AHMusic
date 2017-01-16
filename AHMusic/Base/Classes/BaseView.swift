//
//  BaseView.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 06/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

//MARK: - BaseView -
class BaseView: UIView {
    
    lazy var bgImageView: UIImageView = {
        let view = UIImageView.newAutoLayout()
        view.image = UIImage(named: "bg")
        
        return view
    }()
    
    //MARK: - Initialize -
    init() {
        super.init(frame: CGRect.zero)
    
        addSubview(bgImageView)
        bgImageView.autoPinEdgesToSuperviewEdges()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - BaseCollectionView -
class BaseCollectionView: UICollectionView {
    
    //MARK: - Initialize -
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        
        backgroundColor = CLEAR
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - BaseTableView -
class BaseTableView: UITableView {
    
    //MARK: - Initialize -
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        
        separatorStyle = .none
        backgroundColor = CLEAR
    }
    
    convenience init() {
        self.init(frame: CGRect.zero, style: .plain)
        
        separatorStyle = .none
        backgroundColor = CLEAR
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - BaseTableViewCell -
class BaseTableViewCell: UITableViewCell {
    
    //MARK: - Initialize -
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = CLEAR
        selectionStyle = .none
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - AUTHTextField -
class AUTHTextField: UITextField {
    
    //MARK: - Initialize -
    override init(frame : CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = WHITE
        self.font = TITLE_BTN_FONT
        self.textAlignment = .center
        self.layer.cornerRadius = 4
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 10, dy: 10)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 10, dy: 10)
    }
}

//MARK: - AHLabel -
class AHLabel: UILabel {
    
    //MARK: - Initialize -
    init() {
        super.init(frame: CGRect.zero)
        
        font = TITLE_BTN_FONT
        textColor = WHITE
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - AHTextField -
class AHTextField: UITextField {
    
    var indexPath = NSIndexPath(row: 0, section: 0)

    //MARK: - Initialize -
    override init(frame : CGRect) {
        super.init(frame: frame)
        
        layer.cornerRadius = 4
        keyboardAppearance = .dark
        font = TITLE_BTN_FONT
        textColor = BLUE
        tintColor = BLUE
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 3, dy: 3)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 3, dy: 3)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - AHButton -
class AHButton: UIButton {
    
    var indexPath = IndexPath(row: 0, section: 0)

    //MARK: - Initialize -
    override init(frame : CGRect) {
        super.init(frame: frame)
        
        self.isExclusiveTouch = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - LinkButton -
class LinkButton: UIButton {
    
    var indexPath = IndexPath(row: 0, section: 0)
    
    //MARK: - Initialize -
    override init(frame : CGRect) {
        super.init(frame: frame)
        
        setTitleColor(RED_LIGHT, for: .normal)
        setTitleColor(WHITE, for: .highlighted)
        titleLabel!.font = LINK_FONT
        contentHorizontalAlignment = .left
        titleLabel!.lineBreakMode = .byTruncatingTail
        isExclusiveTouch = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
