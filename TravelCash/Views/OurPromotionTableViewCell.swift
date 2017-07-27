//
//  OurPromotionTableViewCell.swift
//  TravelCash
//
//  Created by Thanh-Tam Le on 6/21/17.
//  Copyright © 2017 Tam. All rights reserved.
//

import UIKit

class OurPromotionTableViewCell: UITableViewCell {

    let bgImgView = UIImageView()
    let titleLabel = UILabel()
    let shareBtn = UIButton()
    let likeBtn = UIButton()
    let bottomView = UIView()

    var constraintAdded = false
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        backgroundColor = UIColor.white
        
        bottomView.backgroundColor = Global.colorPage

        bgImgView.backgroundColor = Global.colorGray
        bgImgView.clipsToBounds = true
        bgImgView.contentMode = .scaleAspectFill
        bgImgView.sd_setShowActivityIndicatorView(true)
        bgImgView.sd_setIndicatorStyle(.gray)

        titleLabel.text = "Christmas Song 1"
        titleLabel.font = UIFont(name: "OpenSans", size: 15)
        titleLabel.textAlignment = .right
        titleLabel.textColor = UIColor.black.withAlphaComponent(0.6)
        titleLabel.lineBreakMode = .byWordWrapping
        titleLabel.numberOfLines = 0
        
        likeBtn.setTitle("LIKE", for: .normal)
        likeBtn.backgroundColor = Global.colorLikeBtn
        likeBtn.setTitleColor(UIColor.white, for: .normal)
        likeBtn.setTitleColor(Global.colorSelected, for: .highlighted)
        likeBtn.layer.cornerRadius = 5
        likeBtn.titleLabel?.font = UIFont(name: "OpenSans-semibold", size: 15)
        likeBtn.clipsToBounds = true
        likeBtn.titleLabel?.lineBreakMode = .byWordWrapping
        likeBtn.titleLabel?.textAlignment = .center
        
        shareBtn.setTitle("SHARE", for: .normal)
        shareBtn.backgroundColor = Global.colorMain
        shareBtn.setTitleColor(UIColor.white, for: .normal)
        shareBtn.setTitleColor(Global.colorSelected, for: .highlighted)
        shareBtn.layer.cornerRadius = 5
        shareBtn.titleLabel?.font = UIFont(name: "OpenSans-semibold", size: 15)
        shareBtn.clipsToBounds = true
        shareBtn.titleLabel?.lineBreakMode = .byWordWrapping
        shareBtn.titleLabel?.textAlignment = .center
        
        addSubview(bgImgView)
        addSubview(titleLabel)
        addSubview(likeBtn)
        addSubview(shareBtn)
        addSubview(bottomView)
        setNeedsUpdateConstraints()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if !constraintAdded {
            constraintAdded = true
            
            bgImgView.autoPinEdge(toSuperviewEdge: .top, withInset: 0)
            bgImgView.autoPinEdge(toSuperviewEdge: .left, withInset: 0)
            bgImgView.autoPinEdge(toSuperviewEdge: .right, withInset: 0)
            bgImgView.autoSetDimension(.height, toSize: 250)
            
            titleLabel.autoPinEdge(.top, to: .bottom, of: bgImgView, withOffset: 10)
            titleLabel.autoPinEdge(toSuperviewEdge: .left, withInset: 10)
            titleLabel.autoPinEdge(toSuperviewEdge: .right, withInset: 10)
            
            shareBtn.autoPinEdge(.top, to: .bottom, of: titleLabel, withOffset: 20)
            shareBtn.autoPinEdge(toSuperviewEdge: .right, withInset: 10)
            shareBtn.autoSetDimensions(to: CGSize(width: 80, height: 30))
            
            likeBtn.autoPinEdge(.top, to: .top, of: shareBtn)
            likeBtn.autoMatch(.height, to: .height, of: shareBtn)
            likeBtn.autoMatch(.width, to: .width, of: shareBtn)
            likeBtn.autoPinEdge(.right, to: .left, of: shareBtn, withOffset: -10)
            
            bottomView.autoPinEdge(toSuperviewEdge: .bottom)
            bottomView.autoPinEdge(toSuperviewEdge: .right, withInset: 0)
            bottomView.autoPinEdge(toSuperviewEdge: .left, withInset: 0)
            bottomView.autoSetDimension(.height, toSize: 10)
        }
    }
    
    func bindingData(promotion: Promotion) {
        bgImgView.sd_setImage(with: URL(string: Global.imageUrl + promotion.banner_large))

        titleLabel.text = promotion.name

        if promotion.liked == "" {
            likeBtn.setTitle("LIKE", for: .normal)
        }
        else {
            likeBtn.setTitle("UNLIKE", for: .normal)
        }
    }
}
