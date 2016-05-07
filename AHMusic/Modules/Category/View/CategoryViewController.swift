//
//  CategoryViewController.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 06/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class CategoryViewController: UIViewController, CategoryViewInput {

    var output: CategoryViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }


    // MARK: CategoryViewInput
    func setupInitialState() {
    }
}
