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
        view.backgroundColor = BLUE_LIGHT
        
        return view
    }()
    
    //MARK: - Initialize
    init() {
        super.init(frame: CGRectZero)
        
        backgroundColor = WHITE
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
        cellContentView.imageView.kf_setImageWithURL(NSURL(string: "http:" + item.image)!)
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
        view.layer.cornerRadius = LA_ICON_SIZE/2
        view.layer.borderWidth = 2
        view.layer.borderColor = BLUE.CGColor
        
        return view
    }()
    
    lazy var nameLabel: AHLabel = {
        let view = AHLabel.newAutoLayoutView()
        view.font = DE_NAME_FONT
        view.text = "Name Pop"
        
        return view
    }()
    
    //MARK: - Initialize
    init() {
        super.init(frame: CGRectZero)
        
        backgroundColor = GREEN
        addAllUIElements()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Privat Methods
    func addAllUIElements() {
        addSubview(imageView)
        addSubview(iconImageView)
        addSubview(nameLabel)
        
        setConstraints()
    }
    
    //MARK: - Constraints
    func setConstraints() {
        imageView.autoPinEdgeToSuperviewEdge(.Bottom, withInset: LA_INSET)
        imageView.autoPinEdgesToSuperviewEdgesWithInsets(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0), excludingEdge: .Bottom)
        
        iconImageView.autoPinEdgeToSuperviewEdge(.Left, withInset: LA_INSET)
        iconImageView.autoPinEdgeToSuperviewEdge(.Bottom, withInset: LA_INSET*2)
        iconImageView.autoSetDimensionsToSize(CGSize(width: LA_ICON_SIZE, height: LA_ICON_SIZE))
        
        nameLabel.autoPinEdgeToSuperviewEdge(.Bottom)
        nameLabel.autoAlignAxisToSuperviewAxis(.Vertical)
    }
}

