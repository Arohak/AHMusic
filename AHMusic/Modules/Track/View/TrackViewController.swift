//
//  TrackViewController.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 12/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

//MARK: - class TrackViewController
class TrackViewController: UIViewController {

    var output: TrackViewOutput!
    
    let trackView = TrackView()
    var items = Array<Track>()
    let collectionCellIdentifire = "trackCell"

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        baseConfig()
        output.viewIsReady()
    }
    
    // MARK: - Private Method
    private func baseConfig() {
        self.view = trackView
        
        trackView.tableView.dataSource = self
        trackView.tableView.delegate = self
        trackView.tableView.registerClass(TrackCell.self, forCellReuseIdentifier: collectionCellIdentifire)
    }
}

//MARK: - extension for TrackViewInput
extension TrackViewController: TrackViewInput {
    
    func setupInitialState(items: Array<Track>) {
        self.items = items
    }
}

//MARK: - extension for UITableView
extension TrackViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return items.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(collectionCellIdentifire) as! TrackCell
        let track = items[indexPath.row]
        cell.setValues(track)
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        return TR_CELL_HEIGHT
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let track = items[indexPath.row]

    }
}