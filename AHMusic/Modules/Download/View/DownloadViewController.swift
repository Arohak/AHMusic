//
//  DownloadViewController.swift
//  AHMusic
//
//  Created by AroHak on 22/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

//MARK: - class DownloadViewController -
class DownloadViewController: UIViewController {

    var output: DownloadViewOutput!

    // MARK: - Life cycle -
    override func viewDidLoad() {
        super.viewDidLoad()

        output.viewIsReady()
    }
}

//MARK: - extension for DownloadViewInput -
extension DownloadViewController: DownloadViewInput {
    
    func setupInitialState() {

    }
}
