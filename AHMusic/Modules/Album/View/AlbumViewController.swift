//
//  AlbumViewController.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 06/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class AlbumViewController: UIViewController, AlbumViewInput {

    var output: AlbumViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }


    // MARK: AlbumViewInput
    func setupInitialState() {
    }
}
