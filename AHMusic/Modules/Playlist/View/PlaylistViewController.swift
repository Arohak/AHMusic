//
//  PlaylistViewController.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 06/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class PlaylistViewController: UIViewController, PlaylistViewInput {

    var output: PlaylistViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }


    // MARK: PlaylistViewInput
    func setupInitialState() {
    }
}
