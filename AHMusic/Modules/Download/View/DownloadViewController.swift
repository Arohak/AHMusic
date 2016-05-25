//
//  DownloadViewController.swift
//  AHMusic
//
//  Created by AroHak on 22/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

//MARK: - class DownloadViewController -
class DownloadViewController: UIViewController {

    var output: DownloadViewOutput!
    
    let downloadView = DownloadView()
    var items = Array<Track>()
    let cellIdentifire = "trackCell"
    
    // MARK: - Life cycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        baseConfig()
        output.viewIsReady()
    }
    
    // MARK: - Private Method -
    private func baseConfig() {
        self.view = downloadView
        
        downloadView.tableView.dataSource = self
        downloadView.tableView.delegate = self
        downloadView.tableView.registerClass(TrackShortCell.self, forCellReuseIdentifier: cellIdentifire)
    }
}


//MARK: - extension for DownloadViewInput -
extension DownloadViewController: DownloadViewInput {
    
    func setupInitialState(items: Array<Track>) {
        self.items = items.reverse()
        
        downloadView.tableView.reloadData()
    }
}

//MARK: - extension for UITableView -
extension DownloadViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifire) as! TrackShortCell
        cell.cellContentView.playButton.addTarget(self, action: #selector(DownloadViewController.playTrack(_:)), forControlEvents: .TouchUpInside)
        cell.cellContentView.playButton.indexPath = indexPath
        
        cell.cellContentView.linkButton.addTarget(self, action: #selector(DownloadViewController.openLink(_:)), forControlEvents: .TouchUpInside)
        cell.cellContentView.linkButton.indexPath = indexPath
        
        cell.cellContentView.favoriteButton.addTarget(self, action: #selector(DownloadViewController.favoriteAction(_:)), forControlEvents: .TouchUpInside)
        cell.cellContentView.favoriteButton.indexPath = indexPath
        
        cell.cellContentView.downloadButton.addTarget(self, action: #selector(DownloadViewController.downloadAction(_:)), forControlEvents: .TouchUpInside)
        cell.cellContentView.downloadButton.indexPath = indexPath
        cell.cellContentView.downloadButton.setBackgroundImage(UIImage(named: "img_tr_download_delete"), forState: .Selected)

        let track = items[indexPath.row]
        cell.setValues(track)
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        return DE_CELL_HEIGHT
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let track = items[indexPath.row]
        output.openTrackDetail(track, items: items)
    }
    
    // MARK: - Actions -
    func playTrack(sender: AHButton) {
        output.playTrack(sender.indexPath.row, tracks: items)
    }
    
    func openLink(sender: AHButton) {
        let track = items[sender.indexPath.row]
        output.openLink(track)
    }
    
    func favoriteAction(sender: AHButton) {
        sender.selected = !sender.selected
        let track = items[sender.indexPath.row]
        
        output.favoriteTrack(sender.selected, track: track)
    }
    
    func downloadAction(sender: AHButton) {
        let track = items[sender.indexPath.row]
        
        deleteDownloadTrack(sender)
        output.downloadTrack(false, track: track)
    }
    
    // MARK: - Priavte Method -
    private func deleteDownloadTrack(sender: AHButton) {
        let track = items[sender.indexPath.row]
        let index = items.indexOf() {$0.id == track.id}
        items.removeAtIndex(index!)
        
        downloadView.tableView.beginUpdates()
        downloadView.tableView.deleteRowsAtIndexPaths([sender.indexPath], withRowAnimation: .None)
        downloadView.tableView.endUpdates()
        
        downloadView.tableView.reloadData()
    }
}

