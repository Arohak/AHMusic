//
//  AlbumView.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 06/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

//MARK: - AlbumView -
class AlbumView: BaseView {
    
    lazy var tableView: BaseTableView = {
        let view = BaseTableView.newAutoLayoutView()
        
        return view
    }()
    
    lazy var refresh: CarbonSwipeRefresh = {
        let view = CarbonSwipeRefresh(scrollView: self.tableView)
        view.colors = RCOLORS
        
        return view
    }()
    
    //MARK: - Initialize
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

//MARK: - AlbumCell
class AlbumCell: BaseTableViewCell {
    
    //MARK: - Create UIElements
    var cellContentView = AlbumCellContentView()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(cellContentView)
        cellContentView.autoPinEdgesToSuperviewEdges()
    }
    
    func setValues(item: Album) {
        cellContentView.imageView.kf_setImageWithURL(NSURL(string: item.cover)!, placeholderImage: Image(named: "img_placeholder"))
        cellContentView.titleLabel.text = item.title
        cellContentView.linkButton.setTitle(item.link, forState: .Normal)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - AlbumCellContentView
class AlbumCellContentView: UIView {
    
    //MARK: - Create UIElements
    lazy var imageView: UIImageView = {
        let view = UIImageView.newAutoLayoutView()
        view.layer.cornerRadius = AL_CELL_HEIGHT*0.8/2
        view.clipsToBounds = true
        
        return view
    }()
    
    lazy var titleLabel: AHLabel = {
        let view = AHLabel.newAutoLayoutView()
        view.font = AL_TITLE_FONT
        view.numberOfLines = 0
        
        return view
    }()
    
    lazy var linkButton: LinkButton = {
        let view = LinkButton.newAutoLayoutView()

        
        return view
    }()
    
    //MARK: - Initialize
    init() {
        super.init(frame: CGRectZero)
        
        addAllUIElements()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Privat Methods
    func addAllUIElements() {
        addSubview(imageView)
        addSubview(titleLabel)
        addSubview(linkButton)

        setConstraints()
    }
    
    //MARK: - Constraints
    func setConstraints() {
        imageView.autoPinEdgeToSuperviewEdge(.Top, withInset: 2)
        imageView.autoPinEdgeToSuperviewEdge(.Left, withInset: AL_OFFSET)
        imageView.autoSetDimensionsToSize(CGSize(width: AL_CELL_HEIGHT*0.8, height: AL_CELL_HEIGHT*0.8))
        
        titleLabel.autoAlignAxis(.Horizontal, toSameAxisOfView: imageView)
        titleLabel.autoPinEdge(.Left, toEdge: .Right, ofView: imageView, withOffset: AL_OFFSET)
        titleLabel.autoPinEdgeToSuperviewEdge(.Right, withInset: AL_OFFSET)
        
        linkButton.autoPinEdgeToSuperviewEdge(.Bottom, withInset: 0)
        linkButton.autoPinEdgeToSuperviewEdge(.Left, withInset: AL_OFFSET)
        linkButton.autoPinEdgeToSuperviewEdge(.Right, withInset: AL_OFFSET)
    }
}

