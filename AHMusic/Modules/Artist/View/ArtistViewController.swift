//
//  ArtistViewController.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 12/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

//MARK: - class ArtistViewController
class ArtistViewController: UIViewController {

    var output: ArtistViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        output.viewIsReady()
    }
}

//MARK: - extension for ArtistViewInput
extension ArtistViewController: ArtistViewInput {
    
    func setupInitialState() {

    }
}
