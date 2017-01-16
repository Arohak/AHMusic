//
//  SignInView.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 5/22/16.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class SignInView : BaseView {
    
    var heighTBLConstraint: NSLayoutConstraint!
    
    //MARK: - Create UIElements -
    let tableView: BaseTableView = {
        let view = BaseTableView(frame: CGRect.zero, style: UITableViewStyle.grouped)

        return view
    }()
    
    //MARK: - Initialize -
    override init() {
        super.init()
        
        bgImageView.image = UIImage(named: "bg_2")
        addAllUIElements()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private Methods -
    fileprivate func addAllUIElements() {
        addSubview(tableView)
        setConstraints()
    }
    
    //MARK: - Constraints -
    func setConstraints() {
        tableView.autoPinEdge(toSuperviewEdge: .top)
        tableView.autoPinEdge(toSuperviewEdge: .left)
        tableView.autoPinEdge(toSuperviewEdge: .right)
        heighTBLConstraint = tableView.autoSetDimension(.height, toSize: ScreenSize.HEIGHT - NAV_HEIGHT)
    }
}

//MARK: - SignInCell -
class FieldCell : BaseTableViewCell {
    
    let cellContentView = SICellContentView()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(cellContentView)
        cellContentView.autoPinEdgesToSuperviewEdges()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - SICellContentView -
class SICellContentView: UIView {
    
    let authTextField: AUTHTextField = {
        let view = AUTHTextField.newAutoLayout()
        
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
        addSubview(authTextField)
        
        setConstraints()
    }
    
    //MARK: - Constraints -
    func setConstraints() {
        authTextField.autoPinEdge(toSuperviewEdge: .top)
        authTextField.autoAlignAxis(toSuperviewAxis: .vertical)
        authTextField.autoSetDimensions(to: CGSize(width: AU_FIELD_WIDTH, height: AU_FIELD_HEIGHT))
    }
}
