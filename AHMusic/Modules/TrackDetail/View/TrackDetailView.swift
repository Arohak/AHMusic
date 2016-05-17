//
//  TrackDetailView.swift
//  AHMusic
//
//  Created by Hakobyan Ara on 5/17/16.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class TrackDetailView: UIView {
    
    //MARK: - Create UIElements
    lazy var headerView: TDHeaderView = {
        let view = TDHeaderView.newAutoLayoutView()
        
        return view
    }()
    
    lazy var infoView: TDInfoView = {
        let view = TDInfoView.newAutoLayoutView()
        
        return view
    }()
    
    lazy var actionView: TDActionView = {
        let view = TDActionView.newAutoLayoutView()
        
        return view
    }()
    
    //MARK: - Initialize
    init() {
        super.init(frame: CGRectZero)
        
        addAllUIElements()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Privat Methods
    func addAllUIElements() {
        addSubview(headerView)
        addSubview(infoView)
        addSubview(actionView)
        
        setConstraints()
    }
    
    //MARK: - Constraints
    func setConstraints() {
        headerView.autoPinEdgeToSuperviewEdge(.Top)
        headerView.autoPinEdgeToSuperviewEdge(.Left)
        headerView.autoPinEdgeToSuperviewEdge(.Right)
        headerView.autoPinEdge(.Bottom, toEdge: .Top, ofView: infoView)
        
        infoView.autoPinEdge(.Bottom, toEdge: .Top, ofView: actionView)
        infoView.autoPinEdgeToSuperviewEdge(.Left)
        infoView.autoPinEdgeToSuperviewEdge(.Right)
        infoView.autoSetDimension(.Height, toSize: TD_HEIGHT*0.4)
        
        actionView.autoPinEdgeToSuperviewEdge(.Bottom)
        actionView.autoPinEdgeToSuperviewEdge(.Left)
        actionView.autoPinEdgeToSuperviewEdge(.Right)
        actionView.autoSetDimension(.Height, toSize: TD_HEIGHT)
    }
}