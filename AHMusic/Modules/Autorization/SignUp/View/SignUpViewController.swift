//
//  SignUpViewController.swift
//  AHMusic
//
//  Created by AroHak on 22/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

//MARK: - class SignUpViewController -
class SignUpViewController: UIViewController {

    var output: SignUpViewOutput!

    // MARK: - Life cycle -
    override func viewDidLoad() {
        super.viewDidLoad()

        output.viewIsReady()
    }
}

//MARK: - extension for SignUpViewInput -
extension SignUpViewController: SignUpViewInput {
    
    func setupInitialState() {

    }
}
