//
//  TrackDetailView.swift
//  AHMusic
//
//  Created by Hakobyan Ara on 5/17/16.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class TrackDetailView: BaseView {
    
    //MARK: - Create UIElements -
    lazy var headerView: TDHeaderView = {
        let view = TDHeaderView.newAutoLayout()
        
        return view
    }()
    
    lazy var actionView: TDActionView = {
        let view = TDActionView.newAutoLayout()
        
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
        addSubview(headerView)
        addSubview(actionView)
        
        setConstraints()
    }
    
    //MARK: - Constraints -
    func setConstraints() {
        headerView.autoPinEdge(toSuperviewEdge: .top)
        headerView.autoPinEdge(toSuperviewEdge: .left)
        headerView.autoPinEdge(toSuperviewEdge: .right)
        headerView.autoPinEdge(.bottom, to: .top, of: actionView)
        
        actionView.autoPinEdge(toSuperviewEdge: .bottom)
        actionView.autoPinEdge(toSuperviewEdge: .left)
        actionView.autoPinEdge(toSuperviewEdge: .right)
        actionView.autoSetDimension(.height, toSize: TD_HEIGHT)
    }
}
