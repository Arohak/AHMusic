//
//  DetailViewController.swift
//  AHMusic
//
//  Created by AroHak on 15/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

//MARK: - class DetailViewController -
class DetailViewController: BaseEventViewController {
    
    //MARK: - Initilize -
    init(title: String, detail: Detail, headerHeight: CGFloat = DE_HEADER_HEIGHT) {
        super.init(title: title)
        
        baseEventView = DetailView(detail: detail, headerRect: CGRect(x: 0, y: 0, width: ScreenSize.WIDTH, height: headerHeight))
        if let tracks = detail.tracks {
            self.items = tracks
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life cycle -
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        let headerView = baseEventView.tableView.tableHeaderView as! ParallaxHeaderView
        headerView.refreshBlurViewForNewImage()
    }
    
    //MARK: - Actions -
    override func favoriteAction(sender: AHButton) {
        super.favoriteAction(sender)
        
        let track = items[sender.indexPath.row]
        output.favoriteTrack(sender.selected, track: track)
        
    }
    
    override func downloadAction(sender: AHButton) {
        super.downloadAction(sender)
        sender.enabled = !sender.selected

        let track = items[sender.indexPath.row]
        output.downloadTrack(sender.selected, track: track)
    }
}

//MARK: - extension for UIScrollView -
extension BaseEventViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        if scrollView == baseEventView.tableView {
            if let parallaxHeaderView = baseEventView.tableView.tableHeaderView as? ParallaxHeaderView {
                parallaxHeaderView.headerViewForScrollViewOffset(scrollView.contentOffset)
            }
        }
    }
}