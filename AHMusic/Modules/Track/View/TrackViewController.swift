//
//  TrackViewController.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 12/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

//MARK: - class TrackViewController
class TrackViewController: UIViewController {

    var output: TrackViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        output.viewIsReady()
    }
}

//MARK: - extension for TrackViewInput
extension TrackViewController: TrackViewInput {
    
    func setupInitialState() {

    }
}
