//
//  PlaylistView.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 06/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

//MARK: - PlaylistView -
class PlaylistView: UIView {
    
    lazy var tableView: UITableView = {
        let view = UITableView.newAutoLayoutView()
        view.backgroundColor = WHITE
        
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
    
    //MARK: - Privat Methods -
    func addAllUIElements() {
        addSubview(tableView)

        setConstraints()
    }
    
    //MARK: - Constraints -
    func setConstraints() {
        tableView.autoPinEdgesToSuperviewEdges()
    }
}

//MARK: - PlaylistCell -
class PlaylistCell: UITableViewCell {
    
    //MARK: - Create UIElements -
    var cellContentView = PlaylistCellContentView()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .None
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
        view.textColor = BLUE
        view.numberOfLines = 0

        return view
    }()
    
    lazy var creationDateLabel: AHLabel = {
        let view = AHLabel.newAutoLayoutView()
        view.font = LINK_FONT
        view.textColor = BLUE
        
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
    
    //MARK: - Initialize -
    init() {
        super.init(frame: CGRectZero)
        
        addAllUIElements()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Privat Methods -
    func addAllUIElements() {
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

