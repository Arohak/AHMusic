//
//  StationViewController.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 12/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

//MARK: - class StationViewController -
class StationViewController: UIViewController {

    var output: StationViewOutput!

    // MARK: - Life cycle -
    override func viewDidLoad() {
        super.viewDidLoad()

        output.viewIsReady()
    }
}

//MARK: - extension for StationViewInput -
extension StationViewController: StationViewInput {
    
    func setupInitialState() {

    }
}
