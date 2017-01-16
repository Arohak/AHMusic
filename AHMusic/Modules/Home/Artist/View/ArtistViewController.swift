//
//  ArtistViewController.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 06/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

//MARK: - class ArtistViewController -
class ArtistViewController: BaseViewController {

    var output: ArtistViewOutput!
    
    var artistView = ArtistView()
    var items = Array<Artist>()
    let collectionCellIdentifire = "artistCollectionCell"

    // MARK: - Life cycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        baseConfig()
        output.viewIsReady(keyword)
    }
    
    // MARK: - Private Method -
    fileprivate func baseConfig() {
        self.view = artistView
        
        artistView.collection.dataSource = self
        artistView.collection.delegate = self
        artistView.collection.register(ArtistCell.self, forCellWithReuseIdentifier: collectionCellIdentifire)
        artistView.refresh.addTarget(self, action: #selector(ArtistViewController.refresh), for: .valueChanged)
    }
    
    // MARK: - Actions -
    override func refresh() {
        super.refresh()
        
        output.viewIsReady(keyword)
    }
}

//MARK: - extension for ArtistViewInput -
extension ArtistViewController: ArtistViewInput {
    
    func setupInitialState(_ items: Array<Artist>) {
        self.items = items
        
        artistView.refresh.endRefreshing()
        artistView.collection.reloadData()
    }
}

//MARK: - extension for UICollectionView -
extension ArtistViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionCellIdentifire, for: indexPath) as! ArtistCell
        let item = items[indexPath.row]
        cell.setValues(item)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let artist = items[indexPath.row]
        output.openDetail(artist)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = CGSize(width: AR_CELL_WIDTH, height: AR_CELL_WIDTH*1.2)
        
        return size
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: AR_INSET, left: AR_INSET, bottom: AR_INSET, right: AR_INSET)
    }
}
