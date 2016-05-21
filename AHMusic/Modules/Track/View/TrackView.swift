//
//  TrackView.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 06/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

//MARK: - TrackView -
class TrackView: BaseView {
    
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

//MARK: - TrackCell -
class TrackCell: BaseTableViewCell {
    
    //MARK: - Create UIElements -
    var cellContentView = TrackCellContentView()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(cellContentView)
        cellContentView.autoPinEdgesToSuperviewEdges()
    }
    
    func setValues(item: Track) {
        cellContentView.imageView.kf_setImageWithURL(NSURL(string: item.album.cover)!, placeholderImage: Image(named: "img_placeholder"))
        cellContentView.titleLabel.text = item.title
        cellContentView.albumButton.setTitle("Album:  " + item.album.title, forState: .Normal)
        cellContentView.artistButton.setTitle("Artist:  " + item.artist.name, forState: .Normal)
        cellContentView.linkButton.setTitle(item.link, forState: .Normal)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - TrackCellContentView -
class TrackCellContentView: UIView {
    
    //MARK: - Create UIElements -
    lazy var imageView: UIImageView = {
        let view = UIImageView.newAutoLayoutView()
        view.userInteractionEnabled = true
        view.layer.cornerRadius = TR_INSET
        view.clipsToBounds = true

        return view
    }()
    
    lazy var playButton: AHButton = {
        let view = AHButton.newAutoLayoutView()
        view.setBackgroundImage(UIImage(named: "img_tr_play"), forState: .Normal)
        view.setBackgroundImage(UIImage(named: "img_tr_pause"), forState: .Selected)

        return view
    }()
    
    lazy var titleLabel: AHLabel = {
        let view = AHLabel.newAutoLayoutView()
        view.font = TR_TITLE_FONT
        
        return view
    }()
    
    lazy var albumButton: LinkButton = {
        let view = LinkButton.newAutoLayoutView()
        view.titleLabel!.font = TR_DESC_FONT
        
        return view
    }()
    
    lazy var artistButton: LinkButton = {
        let view = LinkButton.newAutoLayoutView()
        view.titleLabel!.font = TR_DESC_FONT
        
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
        imageView.addSubview(playButton)
        addSubview(titleLabel)
        addSubview(albumButton)
        addSubview(artistButton)
        addSubview(linkButton)

        setConstraints()
    }
    
    //MARK: - Constraints -
    func setConstraints() {
        imageView.autoPinEdgeToSuperviewEdge(.Right, withInset: TR_OFFSET)
        imageView.autoPinEdgeToSuperviewEdge(.Top, withInset: 2)
        imageView.autoPinEdgeToSuperviewEdge(.Bottom, withInset: 2)
        imageView.autoSetDimension(.Width, toSize: TR_IMG_WIDTH)
        
        playButton.autoPinEdgeToSuperviewEdge(.Bottom)
        playButton.autoPinEdgeToSuperviewEdge(.Left)
        playButton.autoSetDimensionsToSize(CGSize(width: TR_ICON_SIZE, height: TR_ICON_SIZE))
        
        titleLabel.autoPinEdgeToSuperviewEdge(.Top, withInset: TR_OFFSET)
        titleLabel.autoPinEdgeToSuperviewEdge(.Left, withInset: TR_OFFSET)
        titleLabel.autoPinEdge(.Right, toEdge: .Left, ofView: imageView, withOffset: -TR_OFFSET)
        
        albumButton.autoPinEdge(.Top, toEdge: .Bottom, ofView: titleLabel, withOffset: TR_INSET)
        albumButton.autoPinEdgeToSuperviewEdge(.Left, withInset: TR_OFFSET)
        albumButton.autoPinEdge(.Right, toEdge: .Left, ofView: imageView, withOffset: -TR_OFFSET)
        
        artistButton.autoPinEdge(.Top, toEdge: .Bottom, ofView: albumButton, withOffset: -TR_INSET)
        artistButton.autoPinEdgeToSuperviewEdge(.Left, withInset: TR_OFFSET)
        artistButton.autoPinEdge(.Right, toEdge: .Left, ofView: imageView, withOffset: -TR_OFFSET)
        
        linkButton.autoPinEdgeToSuperviewEdge(.Bottom)
        linkButton.autoPinEdgeToSuperviewEdge(.Left, withInset: TR_OFFSET)
        linkButton.autoPinEdge(.Right, toEdge: .Left, ofView: imageView, withOffset: -TR_OFFSET)
    }
}

