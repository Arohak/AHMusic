//
//  AlbumView.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 06/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

//MARK: - AlbumView
class AlbumView: UIView {
    
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

//MARK: - AlbumCell
class AlbumCell: UITableViewCell {
    
    //MARK: - Create UIElements
    var cellContentView = AlbumCellContentView()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .None
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
        view.textColor = BLUE
        view.numberOfLines = 0
        
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
        addSubview(titleLabel)
        addSubview(linkButton)

        setConstraints()
    }
    
    //MARK: - Constraints
    func setConstraints() {
        imageView.autoPinEdgeToSuperviewEdge(.Top, withInset: 2)
        imageView.autoPinEdgeToSuperviewEdge(.Left, withInset: AL_OFFSET)
        imageView.autoSetDimensionsToSize(CGSize(width: AL_CELL_HEIGHT*0.8, height: AL_CELL_HEIGHT*0.8))
        
        titleLabel.autoPinEdgeToSuperviewEdge(.Top, withInset: AL_OFFSET)
        titleLabel.autoPinEdge(.Left, toEdge: .Right, ofView: imageView, withOffset: AL_OFFSET)
        titleLabel.autoPinEdgeToSuperviewEdge(.Right, withInset: AL_OFFSET)
        
        linkButton.autoPinEdgeToSuperviewEdge(.Bottom, withInset: 0)
        linkButton.autoPinEdgeToSuperviewEdge(.Left, withInset: AL_OFFSET)
        linkButton.autoPinEdgeToSuperviewEdge(.Right, withInset: AL_OFFSET)
    }
}

