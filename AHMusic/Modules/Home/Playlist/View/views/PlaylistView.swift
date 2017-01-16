//
//  PlaylistView.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 06/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

//MARK: - PlaylistView -
class PlaylistView: BaseView {
    
    lazy var tableView: BaseTableView = {
        let view = BaseTableView.newAutoLayout()
        
        return view
    }()
    
    lazy var refresh: CarbonSwipeRefresh = {
        let view = CarbonSwipeRefresh(scrollView: self.tableView)
        view?.colors = RCOLORS
        
        return view!
    }()
    
    //MARK: - Initialize -
    override init() {
        super.init()
        
        addAllUIElements()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private Methods -
    fileprivate func addAllUIElements() {
        addSubview(tableView)
        addSubview(refresh)

        setConstraints()
    }
    
    //MARK: - Constraints -
    func setConstraints() {
        tableView.autoPinEdgesToSuperviewEdges()
        refresh.setMarginTop(0)
    }
}

//MARK: - PlaylistCell -
class PlaylistCell: BaseTableViewCell {
    
    //MARK: - Create UIElements -
    var cellContentView = PlaylistCellContentView()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(cellContentView)
        cellContentView.autoPinEdgesToSuperviewEdges()
    }
    
    func setValues(_ item: Playlist) {
        cellContentView.imageView.kf.setImage(with: URL(string: item.picture), placeholder: Image(named: "img_placeholder"))
        cellContentView.titleLabel.text = item.title
        cellContentView.creationDateLabel.text = Utils.stringFromDateString(item.creationDate)
//        cellContentView.linkButton.setTitle(item.link, for: .normal)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - PlaylistCellContentView -
class PlaylistCellContentView: UIView {
    
    //MARK: - Create UIElements -
    lazy var imageView: UIImageView = {
        let view = UIImageView.newAutoLayout()
        view.layer.cornerRadius = PL_CELL_HEIGHT*0.95/2
        view.clipsToBounds = true
        
        return view
    }()
    
    lazy var titleLabel: AHLabel = {
        let view = AHLabel.newAutoLayout()
        view.font = PL_TITLE_FONT
        view.numberOfLines = 2

        return view
    }()
    
    lazy var creationDateLabel: AHLabel = {
        let view = AHLabel.newAutoLayout()
        view.font = LINK_FONT
        
        return view
    }()
    
    lazy var linkButton: LinkButton = {
        let view = LinkButton.newAutoLayout()
        
        return view
    }()
    
    //MARK: - Initialize -
    init() {
        super.init(frame: CGRect.zero)
        
        addAllUIElements()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private Methods -
    fileprivate func addAllUIElements() {
        addSubview(imageView)
        addSubview(titleLabel)
        addSubview(creationDateLabel)
//        addSubview(linkButton)
        
        setConstraints()
    }
    
    //MARK: - Constraints -
    func setConstraints() {
        imageView.autoPinEdge(toSuperviewEdge: .right, withInset: PL_OFFSET)
        imageView.autoPinEdge(toSuperviewEdge: .top, withInset: 2)
        imageView.autoSetDimensions(to: CGSize(width: PL_CELL_HEIGHT*0.95, height: PL_CELL_HEIGHT*0.95))
        
//        titleLabel.autoPinEdge(toSuperviewEdge: .top, withInset: PL_OFFSET)
        titleLabel.autoAlignAxis(toSuperviewAxis: .horizontal)
        titleLabel.autoPinEdge(toSuperviewEdge: .left, withInset: PL_OFFSET)
        titleLabel.autoPinEdge(.right, to: .left, of: imageView, withOffset: -PL_OFFSET)
        
        creationDateLabel.autoPinEdge(.top, to: .bottom, of: titleLabel, withOffset: 0)
        creationDateLabel.autoPinEdge(toSuperviewEdge: .left, withInset: PL_OFFSET)
        creationDateLabel.autoPinEdge(.right, to: .left, of: imageView, withOffset: -PL_OFFSET)
        
//        linkButton.autoPinEdge(toSuperviewEdge: .bottom, withInset: 0)
//        linkButton.autoPinEdge(toSuperviewEdge: .left, withInset: PL_OFFSET)
//        linkButton.autoPinEdge(.right, to: .left, of: imageView, withOffset: -TR_OFFSET)
    }
}

