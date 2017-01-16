//
//  AlbumViewController.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 12/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

//MARK: - class AlbumViewController -
class AlbumViewController: BaseViewController {

    var output: AlbumViewOutput!

    let albumView = AlbumView()
    var items = Array<Album>()
    let cellIdentifire = "albumCell"
    
    // MARK: - Life cycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        baseConfig()
        output.viewIsReady(keyword)
    }
    
    // MARK: - Private Method -
    fileprivate func baseConfig() {
        self.view = albumView
        
        albumView.tableView.dataSource = self
        albumView.tableView.delegate = self
        albumView.tableView.register(AlbumCell.self, forCellReuseIdentifier: cellIdentifire)
        albumView.refresh.addTarget(self, action: #selector(AlbumViewController.refresh), for: .valueChanged)
    }
    
    // MARK: - Actions -
    override func refresh() {
        super.refresh()
        
        output.viewIsReady(keyword)
    }
}

//MARK: - extension for AlbumViewInput -
extension AlbumViewController: AlbumViewInput {
    
    func setupInitialState(_ items: Array<Album>) {
        self.items = items
        
        albumView.refresh.endRefreshing()
        albumView.tableView.reloadData()
    }
}

//MARK: - extension for UITableView -
extension AlbumViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifire) as! AlbumCell
        
        cell.cellContentView.linkButton.addTarget(self, action: #selector(AlbumViewController.openLink(_:)), for: .touchUpInside)
        cell.cellContentView.linkButton.indexPath = indexPath
        
        let album = items[indexPath.row]
        cell.setValues(album)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return AL_CELL_HEIGHT
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let album = items[indexPath.row]
        output.openDetail(album)
    }
    
    // MARK: - Actions -
    func openLink(_ sender: AHButton) {
        let album = items[sender.indexPath.row]
        output.openLink(album)
    }
}
