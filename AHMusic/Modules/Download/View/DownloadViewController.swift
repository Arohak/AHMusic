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
        super.init(vcType: .download)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Actions -
    override func favoriteAction(_ sender: AHButton) {
        super.favoriteAction(sender)
        
        let track = items[sender.indexPath.row]
        output.favoriteTrack(sender.isSelected, track: track)
    }
    
    override func downloadAction(_ sender: AHButton) {
        super.downloadAction(sender)

        let track = items[sender.indexPath.row]
        deleteDownloadTrack(sender)
        output.downloadTrack(false, track: track)
    }
    
    // MARK: - Priavte Method -
    fileprivate func deleteDownloadTrack(_ sender: AHButton) {
        let track = items[sender.indexPath.row]
        let index = items.index() {$0.id == track.id}
        items.remove(at: index!)
        
        baseEventView.tableView.beginUpdates()
        baseEventView.tableView.deleteRows(at: [sender.indexPath], with: .none)
        baseEventView.tableView.endUpdates()
        
        baseEventView.tableView.reloadData()
    }
}

