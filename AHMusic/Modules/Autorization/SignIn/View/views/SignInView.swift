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
        let view = BaseTableView(frame: CGRectZero, style: UITableViewStyle.Grouped)

        return view
    }()
    
    //MARK: - Initialize -
    override init() {
        super.init()
        
        addAllUIElements()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private Methods -
    private func addAllUIElements() {
        addSubview(tableView)
        setConstraints()
    }
    
    //MARK: - Constraints -
    func setConstraints() {
        tableView.autoPinEdgeToSuperviewEdge(.Top)
        tableView.autoPinEdgeToSuperviewEdge(.Left)
        tableView.autoPinEdgeToSuperviewEdge(.Right)
        heighTBLConstraint = tableView.autoSetDimension(.Height, toSize: ScreenSize.HEIGHT)
    }
}

//MARK: - SignInCell -
class SignInCell : BaseTableViewCell {
    
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
        let view = AUTHTextField.newAutoLayoutView()
        
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
        addSubview(authTextField)
        
        setConstraints()
    }
    
    //MARK: - Constraints -
    func setConstraints() {
        authTextField.autoPinEdgeToSuperviewEdge(.Top)
        authTextField.autoAlignAxisToSuperviewAxis(.Vertical)
        authTextField.autoSetDimensionsToSize(CGSize(width: 300, height: 40))
    }
}