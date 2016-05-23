//
//  FavoriteViewController.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 12/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

//MARK: - class FavoriteViewController -
class FavoriteViewController: UIViewController {

    var output: FavoriteViewOutput!
    
    let favoriteView = FavoriteView()
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
        self.view = favoriteView
        
        favoriteView.tableView.dataSource = self
        favoriteView.tableView.delegate = self
        favoriteView.tableView.registerClass(TrackCell.self, forCellReuseIdentifier: cellIdentifire)
        favoriteView.refresh.addTarget(self, action: #selector(TrackViewController.refresh), forControlEvents: .ValueChanged)
    }
    
    // MARK: - Actions -
    func refresh() {
        output.viewIsReady()
    }
}

//MARK: - extension for FavoriteViewInput -
extension FavoriteViewController: FavoriteViewInput {
    
    func setupInitialState(items: Array<Track>) {
        self.items = items
        
        favoriteView.refresh.endRefreshing()

        favoriteView.tableView.reloadData()
    }
    
    func stopPlayer(index: Int) {
        let indexPath = NSIndexPath(forRow: index, inSection: 0)
        let cell = favoriteView.tableView.cellForRowAtIndexPath(indexPath) as! TrackCell
        cell.cellContentView.playButton.selected = false
    }
    
    func playPauseTrack(index: Int) {
        let indexPath = NSIndexPath(forRow: index, inSection: 0)
        let cell = favoriteView.tableView.cellForRowAtIndexPath(indexPath) as! TrackCell
        cell.cellContentView.playButton.selected = !cell.cellContentView.playButton.selected
    }
    
    func nextTrack(index: Int) {
        let indexPath = NSIndexPath(forRow: index - 1, inSection: 0)
        let indexPathNext = NSIndexPath(forRow: index, inSection: 0)
        
        changeButtonState(indexPath, indexPathTwo: indexPathNext)
    }
    
    func prevTrack(index: Int) {
        let indexPath = NSIndexPath(forRow: index + 1, inSection: 0)
        let indexPathPrev = NSIndexPath(forRow: index, inSection: 0)

        changeButtonState(indexPath, indexPathTwo: indexPathPrev)
    }
    
    func changeTrack(index: Int) {
        if index == 0 {
            prevTrack(index)
        } else if index == items.count - 1 {
            nextTrack(index)
        } else {
            let indexPath = NSIndexPath(forRow: index, inSection: 0)
            let indexPathNext = NSIndexPath(forRow: index + 1, inSection: 0)
            let indexPathPrev = NSIndexPath(forRow: index - 1, inSection: 0)
            
            changeButtonState(indexPath, indexPathNext: indexPathNext, indexPathPrev: indexPathPrev)
        }
    }
    
    // MARK: - Private Method -
    private func changeButtonState(indexPathOne: NSIndexPath, indexPathTwo: NSIndexPath) {
        let cellOne = favoriteView.tableView.cellForRowAtIndexPath(indexPathOne) as? TrackCell
        let cellTwo = favoriteView.tableView.cellForRowAtIndexPath(indexPathTwo) as? TrackCell
        if items.count > 1 {
            if let _ = cellTwo {
                cellOne!.cellContentView.playButton.selected = false
                cellTwo!.cellContentView.playButton.selected = true
            } else {
                favoriteView.tableView.scrollToRowAtIndexPath(indexPathTwo, atScrollPosition: .Middle, animated: false)
                let cOne = favoriteView.tableView.cellForRowAtIndexPath(indexPathOne) as! TrackCell
                let cTwo = favoriteView.tableView.cellForRowAtIndexPath(indexPathTwo) as! TrackCell
                cOne.cellContentView.playButton.selected = false
                cTwo.cellContentView.playButton.selected = true
            }
        }
    }
    
    private func changeButtonState(indexPath: NSIndexPath, indexPathNext: NSIndexPath, indexPathPrev: NSIndexPath) {
        let cell = favoriteView.tableView.cellForRowAtIndexPath(indexPath) as? TrackCell
        let cellNext = favoriteView.tableView.cellForRowAtIndexPath(indexPathNext) as? TrackCell
        let cellPrev = favoriteView.tableView.cellForRowAtIndexPath(indexPathPrev) as? TrackCell
        
        if cellNext != nil && cellPrev != nil {
            cell!.cellContentView.playButton.selected = true
            cellNext!.cellContentView.playButton.selected = false
            cellPrev!.cellContentView.playButton.selected = false
        } else if cellNext != nil {
            favoriteView.tableView.scrollToRowAtIndexPath(indexPathNext, atScrollPosition: .Middle, animated: false)
            let c = favoriteView.tableView.cellForRowAtIndexPath(indexPath) as! TrackCell
            let cNext = favoriteView.tableView.cellForRowAtIndexPath(indexPathNext) as! TrackCell
            let cPrev = favoriteView.tableView.cellForRowAtIndexPath(indexPathPrev) as! TrackCell
            c.cellContentView.playButton.selected = true
            cNext.cellContentView.playButton.selected = false
            cPrev.cellContentView.playButton.selected = false
        } else if cellPrev != nil {
            favoriteView.tableView.scrollToRowAtIndexPath(indexPathPrev, atScrollPosition: .Middle, animated: false)
            let c = favoriteView.tableView.cellForRowAtIndexPath(indexPath) as! TrackCell
            let cNext = favoriteView.tableView.cellForRowAtIndexPath(indexPathNext) as! TrackCell
            let cPrev = favoriteView.tableView.cellForRowAtIndexPath(indexPathPrev) as! TrackCell
            c.cellContentView.playButton.selected = true
            cNext.cellContentView.playButton.selected = false
            cPrev.cellContentView.playButton.selected = false
        }
    }
}

//MARK: - extension for UITableView -
extension FavoriteViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return items.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifire) as! TrackCell
        
        cell.cellContentView.playButton.addTarget(self, action: #selector(FavoriteViewController.playTrack(_:)), forControlEvents: .TouchUpInside)
        cell.cellContentView.playButton.indexPath = indexPath
        
        cell.cellContentView.linkButton.addTarget(self, action: #selector(FavoriteViewController.openLink(_:)), forControlEvents: .TouchUpInside)
        cell.cellContentView.linkButton.indexPath = indexPath
        
        cell.cellContentView.albumButton.addTarget(self, action: #selector(FavoriteViewController.openDeatilFromAlbum(_:)), forControlEvents: .TouchUpInside)
        cell.cellContentView.albumButton.indexPath = indexPath
        
        cell.cellContentView.artistButton.addTarget(self, action: #selector(FavoriteViewController.opendetailFromArtist(_:)), forControlEvents: .TouchUpInside)
        cell.cellContentView.artistButton.indexPath = indexPath
        
        let track = items[indexPath.row]
        cell.setValues(track)
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        return TR_CELL_HEIGHT
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
    
    func openDeatilFromAlbum(sender: AHButton) {
        let track = items[sender.indexPath.row]
        output.openDetail(track.album)
    }
    
    func opendetailFromArtist(sender: AHButton) {
        let track = items[sender.indexPath.row]
        output.openDetail(track.artist)
    }
}