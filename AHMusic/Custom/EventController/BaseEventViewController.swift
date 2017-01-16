//
//  BaseEventViewController.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 06/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

//MARK: - enum BaseVC -
enum BaseVC {
    case favorite
    case download
    case detail
}

//MARK: - class BaseEventViewController -
class BaseEventViewController: UIViewController {
    
    var output: BaseEventViewOutput!

    var vcType = BaseVC.detail
    var baseEventView: BaseEventView!
    var items = Array<Track>()
    let cellIdentifire = "trackCell"
    
    var totalValue : Float = 0.0
    var startValue : Float = 0.0
    
    //MARK: - Initilize -
    init(title: String) {
        super.init(nibName: nil, bundle: nil)

        self.title = title
    }
    
    init(vcType: BaseVC) {
        super.init(nibName: nil, bundle: nil)
        
        self.vcType = vcType
        baseEventView = BaseEventView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Life cycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        baseConfig()
        output.viewIsReady()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        onEvent();
        resetTrackersState()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        SwiftEventBus.unregister(self)
        resetTrackersState()
    }
    
    // MARK: - Private Method -
    fileprivate func baseConfig() {
        self.view = baseEventView
        
        baseEventView.tableView.dataSource = self
        baseEventView.tableView.delegate = self
        baseEventView.tableView.register(TrackShortCell.self, forCellReuseIdentifier: cellIdentifire)
        baseEventView.refresh.addTarget(self, action: #selector(BaseEventViewController.refresh), for: .valueChanged)
    }
    
    fileprivate func resetTrackersState() {
        for item in items {
            try! dbHelper.realm.write  { item.played = false }
        }
        baseEventView.tableView.reloadData()
    }
    
    fileprivate func changeTrackState(_ track: Track, state: Bool) {
        let index = items.index() { $0.id == track.id }
        if let index = index {
            try! dbHelper.realm.write  { items[index].played = state }
            
            let indexPath = IndexPath(row: index, section: 0)
            baseEventView.tableView.scrollToRow(at: indexPath, at: .none, animated: false)
            baseEventView.tableView.reloadRows(at: [indexPath], with: .none)
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
    func refresh() {
        switch vcType {
        case .download, .favorite:
            output.viewIsReady()

        case .detail:
            baseEventView.refresh.endRefreshing()
        }
    }
}

extension BaseEventViewController: BaseEventViewInput {
    
    func setupInitialState(_ items: Array<Track>) {
        self.items = items.reversed()

        baseEventView.refresh.endRefreshing()
        baseEventView.tableView.reloadData()
    }
}

//MARK: - extension for UITableView -
extension BaseEventViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifire) as! TrackShortCell
        cell.cellContentView.playButton.addTarget(self, action: #selector(BaseEventViewController.playTrack(_:)), for: .touchUpInside)
        cell.cellContentView.playButton.indexPath = indexPath
        
        cell.cellContentView.linkButton.addTarget(self, action: #selector(BaseEventViewController.openLink(_:)), for: .touchUpInside)
        cell.cellContentView.linkButton.indexPath = indexPath
        
        cell.cellContentView.favoriteButton.addTarget(self, action: #selector(BaseEventViewController.favoriteAction(_:)), for: .touchUpInside)
        cell.cellContentView.favoriteButton.indexPath = indexPath
        
        cell.cellContentView.downloadButton.addTarget(self, action: #selector(BaseEventViewController.downloadAction(_:)), for: .touchUpInside)
        cell.cellContentView.downloadButton.indexPath = indexPath
        
        let track = items[indexPath.row]
        cell.setValues(track, type: vcType)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return DE_CELL_HEIGHT
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
    
    func favoriteAction(_ sender: AHButton) {
        sender.isSelected = !sender.isSelected
    }
    
    func downloadAction(_ sender: AHButton) {
        sender.isSelected = !sender.isSelected
        
        switch vcType {
        case .favorite, .detail:
            downloadProgress(sender)
        default:
            break
        }
    }
    
    // MARK: - Private Method -
    fileprivate func downloadProgress(_ sender: AHButton) {
        sender.isEnabled = !sender.isSelected
        sender.setBackgroundImage(UIImage(named: "img_bg_transparent"), for: .normal)

        let track = items[sender.indexPath.row]
        let cell = baseEventView.tableView.cellForRow(at: sender.indexPath) as! TrackShortCell
        
        apiHelper.download(track: track, inProgress: { value in
            self.totalValue = Float(value)
            cell.cellContentView.shapeLayer.animateProgressView(self.startValue, toV: self.totalValue, dur: 0.0001)
            self.startValue = self.totalValue
        }) { state in
            self.startValue = 0.0
            self.totalValue = 0.0
            if state {
                sender.setBackgroundImage(UIImage(named: "img_tr_download_select"), for: .normal)
                cell.cellContentView.shapeLayer.hideProgressView()
                
                self.output.downloadTrack(sender.isSelected, track: track)
            }
        }
    }
}
