//
//  CategoryViewController.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 06/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

//MARK: - class CategoryViewController -
class CategoryViewController: UIViewController {

    var output: CategoryViewOutput!
    
    var categoryView = CategoryView()
    var items = Array<Category>()
    let collectionCellIdentifire = "categoryCollectionCell"

    // MARK: - Life cycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        baseConfig()
        output.viewIsReady()
    }
    
    // MARK: - Private Methods -
    fileprivate func baseConfig() {
        self.view = categoryView
        
        categoryView.collection.dataSource = self
        categoryView.collection.delegate = self
        categoryView.collection.register(CategoryCell.self, forCellWithReuseIdentifier: collectionCellIdentifire)
    }
}

//MARK: - extension for CategoryViewInput -
extension CategoryViewController: CategoryViewInput {
    
    func categoryDataIsReady(_ items: Array<Category>) {
        self.items = items
        
        categoryView.collection.reloadData()
    }
}

//MARK: - extension for UICollectionView -
extension CategoryViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionCellIdentifire, for: indexPath) as! CategoryCell
        let item = items[indexPath.row]
        cell.setValues(item)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = items[indexPath.row]
       output.viewIsSelectItem(item)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = CGSize(width: CA_CELL_WIDTH, height: CA_CELL_WIDTH*1.2)
        
        return size
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: CA_INSET, left: CA_INSET, bottom: CA_INSET, right: CA_INSET)
    }
}
