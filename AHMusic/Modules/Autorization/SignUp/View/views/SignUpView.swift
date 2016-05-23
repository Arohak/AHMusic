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
        let view = BaseTableView(frame: CGRectZero, style: .Grouped)

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
    private func addAllUIElements() {
        addSubview(tableView)
        setConstraints()
    }
    
    //MARK: - Constraints -
    func setConstraints() {
        tableView.autoPinEdgeToSuperviewEdge(.Top)
        tableView.autoPinEdgeToSuperviewEdge(.Left)
        tableView.autoPinEdgeToSuperviewEdge(.Right)
        heighTBLConstraint = tableView.autoSetDimension(.Height, toSize: ScreenSize.HEIGHT - 64)
    }
}
