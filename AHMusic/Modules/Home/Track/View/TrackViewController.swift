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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        onEvent()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        SwiftEventBus.unregister(self)
        resetTrackersState()
    }
    
    // MARK: - Private Method -
    fileprivate func baseConfig() {
        self.view = trackView
        
        trackView.tableView.dataSource = self
        trackView.tableView.delegate = self
        trackView.tableView.register(TrackCell.self, forCellReuseIdentifier: cellIdentifire)
        trackView.refresh.addTarget(self, action: #selector(TrackViewController.refresh), for: .valueChanged)
    }
    
    fileprivate func resetTrackersState() {
        for item in items {
            try! dbHelper.realm.write  { item.played = false }
        }
        trackView.tableView.reloadData()
    }
    
    fileprivate func changeTrackState(_ track: Track, state: Bool) {
        let index = items.index() { $0.id == track.id }
        if let index = index {
            try! dbHelper.realm.write  { items[index].played = state }
            
            let indexPath = IndexPath(row: index, section: 0)
            trackView.tableView.scrollToRow(at: indexPath, at: .none, animated: false)
            trackView.tableView.reloadRows(at: [indexPath], with: .none)
        }
    }
    
    //MARK: - SwiftEventBus -
    func onEvent() {
        SwiftEventBus.onMainThread(self, name: kEvantMiniPlayer) { result in
            let evant = result.userInfo?["info"] as? MiniPlayerEvent
            if let data = evant {
                switch data.state {
                case .change:
                    self.resetTrackersState()
                    self.changeTrackState(data.result, state: true)
                    
                case .play:
                    self.changeTrackState(data.result, state: true)
                    
                default:
                    self.changeTrackState(data.result, state: false)
                }
            }
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
    
    func setupInitialState(_ items: Array<Track>) {
        self.items = items
        
        trackView.refresh.endRefreshing()
        trackView.tableView.reloadData()
    }
}

//MARK: - extension for UITableView -
extension TrackViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifire) as! TrackCell
        
        cell.cellContentView.playButton.addTarget(self, action: #selector(TrackViewController.playTrack(_:)), for: .touchUpInside)
        cell.cellContentView.playButton.indexPath = indexPath
        
        cell.cellContentView.linkButton.addTarget(self, action: #selector(TrackViewController.openLink(_:)), for: .touchUpInside)
        cell.cellContentView.linkButton.indexPath = indexPath
        
        cell.cellContentView.albumButton.addTarget(self, action: #selector(TrackViewController.openDeatilFromAlbum(_:)), for: .touchUpInside)
        cell.cellContentView.albumButton.indexPath = indexPath
        
        cell.cellContentView.artistButton.addTarget(self, action: #selector(TrackViewController.opendetailFromArtist(_:)), for: .touchUpInside)
        cell.cellContentView.artistButton.indexPath = indexPath
        
        let track = items[indexPath.row]
        cell.setValues(track)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return TR_CELL_HEIGHT
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let track = items[indexPath.row]
        output.openTrackDetail(track, items: items)
    }
    
    // MARK: - Actions -
    func playTrack(_ sender: AHButton) {
        output.playTrack(sender.indexPath.row, tracks: items)
    }
    
    func openLink(_ sender: AHButton) {
        let track = items[sender.indexPath.row]
        output.openLink(track)
    }
    
    func openDeatilFromAlbum(_ sender: AHButton) {
        let track = items[sender.indexPath.row]
        output.openDetail(track.album)
    }
    
    func opendetailFromArtist(_ sender: AHButton) {
        let track = items[sender.indexPath.row]
        output.openDetail(track.artist)
    }
}
