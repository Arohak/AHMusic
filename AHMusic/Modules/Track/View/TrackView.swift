//
//  TrackView.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 06/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

//MARK: - TrackView
class TrackView: UIView {
    
    lazy var tableView: UITableView = {
        let view = UITableView.newAutoLayoutView()
        view.backgroundColor = WHITE
        
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
        addSubview(tableView)

        setConstraints()
    }
    
    //MARK: - Constraints
    func setConstraints() {
        tableView.autoPinEdgesToSuperviewEdges()
    }
}

//MARK: - TrackCell
class TrackCell: UITableViewCell {
    
    //MARK: - Create UIElements
    var cellContentView = TrackCellContentView()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .None
        contentView.addSubview(cellContentView)
        cellContentView.autoPinEdgesToSuperviewEdges()
    }
    
    func setValues(item: Track) {
        cellContentView.imageView.kf_setImageWithURL(NSURL(string: item.album.cover)!)
        cellContentView.titleLabel.text = item.title
        cellContentView.albumButton.setTitle("Album:  " + item.album.title, forState: .Normal)
        cellContentView.artistButton.setTitle("Artist:  " + item.artist.name, forState: .Normal)
        cellContentView.linkButton.setTitle(item.link, forState: .Normal)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - TrackCellContentView
class TrackCellContentView: UIView {
    
    //MARK: - Create UIElements
    lazy var imageView: UIImageView = {
        let view = UIImageView.newAutoLayoutView()
        view.userInteractionEnabled = true

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
        view.textColor = BLUE
        
        return view
    }()
    
    lazy var albumButton: AHButton = {
        let view = AHButton.newAutoLayoutView()
        view.setTitleColor(GRAY, forState: .Normal)
        view.setTitleColor(BLUE, forState: .Highlighted)
        view.titleLabel!.font = TR_DESC_FONT
        view.contentHorizontalAlignment = .Left
        view.titleLabel!.lineBreakMode = .ByTruncatingTail
        
        return view
    }()
    
    lazy var artistButton: AHButton = {
        let view = AHButton.newAutoLayoutView()
        view.setTitleColor(GRAY, forState: .Normal)
        view.setTitleColor(BLUE, forState: .Highlighted)
        view.titleLabel!.font = TR_DESC_FONT
        view.contentHorizontalAlignment = .Left
        view.titleLabel!.lineBreakMode = .ByTruncatingTail
        
        return view
    }()
    
    lazy var linkButton: AHButton = {
        let view = AHButton.newAutoLayoutView()
        view.setTitleColor(GRAY, forState: .Normal)
        view.setTitleColor(BLUE, forState: .Highlighted)
        view.titleLabel!.font = LINK_FONT
        view.contentHorizontalAlignment = .Left
        view.titleLabel!.lineBreakMode = .ByTruncatingTail
        
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
        imageView.addSubview(playButton)
        addSubview(titleLabel)
        addSubview(albumButton)
        addSubview(artistButton)
        addSubview(linkButton)

        setConstraints()
    }
    
    //MARK: - Constraints
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

