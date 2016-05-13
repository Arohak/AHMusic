//
//  AlbumPresenter.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 12/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

//MARK: - class AlbumPresenter
class AlbumPresenter: NSObject {

    var view: AlbumViewInput!
    var interactor: AlbumInteractorInput!
    
    var keyword: String!
    
    //MARK: - Initilize
    override init() {
        super.init()
    }
    
    convenience init(name: String) {
        self.init()
        
        self.keyword = name
    }
}

//MARK: - extension for AlbumModuleInput
extension AlbumPresenter: AlbumModuleInput {

}

//MARK: - extension for AlbumViewOutput
extension AlbumPresenter: AlbumViewOutput {
    
    func viewIsReady() {
        interactor.searchAlbum(keyword)
    }
    
    func openLink(album: Album) {
        let vc = WebViewController(resourceName: album.title, url: NSURL(string: album.link)!)
        rootVC.presentViewController(UINavigationController(rootViewController: vc), animated: true, completion: nil)
    }
}

//MARK: - extension for AlbumInteractorOutput
extension AlbumPresenter: AlbumInteractorOutput {
 
    func searchResultIsReady(items: Array<Album>) {
        view.setupInitialState(items)
    }
}