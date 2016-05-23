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
    var buttons: Array<AHButton>!
    
    
    // MARK: - Life cycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        baseConfig()
        output.viewIsReady()
    }
    
    // MARK: - Private Methods -
    private func baseConfig() {
        self.view = leftMenuView
        
        buttons  = [leftMenuView.home.button, leftMenuView.favorite.button, leftMenuView.download.button, leftMenuView.settings.button]
        
        leftMenuView.home.button.addTarget(self, action: #selector(LeftMenuViewController.homeAction(_:)), forControlEvents: .TouchUpInside)
        leftMenuView.favorite.button.addTarget(self, action: #selector(LeftMenuViewController.favoriteAction(_:)), forControlEvents: .TouchUpInside)
        leftMenuView.download.button.addTarget(self, action: #selector(LeftMenuViewController.downloadAction(_:)), forControlEvents: .TouchUpInside)
        leftMenuView.settings.button.addTarget(self, action: #selector(LeftMenuViewController.settingsAction(_:)), forControlEvents: .TouchUpInside)
        leftMenuView.logout.button.addTarget(self, action: #selector(LeftMenuViewController.logoutAction), forControlEvents: .TouchUpInside)
    }
    
    // MARK: - Actions -
    func homeAction(sender: AHButton) {
        if selectCorrectButton(sender) {
            output.home()
        }
    }
    
    func favoriteAction(sender: AHButton) {
        if selectCorrectButton(sender) {
            output.favorite()
        }
    }
    
    func downloadAction(sender: AHButton) {
        if selectCorrectButton(sender) {
            output.download()
        }
    }
    
    func settingsAction(sender: AHButton) {
        if selectCorrectButton(sender) {
            output.settings()
        }
    }
    
    func logoutAction() {
        output.logout()
    }
    
    // MARK: - Private Actions -
    private func selectCorrectButton(sender: AHButton) -> Bool {
        let state = sender.selected

        if !state {
            for button in buttons {
                if state {
                    button.selected = true
                } else {
                    button.selected = false
                }
            }
            sender.selected = !sender.selected
        }
        
        return !state
    }
}

//MARK: - extension for LeftMenuViewInput -
extension LeftMenuViewController: LeftMenuViewInput {
    
    func setupInitialState() {

    }
}
