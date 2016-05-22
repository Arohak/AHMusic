//
//  SignInViewController.swift
//  AHMusic
//
//  Created by AroHak on 22/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

//MARK: - class SignInViewController -
class SignInViewController: UIViewController {

    var output: SignInViewOutput!

    // MARK: - Life cycle -
    override func viewDidLoad() {
        super.viewDidLoad()

        output.viewIsReady()
    }
}

//MARK: - extension for SignInViewInput -
extension SignInViewController: SignInViewInput {
    
    func setupInitialState() {

    }
}
