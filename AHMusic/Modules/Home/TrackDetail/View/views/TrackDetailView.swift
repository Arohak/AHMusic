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
        let view = TDHeaderView.newAutoLayoutView()
        
        return view
    }()
    
    lazy var actionView: TDActionView = {
        let view = TDActionView.newAutoLayoutView()
        
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
        addSubview(headerView)
        addSubview(actionView)
        
        setConstraints()
    }
    
    //MARK: - Constraints -
    func setConstraints() {
        headerView.autoPinEdgeToSuperviewEdge(.Top)
        headerView.autoPinEdgeToSuperviewEdge(.Left)
        headerView.autoPinEdgeToSuperviewEdge(.Right)
        headerView.autoPinEdge(.Bottom, toEdge: .Top, ofView: actionView)
        
        actionView.autoPinEdgeToSuperviewEdge(.Bottom)
        actionView.autoPinEdgeToSuperviewEdge(.Left)
        actionView.autoPinEdgeToSuperviewEdge(.Right)
        actionView.autoSetDimension(.Height, toSize: TD_HEIGHT)
    }
}