//
//  LeftMenuViewController.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 12/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

//MARK: - class LeftMenuViewController
class LeftMenuViewController: UIViewController {

    var output: LeftMenuViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        output.viewIsReady()
    }
}

//MARK: - extension for LeftMenuViewInput
extension LeftMenuViewController: LeftMenuViewInput {
    
    func setupInitialState() {

    }
}
