//
//  NotificationTableViewCell.swift
//  TravelCash
//
//  Created by Thanh-Tam Le on 6/20/17.
//  Copyright © 2017 Tam. All rights reserved.
//

import UIKit

class NotificationTableViewCell: UITableViewCell {

    let titleLabel = UILabel()
    let contentLabel = UILabel()
    let circleView = UIView()
    let circleTextLabel = UILabel()

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

        titleLabel.text = "My Test Next"
        titleLabel.font = UIFont(name: "OpenSans", size: 15)
        titleLabel.textAlignment = .left
        titleLabel.textColor = UIColor.black.withAlphaComponent(0.8)
        titleLabel.lineBreakMode = .byWordWrapping
        titleLabel.numberOfLines = 0

        contentLabel.text = "Test Next Notification"
        contentLabel.font = UIFont(name: "OpenSans", size: 14)
        contentLabel.textAlignment = .left
        contentLabel.textColor = UIColor.black.withAlphaComponent(0.6)
        contentLabel.lineBreakMode = .byWordWrapping
        contentLabel.numberOfLines = 0

        circleView.backgroundColor = Global.colorMidBlue
        circleView.layer.cornerRadius = 20

        circleTextLabel.font = UIFont(name: "OpenSans", size: 16)
        circleTextLabel.textAlignment = .center
        circleTextLabel.textColor = UIColor.white

        circleView.addSubview(circleTextLabel)
        addSubview(circleView)
        addSubview(titleLabel)
        addSubview(contentLabel)

        setNeedsUpdateConstraints()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        if !constraintAdded {
            constraintAdded = true

            circleView.autoAlignAxis(toSuperviewAxis: .horizontal)
            circleView.autoSetDimensions(to: CGSize(width: 40, height: 40))
            circleView.autoPinEdge(toSuperviewEdge: .left, withInset: 10)

            circleTextLabel.autoSetDimensions(to: CGSize(width: 30, height: 30))
            circleTextLabel.autoAlignAxis(toSuperviewAxis: .horizontal)
            circleTextLabel.autoAlignAxis(toSuperviewAxis: .vertical)

            titleLabel.autoPinEdge(.left, to: .right, of: circleView, withOffset: 10)
            titleLabel.autoPinEdge(toSuperviewEdge: .top, withInset: 10)
            titleLabel.autoPinEdge(toSuperviewEdge: .right, withInset: 10)

            contentLabel.autoPinEdge(.left, to: .left, of: titleLabel)
            contentLabel.autoPinEdge(.top, to: .bottom, of: titleLabel, withOffset: 2)
            contentLabel.autoPinEdge(toSuperviewEdge: .right, withInset: 10)
        }
    }

    func bindingData(notification: Notification) {
        titleLabel.text = notification.type
        contentLabel.text = notification.message

        if notification.type.length() >= 2 {
            let index = notification.type.index(notification.type.startIndex, offsetBy: 2)
            circleTextLabel.text = notification.type.substring(to: index).uppercased()
        }

        if notification.read_stamp == "" {
            backgroundColor = Global.colorGray
        }
        else {
            backgroundColor = UIColor.white
        }
    }
}
