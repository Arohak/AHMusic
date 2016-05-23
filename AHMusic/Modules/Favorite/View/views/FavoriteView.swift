//
//  FavoriteView.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 06/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

//MARK: - FavoriteView -
class FavoriteView: BaseView {
    
    lazy var tableView: BaseTableView = {
        let view = BaseTableView.newAutoLayoutView()
        
        return view
    }()
    
    lazy var refresh: CarbonSwipeRefresh = {
        let view = CarbonSwipeRefresh(scrollView: self.tableView)
        view.colors = RCOLORS
        
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
        addSubview(refresh)

        setConstraints()
    }
    
    //MARK: - Constraints -
    func setConstraints() {
        tableView.autoPinEdgesToSuperviewEdges()
        refresh.setMarginTop(0)
    }
}

