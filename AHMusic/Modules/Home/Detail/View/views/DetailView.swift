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
    fileprivate func addHeaderUIElements(_ detail: Detail) {
        var bgView: UIView!
        var infoLabel: UILabel!
        
        if let info = detail.info {
            infoLabel = AHLabel.newAutoLayout()
            infoLabel.text = info
            infoLabel.font = DE_INFO_FONT
            infoLabel.numberOfLines = 0
            bgView = UIView.newAutoLayout()
            bgView.backgroundColor = BLUE_LIGHT
            bgView.layer.cornerRadius = 5
            bgView.alpha = 0.5
            headerView.addSubview(bgView)
            headerView.addSubview(infoLabel)
            
            infoLabel.autoPinEdge(toSuperviewEdge: .left, withInset: TR_OFFSET)
            infoLabel.autoPinEdge(toSuperviewEdge: .right, withInset: TR_OFFSET)
            infoLabel.autoPinEdge(toSuperviewEdge: .bottom, withInset: TR_OFFSET)
            bgView.autoPinEdge(.top, to: .top, of: infoLabel, withOffset: -TR_OFFSET/2)
            bgView.autoPinEdge(.bottom, to: .bottom, of: infoLabel, withOffset: TR_OFFSET/2)
            bgView.autoPinEdge(.left, to: .left, of: infoLabel, withOffset: -TR_OFFSET/2)
            bgView.autoPinEdge(.right, to: .right, of: infoLabel, withOffset: TR_OFFSET/2)
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
    
    func setValues(_ item: Track, type: BaseVC) {
        cellContentView.titleLabel.text = item.title
        cellContentView.linkButton.setTitle(item.link, for: .normal)
        cellContentView.playButton.isSelected = item.played
        let fState = Utils.favoriteState(item)
        let dState = Utils.downloadState(item)
        cellContentView.favoriteButton.isSelected = fState
        cellContentView.downloadButton.isSelected = dState
        
        switch type {
        case .favorite, .detail:
            if dState {
                cellContentView.downloadButton.setBackgroundImage(UIImage(named: "img_tr_download_select"), for: .normal)
            } else{
                cellContentView.downloadButton.setBackgroundImage(UIImage(named: "img_tr_download"), for: .normal)
            }
            cellContentView.downloadButton.isEnabled = !dState

        case .download:
            cellContentView.downloadButton.setBackgroundImage(UIImage(named: "img_tr_download_delete"), for: .selected)
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
        let view = AHButton.newAutoLayout()
        view.setBackgroundImage(UIImage(named: "img_tr_play"), for: .normal)
        view.setBackgroundImage(UIImage(named: "img_tr_pause"), for: .selected)
        
        return view
    }()
    
    lazy var favoriteButton: AHButton = {
        let view = AHButton.newAutoLayout()
        view.setBackgroundImage(UIImage(named: "img_tr_favorite"), for: .normal)
        view.setBackgroundImage(UIImage(named: "img_tr_favorite_select"), for: .selected)
        
        return view
    }()
    
    lazy var downloadButton: AHButton = {
        let view = AHButton.newAutoLayout()
        view.setBackgroundImage(UIImage(named: "img_tr_download"), for: .normal)
        view.setBackgroundImage(UIImage(named: "img_tr_download_select"), for: .selected)
        
        return view
    }()
    
    lazy var titleLabel: AHLabel = {
        let view = AHLabel.newAutoLayout()
        view.font = TR_TITLE_FONT
        view.numberOfLines = 2
        
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
        addSubview(titleLabel)
        addSubview(playButton)
        addSubview(favoriteButton)
//        addSubview(linkButton)
//        addSubview(downloadButton)
        
        downloadButton.layer.addSublayer(shapeLayer.gradientMaskLayer)

        setConstraints()
    }
    
    //MARK: - Constraints -
    func setConstraints() {
//        favoriteButton.autoAlignAxis(.horizontal, toSameAxisOf: downloadButton)
//        favoriteButton.autoPinEdge(.right, to: .left, of: downloadButton, withOffset: 0)
        favoriteButton.autoAlignAxis(toSuperviewAxis: .horizontal)
        favoriteButton.autoPinEdge(toSuperviewEdge: .right, withInset: TR_INSET)
        favoriteButton.autoSetDimensions(to: CGSize(width: TR_ICON_SIZE, height: TR_ICON_SIZE))
        
        playButton.autoAlignAxis(.horizontal, toSameAxisOf: favoriteButton)
        playButton.autoPinEdge(toSuperviewEdge: .left, withInset: TR_INSET)
        playButton.autoSetDimensions(to: CGSize(width: TR_ICON_SIZE, height: TR_ICON_SIZE))
        
        titleLabel.autoAlignAxis(.horizontal, toSameAxisOf: favoriteButton)
        titleLabel.autoPinEdge(.left, to: .right, of: playButton, withOffset: TR_INSET)
        titleLabel.autoPinEdge(.right, to: .left, of: favoriteButton, withOffset: -TR_OFFSET)
        
//        linkButton.autoPinEdge(toSuperviewEdge: .bottom)
//        linkButton.autoPinEdge(toSuperviewEdge: .left, withInset: TR_OFFSET)
        
//        downloadButton.autoPinEdge(toSuperviewEdge: .top)
//        downloadButton.autoPinEdge(toSuperviewEdge: .right, withInset: TR_INSET)
//        downloadButton.autoSetDimensions(to: CGSize(width: TR_ICON_SIZE, height: TR_ICON_SIZE))
    }
}
