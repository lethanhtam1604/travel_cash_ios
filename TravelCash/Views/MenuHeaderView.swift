//
//  MenuHeaderView.swift
//  TravelCash
//
//  Created by Thanh-Tam Le on 6/14/17.
//  Copyright © 2017 Tam. All rights reserved.
//

import UIKit

class MenuHeaderView: UITableViewCell {
    
    let iconImgView = UIImageView()
    let nameLabel = UILabel()
    
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
        
        iconImgView.clipsToBounds = true
        iconImgView.contentMode = .scaleAspectFit
        iconImgView.image = UIImage(named: "ic_user_profile")
        
        nameLabel.text = ""
        nameLabel.font = UIFont(name: "OpenSans-bold", size: 18)
        nameLabel.textAlignment = .left
        nameLabel.textColor = UIColor.white
        nameLabel.lineBreakMode = .byTruncatingTail
        nameLabel.numberOfLines = 2
        
        contentView.addSubview(iconImgView)
        contentView.addSubview(nameLabel)
        
        setNeedsUpdateConstraints()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if !constraintAdded {
            constraintAdded = true
            
            nameLabel.autoPinEdge(toSuperviewEdge: .left, withInset: 10)
            nameLabel.autoPinEdge(toSuperviewEdge: .right, withInset: 10)
            nameLabel.autoPinEdge(toSuperviewEdge: .bottom, withInset: 10)
            nameLabel.autoSetDimension(.height, toSize: 40)
            
            iconImgView.autoPinEdge(.bottom, to: .top, of: nameLabel, withOffset: -10)
            iconImgView.autoPinEdge(toSuperviewEdge: .left, withInset: 0)
            iconImgView.autoSetDimensions(to: CGSize(width: 100, height: 60))
        }
    }
    
    func bindingData(user: User) {
        let firstName = user.first_name ?? ""
        let surname = user.surname ?? ""
        nameLabel.text = firstName + surname
    }
}
