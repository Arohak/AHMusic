//
//  PlaylistViewController.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 12/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

//MARK: - class PlaylistViewController
class PlaylistViewController: UIViewController {

    var output: PlaylistViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        output.viewIsReady()
    }
}

//MARK: - extension for PlaylistViewInput
extension PlaylistViewController: PlaylistViewInput {
    
    func setupInitialState() {

    }
}
