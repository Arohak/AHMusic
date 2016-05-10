//
//  CategoryView.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 06/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

//MARK: - CategoryView
class CategoryView: UIView {
    
    lazy var collection: UICollectionView = {
        let view = UICollectionView(frame: CGRectZero, collectionViewLayout: UICollectionViewFlowLayout())
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
        addSubview(collection)

        setConstraints()
    }
    
    //MARK: - Constraints
    func setConstraints() {
        collection.autoPinEdgesToSuperviewEdges()
    }
}

//MARK: - CategoryCell
class CategoryCell: UICollectionViewCell {
    
    //MARK: - Create UIElements
    var cellContentView = CategoryCellContentView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(cellContentView)
        cellContentView.autoPinEdgesToSuperviewEdges()
    }
    
    func setValues(item: Category) {
        cellContentView.imageView.image = UIImage(named: item.image)
        cellContentView.nameLabel.text = item.name
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - CategoryCellContentView
class CategoryCellContentView: UIView {
    
    //MARK: - Create UIElements
    lazy var imageView: UIImageView = {
        let view = UIImageView.newAutoLayoutView()
        
        return view
    }()
    
    lazy var iconImageView: UIImageView = {
        let view = UIImageView.newAutoLayoutView()
        view.image = UIImage(named: "img_ca_icon")
        view.layer.cornerRadius = CA_ICON_SIZE/2
        view.layer.borderWidth = 2
        view.layer.borderColor = BLUE.CGColor
        
        return view
    }()
    
    lazy var nameLabel: AHLabel = {
        let view = AHLabel.newAutoLayoutView()
        view.font = CA_TITLE_FONT
        view.textColor = BLUE
        
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
        imageView.addSubview(iconImageView)
        addSubview(nameLabel)
        
        setConstraints()
    }
    
    //MARK: - Constraints
    func setConstraints() {
        imageView.autoPinEdgeToSuperviewEdge(.Bottom, withInset: CA_OFFSET*1.5)
        imageView.autoPinEdgesToSuperviewEdgesWithInsets(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0), excludingEdge: .Bottom)
        
        iconImageView.autoPinEdgeToSuperviewEdge(.Left, withInset: CA_OFFSET)
        iconImageView.autoPinEdgeToSuperviewEdge(.Bottom, withInset: CA_OFFSET)
        iconImageView.autoSetDimensionsToSize(CGSize(width: CA_ICON_SIZE, height: CA_ICON_SIZE))
        
        nameLabel.autoPinEdgeToSuperviewEdge(.Bottom)
        nameLabel.autoAlignAxisToSuperviewAxis(.Vertical)
    }
}

