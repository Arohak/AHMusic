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
        
        leftMenuView.home.button.addTarget(self, action: #selector(LeftMenuViewController.homeAction), forControlEvents: .TouchUpInside)
        leftMenuView.favorite.button.addTarget(self, action: #selector(LeftMenuViewController.favoriteAction), forControlEvents: .TouchUpInside)
        leftMenuView.download.button.addTarget(self, action: #selector(LeftMenuViewController.downloadAction), forControlEvents: .TouchUpInside)
        leftMenuView.settings.button.addTarget(self, action: #selector(LeftMenuViewController.settingsAction), forControlEvents: .TouchUpInside)
        leftMenuView.logout.button.addTarget(self, action: #selector(LeftMenuViewController.logoutAction), forControlEvents: .TouchUpInside)
    }
    
    // MARK: - Actions -
    func homeAction() {
        output.home()
    }
    
    func favoriteAction() {
        output.favorite()
    }
    
    func downloadAction() {
        output.download()
    }
    
    func settingsAction() {
        output.settings()
    }
    
    func logoutAction() {
        output.logout()
    }
}

//MARK: - extension for LeftMenuViewInput -
extension LeftMenuViewController: LeftMenuViewInput {
    
    func setupInitialState() {

    }
}
