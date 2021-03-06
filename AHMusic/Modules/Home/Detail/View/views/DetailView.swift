//
//  DetailView.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 06/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

//MARK: - DetailView -
class DetailView: BaseEventView {
    
    var headerView: ParallaxHeaderView!
    
    //MARK: - Initialize -
    override init() {
        super.init()
    }
    
    convenience init(detail: Detail, headerRect: CGRect) {
        self.init()
        
        headerView = ParallaxHeaderView(imageURL: detail.imageURL, frame: headerRect)
        tableView.tableHeaderView = headerView
        addHeaderUIElements(detail)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private Methods -
    private func addHeaderUIElements(detail: Detail) {
        var bgView: UIView!
        var infoLabel: UILabel!
        
        if let info = detail.info {
            infoLabel = AHLabel.newAutoLayoutView()
            infoLabel.text = info
            infoLabel.font = DE_INFO_FONT
            infoLabel.numberOfLines = 0
            bgView = UIView.newAutoLayoutView()
            bgView.backgroundColor = BLUE_LIGHT
            bgView.layer.cornerRadius = 5
            bgView.alpha = 0.5
            headerView.addSubview(bgView)
            headerView.addSubview(infoLabel)
            
            infoLabel.autoPinEdgeToSuperviewEdge(.Left, withInset: TR_OFFSET)
            infoLabel.autoPinEdgeToSuperviewEdge(.Right, withInset: TR_OFFSET)
            infoLabel.autoPinEdgeToSuperviewEdge(.Bottom, withInset: TR_OFFSET)
            bgView.autoPinEdge(.Top, toEdge: .Top, ofView: infoLabel, withOffset: -TR_OFFSET/2)
            bgView.autoPinEdge(.Bottom, toEdge: .Bottom, ofView: infoLabel, withOffset: TR_OFFSET/2)
            bgView.autoPinEdge(.Left, toEdge: .Left, ofView: infoLabel, withOffset: -TR_OFFSET/2)
            bgView.autoPinEdge(.Right, toEdge: .Right, ofView: infoLabel, withOffset: TR_OFFSET/2)
        }
    }
}

//MARK: - TrackShortCell -
class TrackShortCell: BaseTableViewCell {
    
    //MARK: - Create UIElements -
    var cellContentView = TrackShortCellContentView()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(cellContentView)
        cellContentView.autoPinEdgesToSuperviewEdges()
    }
    
    func setValues(item: Track, type: BaseVC) {
        cellContentView.titleLabel.text = item.title
        cellContentView.linkButton.setTitle(item.link, forState: .Normal)
        cellContentView.playButton.selected = item.played
        let fState = Utils.favoriteState(item)
        let dState = Utils.downloadState(item)
        cellContentView.favoriteButton.selected = fState
        cellContentView.downloadButton.selected = dState
        
        switch type {
        case .Favorite, .Detail:
            if dState {
                cellContentView.downloadButton.setBackgroundImage(UIImage(named: "img_tr_download_select"), forState: .Normal)
            } else{
                cellContentView.downloadButton.setBackgroundImage(UIImage(named: "img_tr_download"), forState: .Normal)
            }
            cellContentView.downloadButton.enabled = !dState

        case .Download:
            cellContentView.downloadButton.setBackgroundImage(UIImage(named: "img_tr_download_delete"), forState: .Selected)

        }
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - TrackShortCellContentView -
class TrackShortCellContentView: UIView {
    
    let shapeLayer = ShapeLayer(center: TR_ICON_SIZE)
    
    //MARK: - Create UIElements
    lazy var playButton: AHButton = {
        let view = AHButton.newAutoLayoutView()
        view.setBackgroundImage(UIImage(named: "img_tr_play"), forState: .Normal)
        view.setBackgroundImage(UIImage(named: "img_tr_pause"), forState: .Selected)
        
        return view
    }()
    
    lazy var favoriteButton: AHButton = {
        let view = AHButton.newAutoLayoutView()
        view.setBackgroundImage(UIImage(named: "img_tr_favorite"), forState: .Normal)
        view.setBackgroundImage(UIImage(named: "img_tr_favorite_select"), forState: .Selected)
        
        return view
    }()
    
    lazy var downloadButton: AHButton = {
        let view = AHButton.newAutoLayoutView()
        view.setBackgroundImage(UIImage(named: "img_tr_download"), forState: .Normal)
        view.setBackgroundImage(UIImage(named: "img_tr_download_select"), forState: .Selected)
        
        return view
    }()
    
    lazy var titleLabel: AHLabel = {
        let view = AHLabel.newAutoLayoutView()
        view.font = TR_TITLE_FONT
        view.numberOfLines = 2
        
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
        addSubview(titleLabel)
        addSubview(linkButton)
        addSubview(playButton)
        addSubview(favoriteButton)
        addSubview(downloadButton)
        
        downloadButton.layer.addSublayer(shapeLayer.gradientMaskLayer)

        setConstraints()
    }
    
    //MARK: - Constraints -
    func setConstraints() {
        downloadButton.autoPinEdgeToSuperviewEdge(.Top)
        downloadButton.autoPinEdgeToSuperviewEdge(.Right, withInset: TR_INSET)
        downloadButton.autoSetDimensionsToSize(CGSize(width: TR_ICON_SIZE, height: TR_ICON_SIZE))
        
        favoriteButton.autoAlignAxis(.Horizontal, toSameAxisOfView: downloadButton)
        favoriteButton.autoPinEdge(.Right, toEdge: .Left, ofView: downloadButton, withOffset: 0)
        favoriteButton.autoSetDimensionsToSize(CGSize(width: TR_ICON_SIZE, height: TR_ICON_SIZE))
        
        playButton.autoAlignAxis(.Horizontal, toSameAxisOfView: downloadButton)
        playButton.autoPinEdgeToSuperviewEdge(.Left, withInset: TR_INSET)
        playButton.autoSetDimensionsToSize(CGSize(width: TR_ICON_SIZE, height: TR_ICON_SIZE))
        
        titleLabel.autoAlignAxis(.Horizontal, toSameAxisOfView: downloadButton)
        titleLabel.autoPinEdge(.Left, toEdge: .Right, ofView: playButton, withOffset: TR_INSET)
        titleLabel.autoPinEdge(.Right, toEdge: .Left, ofView: favoriteButton, withOffset: -TR_OFFSET)
        
        linkButton.autoPinEdgeToSuperviewEdge(.Bottom)
        linkButton.autoPinEdgeToSuperviewEdge(.Left, withInset: TR_OFFSET)
    }
}
