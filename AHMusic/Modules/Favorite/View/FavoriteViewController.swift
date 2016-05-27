//
//  FavoriteViewController.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 12/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

//MARK: - class FavoriteViewController -
class FavoriteViewController: BaseEventViewController {

    //MARK: - Initilize -
    init() {
        super.init(vcType: .Favorite)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Actions -
    override func favoriteAction(sender: AHButton) {
        super.favoriteAction(sender)

        let track = items[sender.indexPath.row]
        deleteFavoriteTrack(sender)
        output.favoriteTrack(sender.selected, track: track)

    }
    
    override func downloadAction(sender: AHButton) {
        super.downloadAction(sender)
        
        let track = items[sender.indexPath.row]
        output.downloadTrack(sender.selected, track: track)
        
        sender.enabled = !sender.selected
    }
    
    // MARK: - Priavte Method -
    private func deleteFavoriteTrack(sender: AHButton) {
        let track = items[sender.indexPath.row]
        let index = items.indexOf() {$0.id == track.id}
        items.removeAtIndex(index!)
        
        baseEventView.tableView.beginUpdates()
        baseEventView.tableView.deleteRowsAtIndexPaths([sender.indexPath], withRowAnimation: .None)
        baseEventView.tableView.endUpdates()
        
        baseEventView.tableView.reloadData()
    }
}