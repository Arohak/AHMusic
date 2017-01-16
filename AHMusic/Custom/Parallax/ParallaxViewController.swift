//
//  ParallaxViewController.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 06/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class ParallaxViewController: UIViewController {

    var headerView: ParallaxHeaderView!

    lazy var tableView: UITableView = {
        let view = UITableView.newAutoLayout()
        view.backgroundColor = WHITE
        view.dataSource = self
        view.delegate = self
        view.register(UITableViewCell.self, forCellReuseIdentifier: self.cellIdentifire)
        view.tableHeaderView = self.headerView
        
        return view
    }()
    
    var items = Array<String>()
    let cellIdentifire = "parallaxCell"
    
    //MARK: - Initilize
    init() {
        super.init(nibName: nil, bundle:nil)
    }

    convenience init(items: Array<String>, title: String, imageStr: String, headerHeight: CGFloat = 400) {
        self.init()
        
        self.items = items
        self.title = title
        self.headerView = ParallaxHeaderView(imageStr: imageStr, frame: CGRect(x: 0, y: 0, width: ScreenSize.WIDTH, height: headerHeight))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        baseConfig()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        headerView.refreshBlurViewForNewImage()
    }
    
    // MARK: - Private Method
    fileprivate func baseConfig() {
        self.view.addSubview(tableView)
        tableView.autoPinEdgesToSuperviewEdges()
    }
}

//MARK: - extension for UITableView
extension ParallaxViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifire)
        let item = items[indexPath.row]
        cell!.textLabel?.text = item
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 50
    }
}

//MARK: - extension for UIScrollView
extension ParallaxViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == tableView {
            headerView.headerViewForScrollViewOffset(scrollView.contentOffset)
        }
    }
}
