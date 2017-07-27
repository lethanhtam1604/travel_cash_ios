//
//  ItemSettingTableViewCell.swift
//  TravelCash
//
//  Created by Thanh-Tam Le on 6/21/17.
//  Copyright © 2017 Tam. All rights reserved.
//

import UIKit

class ItemSettingTableViewCell: UITableViewCell {

    let titleLabel = UILabel()
    let contentLabel = UILabel()
    let notificationSwitch = UISwitch()

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
        
        titleLabel.font = UIFont(name: "OpenSans", size: 16)
        titleLabel.textAlignment = .left
        titleLabel.textColor = UIColor.black.withAlphaComponent(0.8)
        titleLabel.lineBreakMode = .byWordWrapping
        titleLabel.numberOfLines = 0
        
        contentLabel.font = UIFont(name: "OpenSans", size: 14)
        contentLabel.textAlignment = .left
        contentLabel.textColor = UIColor.black.withAlphaComponent(0.6)
        contentLabel.lineBreakMode = .byWordWrapping
        contentLabel.numberOfLines = 0
        
        notificationSwitch.onTintColor = Global.colorMidBlue
        notificationSwitch.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        notificationSwitch.isHidden = true
        notificationSwitch.isOn = true
        
        if notificationSwitch.isOn {
            notificationSwitch.thumbTintColor = Global.colorMain
        } else {
            notificationSwitch.thumbTintColor = Global.colorGray
        }
        
        addSubview(titleLabel)
        addSubview(contentLabel)
        addSubview(notificationSwitch)

        setNeedsUpdateConstraints()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if !constraintAdded {
            constraintAdded = true
            
            titleLabel.autoPinEdge(toSuperviewEdge: .top, withInset: 10)
            titleLabel.autoPinEdge(toSuperviewEdge: .left, withInset: 10)
            titleLabel.autoPinEdge(.right, to: .left, of: notificationSwitch, withOffset: 10)
            
            contentLabel.autoPinEdge(.top, to: .bottom, of: titleLabel, withOffset: 2)
            contentLabel.autoPinEdge(.left, to: .left, of: titleLabel)
            contentLabel.autoPinEdge(.right, to: .right, of: titleLabel)
            
            notificationSwitch.autoSetDimensions(to: CGSize(width: 30, height: 30))
            notificationSwitch.autoPinEdge(toSuperviewEdge: .right, withInset: 30)
            notificationSwitch.autoAlignAxis(toSuperviewAxis: .horizontal)
        }
    }
    
    func bindingData(setting: Setting) {
        titleLabel.text = setting.title
        contentLabel.text = setting.content
        
        if setting.isNotification {
            notificationSwitch.isHidden = false
        }
        else {
            notificationSwitch.isHidden = true
        }
    }
}
