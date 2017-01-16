//
//  SignUpView.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 5/22/16.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class SignUpView : BaseView {
    
    var heighTBLConstraint: NSLayoutConstraint!
    
    //MARK: - Create UIElements -
    let tableView: BaseTableView = {
        let view = BaseTableView(frame: CGRect.zero, style: .grouped)

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
        heighTBLConstraint = tableView.autoSetDimension(.height, toSize: ScreenSize.HEIGHT - 64)
    }
}
