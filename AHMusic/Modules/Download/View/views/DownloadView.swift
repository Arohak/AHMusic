//
//  DownloadView.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 06/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

//MARK: - DownloadView -
class DownloadView: BaseView {
    
    lazy var tableView: BaseTableView = {
        let view = BaseTableView.newAutoLayout()
        
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
    fileprivate func addAllUIElements() {
        addSubview(tableView)

        setConstraints()
    }
    
    //MARK: - Constraints -
    func setConstraints() {
        tableView.autoPinEdgesToSuperviewEdges()
    }
}

