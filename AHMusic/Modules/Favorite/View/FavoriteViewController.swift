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
        favoriteView.tableView.registerClass(TrackShortCell.self, forCellReuseIdentifier: cellIdentifire)
    }
}

//MARK: - extension for FavoriteViewInput -
extension FavoriteViewController: FavoriteViewInput {
    
    func setupInitialState(items: Array<Track>) {
        self.items = items.reverse()
        
        favoriteView.tableView.reloadData()
    }
    
    func stopPlayer(index: Int) {
        let indexPath = NSIndexPath(forRow: index, inSection: 0)
        let cell = favoriteView.tableView.cellForRowAtIndexPath(indexPath) as! TrackShortCell
        cell.cellContentView.playButton.selected = false
    }
    
    func playPauseTrack(index: Int) {
        let indexPath = NSIndexPath(forRow: index, inSection: 0)
        let cell = favoriteView.tableView.cellForRowAtIndexPath(indexPath) as! TrackShortCell
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
        let cellOne = favoriteView.tableView.cellForRowAtIndexPath(indexPathOne) as? TrackShortCell
        let cellTwo = favoriteView.tableView.cellForRowAtIndexPath(indexPathTwo) as? TrackShortCell
        if items.count > 1 {
            if let _ = cellTwo {
                cellOne!.cellContentView.playButton.selected = false
                cellTwo!.cellContentView.playButton.selected = true
                
                cellOne!.cellContentView.backgroundColor = CLEAR
                cellTwo!.cellContentView.backgroundColor = BLUE_LIGHT1
                
            } else {
                favoriteView.tableView.scrollToRowAtIndexPath(indexPathTwo, atScrollPosition: .Middle, animated: false)
                let cOne = favoriteView.tableView.cellForRowAtIndexPath(indexPathOne) as! TrackShortCell
                let cTwo = favoriteView.tableView.cellForRowAtIndexPath(indexPathTwo) as! TrackShortCell
                cOne.cellContentView.playButton.selected = false
                cTwo.cellContentView.playButton.selected = true
                
                cOne.cellContentView.backgroundColor = CLEAR
                cTwo.cellContentView.backgroundColor = BLUE_LIGHT1
            }
        }
    }
    
    private func changeButtonState(indexPath: NSIndexPath, indexPathNext: NSIndexPath, indexPathPrev: NSIndexPath) {
        let cell = favoriteView.tableView.cellForRowAtIndexPath(indexPath) as? TrackShortCell
        let cellNext = favoriteView.tableView.cellForRowAtIndexPath(indexPathNext) as? TrackShortCell
        let cellPrev = favoriteView.tableView.cellForRowAtIndexPath(indexPathPrev) as? TrackShortCell
        
        if cellNext != nil && cellPrev != nil {
            cell!.cellContentView.playButton.selected = true
            cellNext!.cellContentView.playButton.selected = false
            cellPrev!.cellContentView.playButton.selected = false
            
            cell!.cellContentView.backgroundColor = BLUE_LIGHT1
            cellNext!.cellContentView.backgroundColor = CLEAR
            cellPrev!.cellContentView.backgroundColor = CLEAR
            
        } else if cellNext != nil {
            favoriteView.tableView.scrollToRowAtIndexPath(indexPathNext, atScrollPosition: .Middle, animated: false)
            let c = favoriteView.tableView.cellForRowAtIndexPath(indexPath) as! TrackShortCell
            let cNext = favoriteView.tableView.cellForRowAtIndexPath(indexPathNext) as! TrackShortCell
            let cPrev = favoriteView.tableView.cellForRowAtIndexPath(indexPathPrev) as! TrackShortCell
            c.cellContentView.playButton.selected = true
            cNext.cellContentView.playButton.selected = false
            cPrev.cellContentView.playButton.selected = false
            
            c.cellContentView.backgroundColor = BLUE_LIGHT1
            cNext.cellContentView.backgroundColor = CLEAR
            cPrev.cellContentView.backgroundColor = CLEAR
        } else if cellPrev != nil {
            favoriteView.tableView.scrollToRowAtIndexPath(indexPathPrev, atScrollPosition: .Middle, animated: false)
            let c = favoriteView.tableView.cellForRowAtIndexPath(indexPath) as! TrackShortCell
            let cNext = favoriteView.tableView.cellForRowAtIndexPath(indexPathNext) as! TrackShortCell
            let cPrev = favoriteView.tableView.cellForRowAtIndexPath(indexPathPrev) as! TrackShortCell
            c.cellContentView.playButton.selected = true
            cNext.cellContentView.playButton.selected = false
            cPrev.cellContentView.playButton.selected = false
            
            c.cellContentView.backgroundColor = BLUE_LIGHT1
            cNext.cellContentView.backgroundColor = CLEAR
            cPrev.cellContentView.backgroundColor = CLEAR
        }
    }
}

//MARK: - extension for UITableView -
extension FavoriteViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifire) as! TrackShortCell
        cell.cellContentView.playButton.addTarget(self, action: #selector(FavoriteViewController.playTrack(_:)), forControlEvents: .TouchUpInside)
        cell.cellContentView.playButton.indexPath = indexPath
        
        cell.cellContentView.linkButton.addTarget(self, action: #selector(FavoriteViewController.openLink(_:)), forControlEvents: .TouchUpInside)
        cell.cellContentView.linkButton.indexPath = indexPath
        
        cell.cellContentView.favoriteButton.addTarget(self, action: #selector(FavoriteViewController.favoriteAction(_:)), forControlEvents: .TouchUpInside)
        cell.cellContentView.favoriteButton.indexPath = indexPath
        
        cell.cellContentView.downloadButton.addTarget(self, action: #selector(FavoriteViewController.downloadAction(_:)), forControlEvents: .TouchUpInside)
        cell.cellContentView.downloadButton.indexPath = indexPath
        
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

        deleteFavoriteTrack(sender)
        output.favoriteTrack(sender.selected, track: track)
    }
    
    func downloadAction(sender: AHButton) {
        sender.selected = !sender.selected
        
        let track = items[sender.indexPath.row]
        output.downloadTrack(sender.selected, track: track)
    }
    
    // MARK: - Priavte Method -
    private func deleteFavoriteTrack(sender: AHButton) {
        let track = items[sender.indexPath.row]
        let index = items.indexOf() {$0.id == track.id}
        items.removeAtIndex(index!)
        
        favoriteView.tableView.beginUpdates()
        favoriteView.tableView.deleteRowsAtIndexPaths([sender.indexPath], withRowAnimation: .None)
        favoriteView.tableView.endUpdates()
        
        favoriteView.tableView.reloadData()
    }
}