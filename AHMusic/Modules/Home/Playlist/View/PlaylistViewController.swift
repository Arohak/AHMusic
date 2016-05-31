//
//  PlaylistViewController.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 12/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

//MARK: - class PlaylistViewController -
class PlaylistViewController: BaseViewController {

    var output: PlaylistViewOutput!

    let playlistView = PlaylistView()
    var items = Array<Playlist>()
    let cellIdentifire = "playlistCell"
    
    // MARK: - Life cycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        baseConfig()
        output.viewIsReady(keyword)
    }
    
    // MARK: - Private Method -
    private func baseConfig() {
        self.view = playlistView
        
        playlistView.tableView.dataSource = self
        playlistView.tableView.delegate = self
        playlistView.tableView.registerClass(PlaylistCell.self, forCellReuseIdentifier: cellIdentifire)
        playlistView.refresh.addTarget(self, action: #selector(PlaylistViewController.refresh), forControlEvents: .ValueChanged)
    }
    
    // MARK: - Actions -
    override func refresh() {
        super.refresh()
        
        output.viewIsReady(keyword)
    }
}

//MARK: - extension for PlaylistViewInput -
extension PlaylistViewController: PlaylistViewInput {
    
    func setupInitialState(items: Array<Playlist>) {
        self.items = items
        
        playlistView.refresh.endRefreshing()
        playlistView.tableView.reloadData()
    }
}

//MARK: - extension for UITableView -
extension PlaylistViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifire) as! PlaylistCell
        
        cell.cellContentView.linkButton.addTarget(self, action: #selector(PlaylistViewController.openLink(_:)), forControlEvents: .TouchUpInside)
        cell.cellContentView.linkButton.indexPath = indexPath
        
        let playlist = items[indexPath.row]
        cell.setValues(playlist)
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        return PL_CELL_HEIGHT
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let playlist = items[indexPath.row]
        output.openDetail(playlist)
    }
    
    // MARK: - Actions -
    func openLink(sender: AHButton) {
        let playlist = items[sender.indexPath.row]
        output.openLink(playlist)
    }
}
