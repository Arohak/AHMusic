//
//  ParallaxViewController.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 06/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class ParallaxViewController: UIViewController {
    
    let parallaxView = ParallaxView()
    let cellIdentifire = "parallaxCell"
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        baseConfig()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

        let headerView = parallaxView.tableView.tableHeaderView as! ParallaxHeaderView
        headerView.refreshBlurViewForNewImage()
    }
    
    // MARK: - Private Method
    private func baseConfig() {
        self.view = parallaxView
        
        parallaxView.tableView.dataSource = self
        parallaxView.tableView.delegate = self
        parallaxView.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: cellIdentifire)
    }
}

//MARK: - extension for UITableView
extension ParallaxViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 15
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifire)
        
        return cell!
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        return 50
    }
}

//MARK: - extension for UIScrollView
extension ParallaxViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        if scrollView == parallaxView.tableView {
            let parallaxHeaderView = parallaxView.tableView.tableHeaderView as! ParallaxHeaderView
            parallaxHeaderView.headerViewForScrollViewOffset(scrollView.contentOffset)
        }
    }
}