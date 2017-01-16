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
    fileprivate func baseConfig() {
        self.view = welcomeView
        
        self.title = "Welcome"
        welcomeView.signInButton.addTarget(self, action: #selector(WelcomeViewController.signInAction), for: .touchUpInside)
        welcomeView.signUpButton.addTarget(self, action: #selector(WelcomeViewController.signUpAction), for: .touchUpInside)
        welcomeView.guestButton.addTarget(self, action: #selector(WelcomeViewController.guestAction), for: .touchUpInside)
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
