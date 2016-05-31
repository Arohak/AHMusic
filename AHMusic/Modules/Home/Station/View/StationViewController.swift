//
//  StationViewController.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 12/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

//MARK: - class StationViewController -
class StationViewController: BaseViewController {

    var output: StationViewOutput!
    let trackView = TrackView()

    // MARK: - Life cycle -
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view = trackView
        output.viewIsReady(keyword)
    }
}

//MARK: - extension for StationViewInput -
extension StationViewController: StationViewInput {
    
    func setupInitialState() {

    }
}
