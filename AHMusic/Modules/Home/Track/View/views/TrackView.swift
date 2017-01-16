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

//MARK: - TrackCell -
class TrackCell: BaseTableViewCell {
    
    //MARK: - Create UIElements -
    var cellContentView = TrackCellContentView()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(cellContentView)
        cellContentView.autoPinEdgesToSuperviewEdges()
    }
    
    func setValues(_ item: Track) {
        cellContentView.imageView.kf.setImage(with: URL(string: item.album.cover)!, placeholder: Image(named: "img_placeholder"))
        cellContentView.titleLabel.text = item.title
        cellContentView.playButton.isSelected = item.played
        cellContentView.albumButton.setTitle("Album:  " + item.album.title, for: .normal)
        cellContentView.artistButton.setTitle("Artist:  " + item.artist.name, for: .normal)
//        cellContentView.linkButton.setTitle(item.link, for: .normal)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - TrackCellContentView -
class TrackCellContentView: UIView {
    
    //MARK: - Create UIElements -
    lazy var imageView: UIImageView = {
        let view = UIImageView.newAutoLayout()
        view.isUserInteractionEnabled = true
        view.layer.cornerRadius = TR_INSET
        view.clipsToBounds = true

        return view
    }()
    
    lazy var playButton: AHButton = {
        let view = AHButton.newAutoLayout()
        view.setBackgroundImage(UIImage(named: "img_tr_play"), for: .normal)
        view.setBackgroundImage(UIImage(named: "img_tr_pause"), for: .selected)

        return view
    }()
    
    lazy var titleLabel: AHLabel = {
        let view = AHLabel.newAutoLayout()
        view.font = TR_TITLE_FONT
        view.numberOfLines = 2

        return view
    }()
    
    lazy var albumButton: LinkButton = {
        let view = LinkButton.newAutoLayout()
        view.titleLabel!.font = TR_DESC_FONT
        
        return view
    }()
    
    lazy var artistButton: LinkButton = {
        let view = LinkButton.newAutoLayout()
        view.titleLabel!.font = TR_DESC_FONT
        
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
        imageView.addSubview(playButton)
        addSubview(titleLabel)
        addSubview(albumButton)
        addSubview(artistButton)
//        addSubview(linkButton)

        setConstraints()
    }
    
    //MARK: - Constraints -
    func setConstraints() {
        imageView.autoPinEdge(toSuperviewEdge: .right, withInset: TR_OFFSET)
        imageView.autoPinEdge(toSuperviewEdge: .top, withInset: 2)
        imageView.autoPinEdge(toSuperviewEdge: .bottom, withInset: 2)
        imageView.autoSetDimension(.width, toSize: TR_IMG_WIDTH)
        
        playButton.autoPinEdge(toSuperviewEdge: .bottom)
        playButton.autoPinEdge(toSuperviewEdge: .left)
        playButton.autoSetDimensions(to: CGSize(width: TR_ICON_SIZE, height: TR_ICON_SIZE))
        
        titleLabel.autoPinEdge(toSuperviewEdge: .top, withInset: TR_OFFSET)
        titleLabel.autoPinEdge(toSuperviewEdge: .left, withInset: TR_OFFSET)
        titleLabel.autoPinEdge(.right, to: .left, of: imageView, withOffset: -TR_OFFSET)
        
        albumButton.autoPinEdge(.top, to: .bottom, of: titleLabel, withOffset: TR_INSET)
        albumButton.autoPinEdge(toSuperviewEdge: .left, withInset: TR_OFFSET)
        albumButton.autoPinEdge(.right, to: .left, of: imageView, withOffset: -TR_OFFSET)
        
        artistButton.autoPinEdge(.top, to: .bottom, of: albumButton, withOffset: -TR_INSET)
        artistButton.autoPinEdge(toSuperviewEdge: .left, withInset: TR_OFFSET)
        artistButton.autoPinEdge(.right, to: .left, of: imageView, withOffset: -TR_OFFSET)
        
//        linkButton.autoPinEdge(toSuperviewEdge: .bottom)
//        linkButton.autoPinEdge(toSuperviewEdge: .left, withInset: TR_OFFSET)
//        linkButton.autoPinEdge(.right, to: .left, of: imageView, withOffset: -TR_OFFSET)
    }
}

