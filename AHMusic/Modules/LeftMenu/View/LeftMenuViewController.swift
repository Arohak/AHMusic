//
//  LeftMenuViewController.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 12/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

//MARK: - class LeftMenuViewController -
class LeftMenuViewController: UIViewController {

    var output: LeftMenuViewOutput!
    var leftMenuView = LeftMenuView()
    
    // MARK: - Life cycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        baseConfig()
        output.viewIsReady()
    }
    
    // MARK: - Private Methods -
    private func baseConfig() {
        self.view = leftMenuView
    }
}

//MARK: - extension for LeftMenuViewInput -
extension LeftMenuViewController: LeftMenuViewInput {
    
    func setupInitialState() {

    }
}
