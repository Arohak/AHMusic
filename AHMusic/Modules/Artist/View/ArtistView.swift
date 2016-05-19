//
//  ArtistView.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 06/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

//MARK: - ArtistView -
class ArtistView: UIView {
    
    lazy var collection: UICollectionView = {
        let view = UICollectionView(frame: CGRectZero, collectionViewLayout: UICollectionViewFlowLayout())
        view.backgroundColor = WHITE
        
        return view
    }()
    
    lazy var refresh: CarbonSwipeRefresh = {
        let view = CarbonSwipeRefresh(scrollView: self.collection)
        view.colors = RCOLORS
        
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
        addSubview(collection)
        addSubview(refresh)

        setConstraints()
    }
    
    //MARK: - Constraints -
    func setConstraints() {
        collection.autoPinEdgesToSuperviewEdges()
        refresh.setMarginTop(0)
    }
}

//MARK: - ArtistCell -
class ArtistCell: UICollectionViewCell {
    
    //MARK: - Create UIElements -
    var cellContentView = ArtistCellContentView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(cellContentView)
        cellContentView.autoPinEdgesToSuperviewEdges()
    }
    
    func setValues(item: Artist) {
        cellContentView.imageView.kf_setImageWithURL(NSURL(string: item.picture)!, placeholderImage: Image(named: "img_placeholder"))
        cellContentView.nameLabel.text = item.name
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - ArtistCellContentView -
class ArtistCellContentView: UIView {
    
    //MARK: - Create UIElements -
    lazy var imageView: UIImageView = {
        let view = UIImageView.newAutoLayoutView()
        
        return view
    }()
    
    lazy var nameLabel: AHLabel = {
        let view = AHLabel.newAutoLayoutView()
        view.font = AR_TITLE_FONT
        view.textColor = BLUE
        view.numberOfLines = 2
        
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
        addSubview(nameLabel)
        
        setConstraints()
    }
    
    //MARK: - Constraints
    func setConstraints() {
        imageView.autoPinEdge(.Bottom, toEdge: .Top, ofView: nameLabel)
        imageView.autoPinEdgesToSuperviewEdgesWithInsets(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0), excludingEdge: .Bottom)
        
        nameLabel.autoPinEdgeToSuperviewEdge(.Bottom)
        nameLabel.autoPinEdgeToSuperviewEdge(.Left, withInset: AR_INSET)
        nameLabel.autoPinEdgeToSuperviewEdge(.Right, withInset: AR_INSET)
    }
}

