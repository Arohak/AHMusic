//
//  DetailViewController.swift
//  AHMusic
//
//  Created by AroHak on 15/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

//MARK: - class DetailViewController -
class DetailViewController: UIViewController {

    var output: DetailViewOutput!

    var detail: Detail!
    var headerHeight: CGFloat!
    var items = Array<Track>()
    
    let cellIdentifire = "detailCell"
    
    lazy var detailView: DetailView = {
        let view = DetailView(detail: self.detail, headerRect: CGRect(x: 0, y: 0, width: ScreenSize.WIDTH, height: self.headerHeight))
        view.backgroundColor = WHITE
        view.tableView.dataSource = self
        view.tableView.delegate = self
        view.tableView.registerClass(TrackShortCell.self, forCellReuseIdentifier: self.cellIdentifire)
        
        return view
    }()
    
    //MARK: - Initilize -
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    convenience init(title: String, detail: Detail, headerHeight: CGFloat = DE_HEADER_HEIGHT) {
        self.init()
        
        self.title = title
        self.headerHeight = headerHeight
        self.detail = detail
        if let tracks = self.detail.tracks { self.items = tracks }
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
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        let headerView = detailView.tableView.tableHeaderView as! ParallaxHeaderView
        headerView.refreshBlurViewForNewImage()
    }
    
    // MARK: - Private Methods -
    private func baseConfig() {
        self.view = detailView
    }
}

//MARK: - extension for DetailViewInput -
extension DetailViewController: DetailViewInput {
    
    func setupInitialState() {
        
    }
    
    func stopPlayer(index: Int) {
        let indexPath = NSIndexPath(forRow: index, inSection: 0)
        let cell = detailView.tableView.cellForRowAtIndexPath(indexPath) as! TrackShortCell
        cell.cellContentView.playButton.selected = false
    }
    
    func playPauseTrack(index: Int) {
        let indexPath = NSIndexPath(forRow: index, inSection: 0)
        let cell = detailView.tableView.cellForRowAtIndexPath(indexPath) as! TrackShortCell
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
        let cellOne = detailView.tableView.cellForRowAtIndexPath(indexPathOne) as? TrackShortCell
        let cellTwo = detailView.tableView.cellForRowAtIndexPath(indexPathTwo) as? TrackShortCell
        if items.count > 1 {
            if let _ = cellTwo {
                cellOne!.cellContentView.playButton.selected = false
                cellTwo!.cellContentView.playButton.selected = true
                
                cellOne!.cellContentView.backgroundColor = CLEAR
                cellTwo!.cellContentView.backgroundColor = BLUE_LIGHT1
                
            } else {
                detailView.tableView.scrollToRowAtIndexPath(indexPathTwo, atScrollPosition: .Middle, animated: false)
                let cOne = detailView.tableView.cellForRowAtIndexPath(indexPathOne) as! TrackShortCell
                let cTwo = detailView.tableView.cellForRowAtIndexPath(indexPathTwo) as! TrackShortCell
                cOne.cellContentView.playButton.selected = false
                cTwo.cellContentView.playButton.selected = true
                
                cOne.cellContentView.backgroundColor = CLEAR
                cTwo.cellContentView.backgroundColor = BLUE_LIGHT1
            }
        }
    }
    
    private func changeButtonState(indexPath: NSIndexPath, indexPathNext: NSIndexPath, indexPathPrev: NSIndexPath) {
        let cell = detailView.tableView.cellForRowAtIndexPath(indexPath) as? TrackShortCell
        let cellNext = detailView.tableView.cellForRowAtIndexPath(indexPathNext) as? TrackShortCell
        let cellPrev = detailView.tableView.cellForRowAtIndexPath(indexPathPrev) as? TrackShortCell
        
        if cellNext != nil && cellPrev != nil {
            cell!.cellContentView.playButton.selected = true
            cellNext!.cellContentView.playButton.selected = false
            cellPrev!.cellContentView.playButton.selected = false
            
            cell!.cellContentView.backgroundColor = BLUE_LIGHT1
            cellNext!.cellContentView.backgroundColor = CLEAR
            cellPrev!.cellContentView.backgroundColor = CLEAR
            
        } else if cellNext != nil {
            detailView.tableView.scrollToRowAtIndexPath(indexPathNext, atScrollPosition: .Middle, animated: false)
            let c = detailView.tableView.cellForRowAtIndexPath(indexPath) as! TrackShortCell
            let cNext = detailView.tableView.cellForRowAtIndexPath(indexPathNext) as! TrackShortCell
            let cPrev = detailView.tableView.cellForRowAtIndexPath(indexPathPrev) as! TrackShortCell
            c.cellContentView.playButton.selected = true
            cNext.cellContentView.playButton.selected = false
            cPrev.cellContentView.playButton.selected = false
            
            c.cellContentView.backgroundColor = BLUE_LIGHT1
            cNext.cellContentView.backgroundColor = CLEAR
            cPrev.cellContentView.backgroundColor = CLEAR
        } else if cellPrev != nil {
            detailView.tableView.scrollToRowAtIndexPath(indexPathPrev, atScrollPosition: .Middle, animated: false)
            let c = detailView.tableView.cellForRowAtIndexPath(indexPath) as! TrackShortCell
            let cNext = detailView.tableView.cellForRowAtIndexPath(indexPathNext) as! TrackShortCell
            let cPrev = detailView.tableView.cellForRowAtIndexPath(indexPathPrev) as! TrackShortCell
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
extension DetailViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifire) as! TrackShortCell
        cell.cellContentView.playButton.addTarget(self, action: #selector(DetailViewController.playTrack(_:)), forControlEvents: .TouchUpInside)
        cell.cellContentView.playButton.indexPath = indexPath
        
        cell.cellContentView.linkButton.addTarget(self, action: #selector(DetailViewController.openLink(_:)), forControlEvents: .TouchUpInside)
        cell.cellContentView.linkButton.indexPath = indexPath
        
        cell.cellContentView.favoriteButton.addTarget(self, action: #selector(DetailViewController.favoriteAction(_:)), forControlEvents: .TouchUpInside)
        cell.cellContentView.favoriteButton.indexPath = indexPath
        
        cell.cellContentView.downloadButton.addTarget(self, action: #selector(DetailViewController.downloadAction(_:)), forControlEvents: .TouchUpInside)
        cell.cellContentView.downloadButton.indexPath = indexPath
        
        let track = items[indexPath.row]
        cell.setValues(track)
        
        let storedFavoriteTrackers = Array(dbHelper.getFavoriteTracks())
        let tr = storedFavoriteTrackers.filter() { $0.id == track.id }.first
        let state = tr == nil ? false : true
        cell.cellContentView.favoriteButton.selected = state
        
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
        sender.selected = !sender.selected

        let track = items[sender.indexPath.row]
        output.downloadTrack(sender.selected, track: track)
    }
    
    // MARK: - Priavte Method -
}

//MARK: - extension for UIScrollView -
extension DetailViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        if scrollView == detailView.tableView {
            let parallaxHeaderView = detailView.tableView.tableHeaderView as! ParallaxHeaderView
            parallaxHeaderView.headerViewForScrollViewOffset(scrollView.contentOffset)
        }
    }
}