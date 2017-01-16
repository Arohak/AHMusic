//
//  SettingsViewController.swift
//  AHMusic
//
//  Created by AroHak on 22/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

//MARK: - class SettingsViewController -
class SettingsViewController: UIViewController {

    var output: SettingsViewOutput!
    var settingsView = SettingsView()
    
    // MARK: - Life cycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        baseConfig()
        output.viewIsReady()
    }
    
    // MARK: - Private Methods -
    fileprivate func baseConfig() {
        self.view = settingsView
        
        settingsView.home.button.addTarget(self, action: #selector(SettingsViewController.homeAction(_:)), for: .touchUpInside)
    }
    
    // MARK: - Actions -
    func homeAction(_ sender: AHButton) {
        output.detail()
    }
}

//MARK: - extension for SettingsViewInput -
extension SettingsViewController: SettingsViewInput {
    
    func setupInitialState() {

    }
}
