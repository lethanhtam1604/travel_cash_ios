//
//  PromotionCollectionViewCell.swift
//  TravelCash
//
//  Created by Thanh-Tam Le on 6/20/17.
//  Copyright © 2017 Tam. All rights reserved.
//

import UIKit
import SDWebImage

class PromotionCollectionViewCell: UICollectionViewCell {
    
    var imageView = UIImageView()
    var constraintAdded = false
    
    init() {
        super.init(frame: CGRect.zero)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    func commonInit() {
        backgroundColor = Global.colorBg
        
        imageView.tintColor = Global.colorMain
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = Global.colorGray
        imageView.sd_setShowActivityIndicatorView(true)
        imageView.sd_setIndicatorStyle(.gray)
        
        addSubview(imageView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if !constraintAdded {
            constraintAdded = true
            
            imageView.autoPinEdge(toSuperviewEdge: .top, withInset: 0)
            imageView.autoPinEdge(toSuperviewEdge: .left, withInset: 0)
            imageView.autoPinEdge(toSuperviewEdge: .right, withInset: 0)
            imageView.autoPinEdge(toSuperviewEdge: .bottom, withInset: 0)
        }
    }
    
    func bindingData(promotion: Promotion) {
        imageView.sd_setImage(with: URL(string: Global.imageUrl + promotion.banner_large))
    }
    
    func bindingDataOriginal(image: UIImage) {
        imageView.image = image
    }
}
