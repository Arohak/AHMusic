//
//  BaseEventViewController.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 06/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

//MARK: - enum BaseVC -
enum BaseVC {
    case Favorite
    case Download
    case Detail
}

//MARK: - class BaseEventViewController -
class BaseEventViewController: UIViewController {
    
    var output: BaseEventViewOutput!

    var vcType = BaseVC.Detail
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
        self.view = baseEventView
        
        baseEventView.tableView.dataSource = self
        baseEventView.tableView.delegate = self
        baseEventView.tableView.registerClass(TrackShortCell.self, forCellReuseIdentifier: cellIdentifire)
        baseEventView.refresh.addTarget(self, action: #selector(BaseEventViewController.refresh), forControlEvents: .ValueChanged)
    }
    
    private func resetTrackersState() {
        for item in items {
            try! dbHelper.realm.write  { item.played = false }
        }
        baseEventView.tableView.reloadData()
    }
    
    private func changeTrackState(track: Track, state: Bool) {
        let index = items.indexOf() { $0.id == track.id }
        if let index = index {
            try! dbHelper.realm.write  { items[index].played = state }
            
            let indexPath = NSIndexPath(forRow: index, inSection: 0)
            baseEventView.tableView.scrollToRowAtIndexPath(indexPath, atScrollPosition: .None, animated: false)
            baseEventView.tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .None)
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
    func refresh() {
        switch vcType {
        case .Download, .Favorite:
            output.viewIsReady()

        case .Detail:
            baseEventView.refresh.endRefreshing()
        }
    }
}

extension BaseEventViewController: BaseEventViewInput {
    
    func setupInitialState(items: Array<Track>) {
        self.items = items.reverse()

        baseEventView.refresh.endRefreshing()
        baseEventView.tableView.reloadData()
    }
}

//MARK: - extension for UITableView -
extension BaseEventViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifire) as! TrackShortCell
        cell.cellContentView.playButton.addTarget(self, action: #selector(BaseEventViewController.playTrack(_:)), forControlEvents: .TouchUpInside)
        cell.cellContentView.playButton.indexPath = indexPath
        
        cell.cellContentView.linkButton.addTarget(self, action: #selector(BaseEventViewController.openLink(_:)), forControlEvents: .TouchUpInside)
        cell.cellContentView.linkButton.indexPath = indexPath
        
        cell.cellContentView.favoriteButton.addTarget(self, action: #selector(BaseEventViewController.favoriteAction(_:)), forControlEvents: .TouchUpInside)
        cell.cellContentView.favoriteButton.indexPath = indexPath
        
        cell.cellContentView.downloadButton.addTarget(self, action: #selector(BaseEventViewController.downloadAction(_:)), forControlEvents: .TouchUpInside)
        cell.cellContentView.downloadButton.indexPath = indexPath
        
        let track = items[indexPath.row]
        cell.setValues(track, type: vcType)
        
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
    }
    
    func downloadAction(sender: AHButton) {
        sender.selected = !sender.selected
        
        switch vcType {
        case .Favorite, .Detail:
            downloadProgress(sender)
        default:
            break
        }
    }
    
    // MARK: - Private Method -
    private func downloadProgress(sender: AHButton) {
        sender.enabled = !sender.selected
        sender.setBackgroundImage(UIImage(named: "img_bg_transparent"), forState: .Normal)

        let track = items[sender.indexPath.row]
        let cell = baseEventView.tableView.cellForRowAtIndexPath(sender.indexPath) as! TrackShortCell
        
        apiHelper.downloadProgress(track, progress: { (bytesRead, totalBytesRead, totalBytesExpectedToRead) in
            self.totalValue = Float(totalBytesRead) / Float(totalBytesExpectedToRead)
            cell.cellContentView.shapeLayer.animateProgressView(self.startValue, toV: self.totalValue, dur: 0.0001)
            self.startValue = self.totalValue
        }) { error in
            self.startValue = 0.0
            self.totalValue = 0.0
            
            if error == nil {
                sender.setBackgroundImage(UIImage(named: "img_tr_download_select"), forState: .Normal)
                cell.cellContentView.shapeLayer.hideProgressView()
                
                self.output.downloadTrack(sender.selected, track: track)
            }
        }
    }
}