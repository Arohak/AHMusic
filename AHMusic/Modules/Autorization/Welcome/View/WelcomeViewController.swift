//
//  WelcomeViewController.swift
//  AHMusic
//
//  Created by AroHak on 23/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

//MARK: - class WelcomeViewController -
class WelcomeViewController: UIViewController {

    var output: WelcomeViewOutput!
    let welcomeView = WelcomeView()

    // MARK: - Life cycle -
    override func viewDidLoad() {
        super.viewDidLoad()

        baseConfig()
        output.viewIsReady()
    }
    
    // MARK: - Private Methods -
    private func baseConfig() {
        self.view = welcomeView
        
        welcomeView.signInButton.addTarget(self, action: #selector(WelcomeViewController.signInAction), forControlEvents: .TouchUpInside)
        welcomeView.signUpButton.addTarget(self, action: #selector(WelcomeViewController.signUpAction), forControlEvents: .TouchUpInside)
        welcomeView.guestButton.addTarget(self, action: #selector(WelcomeViewController.guestAction), forControlEvents: .TouchUpInside)
    }
    
    // MARK: - Actions -
    func signInAction() {
        output.signIn()
    }
    
    func signUpAction() {
        output.signUp()
    }
    
    func guestAction() {
        output.guest()
    }
}

//MARK: - extension for WelcomeViewInput -
extension WelcomeViewController: WelcomeViewInput {
    
    func setupInitialState() {

    }
}
