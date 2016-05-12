//
//  AlbumViewController.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 12/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

//MARK: - class AlbumViewController
class AlbumViewController: UIViewController {

    var output: AlbumViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        output.viewIsReady()
    }
}

//MARK: - extension for AlbumViewInput
extension AlbumViewController: AlbumViewInput {
    
    func setupInitialState() {

    }
}
