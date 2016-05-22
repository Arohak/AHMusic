//
//  ProfileViewController.swift
//  AHMusic
//
//  Created by AroHak on 22/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

//MARK: - class ProfileViewController -
class ProfileViewController: UIViewController {

    var output: ProfileViewOutput!

    // MARK: - Life cycle -
    override func viewDidLoad() {
        super.viewDidLoad()

        output.viewIsReady()
    }
}

//MARK: - extension for ProfileViewInput -
extension ProfileViewController: ProfileViewInput {
    
    func setupInitialState() {

    }
}
