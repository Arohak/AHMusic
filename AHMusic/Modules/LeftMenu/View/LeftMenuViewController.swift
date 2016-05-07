//
//  LeftMenuViewController.swift
//  AHMusic
//
//  Created by AroHak on 08/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class LeftMenuViewController: UIViewController, LeftMenuViewInput {

    var output: LeftMenuViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = GRAY
        
        output.viewIsReady()
    }


    // MARK: LeftMenuViewInput
    func setupInitialState() {
    }
}
