//
//  DownloadViewController.swift
//  AHMusic
//
//  Created by AroHak on 22/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

//MARK: - class DownloadViewController -
class DownloadViewController: BaseEventViewController {
    
    //MARK: - Initilize -
    init() {
        super.init(vcType: .Download)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Actions -
    override func favoriteAction(sender: AHButton) {
        super.favoriteAction(sender)
        
        let track = items[sender.indexPath.row]
        output.favoriteTrack(sender.selected, track: track)
    }
    
    override func downloadAction(sender: AHButton) {
        super.downloadAction(sender)

        let track = items[sender.indexPath.row]
        deleteDownloadTrack(sender)
        output.downloadTrack(false, track: track)
    }
    
    // MARK: - Priavte Method -
    private func deleteDownloadTrack(sender: AHButton) {
        let track = items[sender.indexPath.row]
        let index = items.indexOf() {$0.id == track.id}
        items.removeAtIndex(index!)
        
        baseEventView.tableView.beginUpdates()
        baseEventView.tableView.deleteRowsAtIndexPaths([sender.indexPath], withRowAnimation: .None)
        baseEventView.tableView.endUpdates()
        
        baseEventView.tableView.reloadData()
    }
}

