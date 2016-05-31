//
//  BaseViewController.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 06/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

//MARK: - BaseViewController -
class BaseViewController: UIViewController {
    
    var keyword: String!
    
    //MARK: - Initilize -
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    convenience init(title: String, keyword: String) {
        self.init()
        
        self.title = title
        self.keyword = keyword
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Actions -
    func refresh() {

    }
}

