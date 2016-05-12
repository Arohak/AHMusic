//
//  TrackViewswift
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
        
        contentView.addSubview(cellContentView)
        cellContentView.autoPinEdgesToSuperviewEdges()
    }
    
    func setValues(item: Track) {
        cellContentView.imageView.image = UIImage(named: "")
        cellContentView.titleLabel.text = item.title
        cellContentView.descLabel.text = item.link
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
        view.backgroundColor = BLUE_LIGHT
        
        return view
    }()
    
    lazy var playButton: UIButton = {
        let view = UIButton.newAutoLayoutView()
        view.setBackgroundImage(UIImage(named: "img_tr_play"), forState: .Normal)
        
        return view
    }()
    
    lazy var titleLabel: AHLabel = {
        let view = AHLabel.newAutoLayoutView()
        view.font = CA_TITLE_FONT
        view.textColor = BLUE
        
        return view
    }()
    
    lazy var descLabel: AHLabel = {
        let view = AHLabel.newAutoLayoutView()
        view.font = TR_DESC_FONT
        view.textColor = GRAY
        
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
        addSubview(descLabel)

        setConstraints()
    }
    
    //MARK: - Constraints
    func setConstraints() {
        imageView.autoPinEdgeToSuperviewEdge(.Right, withInset: TR_OFFSET)
        imageView.autoPinEdgeToSuperviewEdge(.Top, withInset: 2)
        imageView.autoPinEdgeToSuperviewEdge(.Bottom, withInset: 2)
        imageView.autoSetDimension(.Width, toSize: TR_IMG_WIDTH)
        
        playButton.autoCenterInSuperview()
        playButton.autoSetDimensionsToSize(CGSize(width: TR_ICON_SIZE, height: TR_ICON_SIZE))
        
        titleLabel.autoPinEdgeToSuperviewEdge(.Top, withInset: TR_OFFSET)
        titleLabel.autoPinEdgeToSuperviewEdge(.Left, withInset: TR_OFFSET)
        titleLabel.autoPinEdge(.Right, toEdge: .Left, ofView: imageView, withOffset: -TR_OFFSET)
        
        descLabel.autoPinEdge(.Top, toEdge: .Bottom, ofView: titleLabel, withOffset: TR_INSET)
        descLabel.autoPinEdgeToSuperviewEdge(.Left, withInset: TR_OFFSET)
        descLabel.autoPinEdge(.Right, toEdge: .Left, ofView: imageView, withOffset: -TR_OFFSET)
    }
}

