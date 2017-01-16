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
        let view = BaseTableView.newAutoLayout()
        
        return view
    }()
    
    lazy var refresh: CarbonSwipeRefresh = {
        let view = CarbonSwipeRefresh(scrollView: self.tableView)
        view?.colors = RCOLORS
        
        return view!
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

//MARK: - AlbumCell
class AlbumCell: BaseTableViewCell {
    
    //MARK: - Create UIElements
    var cellContentView = AlbumCellContentView()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(cellContentView)
        cellContentView.autoPinEdgesToSuperviewEdges()
    }
    
    func setValues(_ item: Album) {
        cellContentView.imageView.kf.setImage(with: URL(string: item.cover), placeholder: Image(named: "img_placeholder"))
        cellContentView.titleLabel.text = item.title
//        cellContentView.linkButton.setTitle(item.link, for: .normal)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - AlbumCellContentView
class AlbumCellContentView: UIView {
    
    //MARK: - Create UIElements
    lazy var imageView: UIImageView = {
        let view = UIImageView.newAutoLayout()
        view.layer.cornerRadius = AL_CELL_HEIGHT*0.8/2
        view.clipsToBounds = true
        
        return view
    }()
    
    lazy var titleLabel: AHLabel = {
        let view = AHLabel.newAutoLayout()
        view.font = AL_TITLE_FONT
        view.numberOfLines = 4
        
        return view
    }()
    
    lazy var linkButton: LinkButton = {
        let view = LinkButton.newAutoLayout()

        
        return view
    }()
    
    //MARK: - Initialize
    init() {
        super.init(frame: CGRect.zero)
        
        addAllUIElements()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Privat Methods
    func addAllUIElements() {
        addSubview(imageView)
        addSubview(titleLabel)
//        addSubview(linkButton)

        setConstraints()
    }
    
    //MARK: - Constraints
    func setConstraints() {
        imageView.autoPinEdge(toSuperviewEdge: .top, withInset: 2)
        imageView.autoPinEdge(toSuperviewEdge: .left, withInset: AL_OFFSET)
        imageView.autoSetDimensions(to: CGSize(width: AL_CELL_HEIGHT*0.8, height: AL_CELL_HEIGHT*0.8))
        
        titleLabel.autoAlignAxis(.horizontal, toSameAxisOf: imageView)
        titleLabel.autoPinEdge(.left, to: .right, of: imageView, withOffset: AL_OFFSET)
        titleLabel.autoPinEdge(toSuperviewEdge: .right, withInset: AL_OFFSET)
        
//        linkButton.autoPinEdge(toSuperviewEdge: .bottom, withInset: 0)
//        linkButton.autoPinEdge(toSuperviewEdge: .left, withInset: AL_OFFSET)
//        linkButton.autoPinEdge(toSuperviewEdge: .right, withInset: AL_OFFSET)
    }
}

