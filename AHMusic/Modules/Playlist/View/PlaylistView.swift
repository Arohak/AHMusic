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
        let view = BaseTableView.newAutoLayoutView()
        
        return view
    }()
    
    lazy var refresh: CarbonSwipeRefresh = {
        let view = CarbonSwipeRefresh(scrollView: self.tableView)
        view.colors = RCOLORS
        
        return view
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
    private func addAllUIElements() {
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
    
    func setValues(item: Playlist) {
        cellContentView.imageView.kf_setImageWithURL(NSURL(string: item.picture)!, placeholderImage: Image(named: "img_placeholder"))
        cellContentView.titleLabel.text = item.title
        cellContentView.creationDateLabel.text = Utils.stringFromDateString(item.creationDate)
        cellContentView.linkButton.setTitle(item.link, forState: .Normal)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - PlaylistCellContentView -
class PlaylistCellContentView: UIView {
    
    //MARK: - Create UIElements -
    lazy var imageView: UIImageView = {
        let view = UIImageView.newAutoLayoutView()
        view.layer.cornerRadius = PL_CELL_HEIGHT*0.95/2
        view.clipsToBounds = true
        
        return view
    }()
    
    lazy var titleLabel: AHLabel = {
        let view = AHLabel.newAutoLayoutView()
        view.font = PL_TITLE_FONT
        view.numberOfLines = 2

        return view
    }()
    
    lazy var creationDateLabel: AHLabel = {
        let view = AHLabel.newAutoLayoutView()
        view.font = LINK_FONT
        
        return view
    }()
    
    lazy var linkButton: LinkButton = {
        let view = LinkButton.newAutoLayoutView()
        
        return view
    }()
    
    //MARK: - Initialize -
    init() {
        super.init(frame: CGRectZero)
        
        addAllUIElements()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private Methods -
    private func addAllUIElements() {
        addSubview(imageView)
        addSubview(titleLabel)
        addSubview(creationDateLabel)
        addSubview(linkButton)
        
        setConstraints()
    }
    
    //MARK: - Constraints -
    func setConstraints() {
        imageView.autoPinEdgeToSuperviewEdge(.Right, withInset: PL_OFFSET)
        imageView.autoPinEdgeToSuperviewEdge(.Top, withInset: 2)
        imageView.autoSetDimensionsToSize(CGSize(width: PL_CELL_HEIGHT*0.95, height: PL_CELL_HEIGHT*0.95))
        
        titleLabel.autoPinEdgeToSuperviewEdge(.Top, withInset: PL_OFFSET)
        titleLabel.autoPinEdgeToSuperviewEdge(.Left, withInset: PL_OFFSET)
        titleLabel.autoPinEdge(.Right, toEdge: .Left, ofView: imageView, withOffset: -PL_OFFSET)
        
        creationDateLabel.autoPinEdge(.Top, toEdge: .Bottom, ofView: titleLabel, withOffset: 0)
        creationDateLabel.autoPinEdgeToSuperviewEdge(.Left, withInset: PL_OFFSET)
        creationDateLabel.autoPinEdge(.Right, toEdge: .Left, ofView: imageView, withOffset: -PL_OFFSET)
        
        linkButton.autoPinEdgeToSuperviewEdge(.Bottom, withInset: 0)
        linkButton.autoPinEdgeToSuperviewEdge(.Left, withInset: PL_OFFSET)
        linkButton.autoPinEdge(.Right, toEdge: .Left, ofView: imageView, withOffset: -TR_OFFSET)
    }
}

