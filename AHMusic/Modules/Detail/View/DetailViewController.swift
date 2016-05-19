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
    
    // MARK: - Private Method -
    private func changeButtonState(indexPathOne: NSIndexPath, indexPathTwo: NSIndexPath) {
        let cellOne = detailView.tableView.cellForRowAtIndexPath(indexPathOne) as? TrackShortCell
        let cellTwo = detailView.tableView.cellForRowAtIndexPath(indexPathTwo) as? TrackShortCell
        if let _ = cellTwo {
            cellOne!.cellContentView.playButton.selected = false
            cellTwo!.cellContentView.playButton.selected = true
        } else {
            detailView.tableView.scrollToRowAtIndexPath(indexPathTwo, atScrollPosition: .Middle, animated: false)
            let cOne = detailView.tableView.cellForRowAtIndexPath(indexPathOne) as! TrackShortCell
            let cTwo = detailView.tableView.cellForRowAtIndexPath(indexPathTwo) as! TrackShortCell
            cOne.cellContentView.playButton.selected = false
            cTwo.cellContentView.playButton.selected = true
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