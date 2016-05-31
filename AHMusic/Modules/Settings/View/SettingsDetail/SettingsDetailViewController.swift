//
//  SettingsDetailViewController.swift
//  AHMusic
//
//  Created by AroHak on 22/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

//MARK: - class SettingsDetailViewController -
class SettingsDetailViewController: UIViewController {

    var output: SettingsDetailViewOutput!
    var settingsDetailView = SettingsDetailView()
        
    // MARK: - Life cycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        baseConfig()
        output.viewDetailIsReady()
    }
    
    // MARK: - Private Methods -
    private func baseConfig() {
        self.view = settingsDetailView
        
        settingsDetailView.profile.button.addTarget(self, action: #selector(SettingsDetailViewController.profileAction(_:)), forControlEvents: .TouchUpInside)
    }
    
    // MARK: - Actions -
    func profileAction(sender: AHButton) {
        output.alert()
    }
}

//MARK: - extension for SettingsViewInput -
extension SettingsDetailViewController: SettingsDetailViewInput {
    
    func setupInitialState(title: String) {
        settingsDetailView.profile.label.text = title
    }
}
