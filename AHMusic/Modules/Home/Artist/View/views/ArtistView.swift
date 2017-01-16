//
//  ArtistView.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 06/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

//MARK: - ArtistView -
class ArtistView: BaseView {
    
    lazy var collection: BaseCollectionView = {
        let view = BaseCollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
        
        return view
    }()
    
    lazy var refresh: CarbonSwipeRefresh = {
        let view = CarbonSwipeRefresh(scrollView: self.collection)
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
    
    func setValues(_ item: Artist) {
        cellContentView.imageView.kf.setImage(with: URL(string: item.picture), placeholder: Image(named: "img_placeholder"))
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
        let view = UIImageView.newAutoLayout()
        view.layer.cornerRadius = TR_INSET
        view.clipsToBounds = true
        
        return view
    }()
    
    lazy var nameLabel: AHLabel = {
        let view = AHLabel.newAutoLayout()
        view.font = AR_TITLE_FONT
        view.numberOfLines = 2
        view.textAlignment = .center
        
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
    
    //MARK: - Privat Methods -
    func addAllUIElements() {
        addSubview(imageView)
        addSubview(nameLabel)
        
        setConstraints()
    }
    
    //MARK: - Constraints
    func setConstraints() {
        imageView.autoPinEdge(.bottom, to: .top, of: nameLabel)
        imageView.autoPinEdgesToSuperviewEdges(with: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0), excludingEdge: .bottom)
        
        nameLabel.autoPinEdge(toSuperviewEdge: .bottom)
        nameLabel.autoPinEdge(toSuperviewEdge: .left, withInset: AR_INSET)
        nameLabel.autoPinEdge(toSuperviewEdge: .right, withInset: AR_INSET)
    }
}

