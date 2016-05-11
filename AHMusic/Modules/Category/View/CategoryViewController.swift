//
//  CategoryViewController.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 06/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class CategoryViewController: UIViewController, CategoryViewInput {

    var output: CategoryViewOutput!
    var categoryView = CategoryView()

    var items = Array<Category>()
    let collectionCellIdentifire = "categoryCollectionCell"

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        baseConfig()
        output.viewIsReady()
    }
    
    // MARK: - LandingViewInput
    func categoryDataIsReady(items: Array<Category>) {
        self.items = items
        
        categoryView.collection.reloadData()
    }
    
    // MARK: - Private Method
    private func baseConfig() {
        self.view = categoryView
        
        categoryView.collection.dataSource = self
        categoryView.collection.delegate = self
        categoryView.collection.registerClass(CategoryCell.self, forCellWithReuseIdentifier: collectionCellIdentifire)
    }
}

extension CategoryViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    //MARK: - UICollectionViewDataSource
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return items.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(collectionCellIdentifire, forIndexPath: indexPath) as! CategoryCell
        let item = items[indexPath.row]
        cell.setValues(item)
        
        return cell
    }
    
    //MARK: - UICollectionViewDelegate
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let item = items[indexPath.row]
       output.viewIsSelectItem(item)
    }
    
    //MARK: - UICollectionViewDelegateFlowLayout
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let size = CGSize(width: CA_CELL_WIDTH, height: CA_CELL_WIDTH*1.2)
        
        return size
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: CA_INSET, left: CA_INSET, bottom: CA_INSET, right: CA_INSET)
    }
}
