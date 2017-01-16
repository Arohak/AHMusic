//
//  CategoryView.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 06/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

//MARK: - CategoryView -
class CategoryView: BaseView {
    
    lazy var collection: BaseCollectionView = {
        let view = BaseCollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
        
        return view
    }()
    
    //MARK: - Initialize -
    override init() {
        super.init()
        
        bgImageView.image = UIImage(named: "bg_1")
        addAllUIElements()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private Methods -
    fileprivate func addAllUIElements() {
        addSubview(collection)

        setConstraints()
    }
    
    //MARK: - Constraints -
    func setConstraints() {
        collection.autoPinEdgesToSuperviewEdges()
    }
}

//MARK: - CategoryCell -
class CategoryCell: UICollectionViewCell {
    
    //MARK: - Create UIElements -
    var cellContentView = CategoryCellContentView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(cellContentView)
        cellContentView.autoPinEdgesToSuperviewEdges()
    }
    
    func setValues(_ item: Category) {
        cellContentView.imageView.kf.setImage(with: URL(string: item.picture)!, placeholder: Image(named: "img_placeholder"))
        cellContentView.nameLabel.text = item.name
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - CategoryCellContentView -
class CategoryCellContentView: UIView {
    
    //MARK: - Create UIElements -
    lazy var imageView: UIImageView = {
        let view = UIImageView.newAutoLayout()
        view.layer.cornerRadius = CA_INSET
        view.clipsToBounds = true
        
        return view
    }()
    
    lazy var iconImageView: UIImageView = {
        let view = UIImageView.newAutoLayout()
        view.image = UIImage(named: "img_ca_sound")
        
        return view
    }()
    
    lazy var nameLabel: AHLabel = {
        let view = AHLabel.newAutoLayout()
        view.font = CA_TITLE_FONT
        view.textColor = WHITE
        
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
        imageView.addSubview(iconImageView)
        addSubview(nameLabel)
        
        setConstraints()
    }
    
    //MARK: - Constraints -
    func setConstraints() {
        imageView.autoPinEdge(toSuperviewEdge: .bottom, withInset: CA_OFFSET*1.5)
        imageView.autoPinEdgesToSuperviewEdges(with: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0), excludingEdge: .bottom)
        
        iconImageView.autoPinEdge(toSuperviewEdge: .left, withInset: 0)
        iconImageView.autoPinEdge(toSuperviewEdge: .bottom, withInset: 0)
        iconImageView.autoSetDimensions(to: CGSize(width: CA_ICON_SIZE, height: CA_ICON_SIZE))
        
        nameLabel.autoPinEdge(toSuperviewEdge: .bottom)
        nameLabel.autoAlignAxis(toSuperviewAxis: .vertical)
    }
}

