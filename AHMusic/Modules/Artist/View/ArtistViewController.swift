//
//  ArtistViewController.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 06/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

//MARK: - class ArtistViewController -
class ArtistViewController: UIViewController {

    var output: ArtistViewOutput!
    
    var artistView = ArtistView()
    var items = Array<Artist>()
    let collectionCellIdentifire = "artistCollectionCell"

    // MARK: - Life cycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        baseConfig()
        output.viewIsReady()
    }
    
    // MARK: - Private Method -
    private func baseConfig() {
        self.view = artistView
        
        artistView.collection.dataSource = self
        artistView.collection.delegate = self
        artistView.collection.registerClass(ArtistCell.self, forCellWithReuseIdentifier: collectionCellIdentifire)
        artistView.refresh.addTarget(self, action: #selector(ArtistViewController.refresh), forControlEvents: .ValueChanged)
    }
    
    // MARK: - Actions -
    func refresh() {
        output.viewIsReady()
    }
}

//MARK: - extension for ArtistViewInput -
extension ArtistViewController: ArtistViewInput {
    
    func setupInitialState(items: Array<Artist>) {
        self.items = items
        
        artistView.refresh.endRefreshing()

        artistView.collection.reloadData()
    }
    
    func pullToRefreshReady() {
    }
}

//MARK: - extension for UICollectionView -
extension ArtistViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return items.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(collectionCellIdentifire, forIndexPath: indexPath) as! ArtistCell
        let item = items[indexPath.row]
        cell.setValues(item)
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let artist = items[indexPath.row]
        output.openDetail(artist)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let size = CGSize(width: AR_CELL_WIDTH, height: AR_CELL_WIDTH*1.2)
        
        return size
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: AR_INSET, left: AR_INSET, bottom: AR_INSET, right: AR_INSET)
    }
}
