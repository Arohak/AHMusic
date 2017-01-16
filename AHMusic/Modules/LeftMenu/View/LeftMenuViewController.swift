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
    fileprivate func baseConfig() {
        self.view = leftMenuView
        
        buttons  = [leftMenuView.home.button, leftMenuView.favorite.button, leftMenuView.download.button, leftMenuView.settings.button]
        
        leftMenuView.home.button.addTarget(self, action: #selector(LeftMenuViewController.homeAction(_:)), for: .touchUpInside)
        leftMenuView.favorite.button.addTarget(self, action: #selector(LeftMenuViewController.favoriteAction(_:)), for: .touchUpInside)
        leftMenuView.download.button.addTarget(self, action: #selector(LeftMenuViewController.downloadAction(_:)), for: .touchUpInside)
        leftMenuView.settings.button.addTarget(self, action: #selector(LeftMenuViewController.settingsAction(_:)), for: .touchUpInside)
        leftMenuView.logout.button.addTarget(self, action: #selector(LeftMenuViewController.logoutAction), for: .touchUpInside)
    }
    
    // MARK: - Actions -
    func homeAction(_ sender: AHButton) {
        if selectCorrectButton(sender) {
            output.home()
        }
    }
    
    func favoriteAction(_ sender: AHButton) {
        if selectCorrectButton(sender) {
            output.favorite()
        }
    }
    
    func downloadAction(_ sender: AHButton) {
        if selectCorrectButton(sender) {
            output.download()
        }
    }
    
    func settingsAction(_ sender: AHButton) {
        if selectCorrectButton(sender) {
            output.settings()
        }
    }
    
    func logoutAction() {
        output.logout()
    }
    
    // MARK: - Private Actions -
    fileprivate func selectCorrectButton(_ sender: AHButton) -> Bool {
        let state = sender.isSelected

        if !state {
            for button in buttons {
                if state {
                    button.isSelected = true
                } else {
                    button.isSelected = false
                }
            }
            sender.isSelected = !sender.isSelected
        }
        
        return !state
    }
}

//MARK: - extension for LeftMenuViewInput -
extension LeftMenuViewController: LeftMenuViewInput {
    
    func setupInitialState() {

    }
}
