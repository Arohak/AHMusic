//
//  TrackViewController.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 12/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

//MARK: - class TrackViewController -
class TrackViewController: BaseViewController {

    var output: TrackViewOutput!
    
    let trackView = TrackView()
    var items = Array<Track>()
    let cellIdentifire = "trackCell"

    // MARK: - Life cycle -
    override func viewDidLoad() {
        super.viewDidLoad()

        baseConfig()
        output.viewIsReady(keyword)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        EventCenter.defaultCenter.register(self, handler: onEvent)
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        
        EventCenter.defaultCenter.unregister(self)
        resetTrackersState()
    }
    
    // MARK: - Private Method -
    private func baseConfig() {
        self.view = trackView
        
        trackView.tableView.dataSource = self
        trackView.tableView.delegate = self
        trackView.tableView.registerClass(TrackCell.self, forCellReuseIdentifier: cellIdentifire)
        trackView.refresh.addTarget(self, action: #selector(TrackViewController.refresh), forControlEvents: .ValueChanged)
    }
    
    private func resetTrackersState() {
        for item in items {
            try! dbHelper.realm.write  { item.played = false }
        }
        trackView.tableView.reloadData()
    }
    
    private func changeTrackState(track: Track, state: Bool) {
        let index = items.indexOf() { $0.id == track.id }
        if let index = index {
            try! dbHelper.realm.write  { items[index].played = state }
            
            let indexPath = NSIndexPath(forRow: index, inSection: 0)
            trackView.tableView.scrollToRowAtIndexPath(indexPath, atScrollPosition: .None, animated: false)
            trackView.tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .None)
        }
    }
    
    //MARK: - Events -
    func onEvent(data: MiniPlayerEvent) {
        switch data.state {
        case .Change:
            resetTrackersState()
            changeTrackState(data.result, state: true)
            
        case .Play:
            changeTrackState(data.result, state: true)
            
        default:
            changeTrackState(data.result, state: false)
        }
    }
    
    // MARK: - Actions -
    override func refresh() {
        super.refresh()
        
        output.viewIsReady(keyword)
    }
}

//MARK: - extension for TrackViewInput -
extension TrackViewController: TrackViewInput {
    
    func setupInitialState(items: Array<Track>) {
        self.items = items
        
        trackView.refresh.endRefreshing()
        trackView.tableView.reloadData()
    }
}

//MARK: - extension for UITableView -
extension TrackViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return items.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifire) as! TrackCell
        
        cell.cellContentView.playButton.addTarget(self, action: #selector(TrackViewController.playTrack(_:)), forControlEvents: .TouchUpInside)
        cell.cellContentView.playButton.indexPath = indexPath
        
        cell.cellContentView.linkButton.addTarget(self, action: #selector(TrackViewController.openLink(_:)), forControlEvents: .TouchUpInside)
        cell.cellContentView.linkButton.indexPath = indexPath
        
        cell.cellContentView.albumButton.addTarget(self, action: #selector(TrackViewController.openDeatilFromAlbum(_:)), forControlEvents: .TouchUpInside)
        cell.cellContentView.albumButton.indexPath = indexPath
        
        cell.cellContentView.artistButton.addTarget(self, action: #selector(TrackViewController.opendetailFromArtist(_:)), forControlEvents: .TouchUpInside)
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