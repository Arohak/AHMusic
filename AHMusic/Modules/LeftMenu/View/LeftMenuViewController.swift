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
        
        leftMenuView.home.button.addTarget(self, action: #selector(LeftMenuViewController.homeAction(_:)), forControlEvents: .TouchUpInside)
        leftMenuView.favorite.button.addTarget(self, action: #selector(LeftMenuViewController.favoriteAction(_:)), forControlEvents: .TouchUpInside)
        leftMenuView.download.button.addTarget(self, action: #selector(LeftMenuViewController.downloadAction(_:)), forControlEvents: .TouchUpInside)
        leftMenuView.settings.button.addTarget(self, action: #selector(LeftMenuViewController.settingsAction(_:)), forControlEvents: .TouchUpInside)
        leftMenuView.logout.button.addTarget(self, action: #selector(LeftMenuViewController.logoutAction), forControlEvents: .TouchUpInside)
    }
    
    // MARK: - Actions -
    func homeAction(sender: AHButton) {
        sender.selected = !sender.selected
        
        output.home()
    }
    
    func favoriteAction(sender: AHButton) {
        sender.selected = !sender.selected

        output.favorite()
    }
    
    func downloadAction(sender: AHButton) {
        sender.selected = !sender.selected

        output.download()
    }
    
    func settingsAction(sender: AHButton) {
        sender.selected = !sender.selected

        output.settings()
    }
    
    func logoutAction() {
        output.logout()
    }
    
    // MARK: - Private Actions -
    private func selectCorrectButton() {

    }
}

//MARK: - extension for LeftMenuViewInput -
extension LeftMenuViewController: LeftMenuViewInput {
    
    func setupInitialState() {

    }
}
