//
//  BaseEventView.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 06/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class BaseEventView: UIView {
    
    lazy var bgImageView: UIImageView = {
        let view = UIImageView.newAutoLayout()
        view.image = UIImage(named: "bg")
        
        return view
    }()
    
    lazy var tableView: BaseTableView = {
        let view = BaseTableView.newAutoLayout()
        
        return view
    }()
    
    lazy var refresh: CarbonSwipeRefresh = {
        let view = CarbonSwipeRefresh(scrollView: self.tableView)
        view?.colors = RCOLORS
        
        return view!
    }()
    
    //MARK: - Initialize -
    init() {
        super.init(frame: CGRect.zero)
        
        addSubview(bgImageView)
        addSubview(tableView)
        addSubview(refresh)

        bgImageView.autoPinEdgesToSuperviewEdges()
        tableView.autoPinEdgesToSuperviewEdges()
        refresh.setMarginTop(0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
