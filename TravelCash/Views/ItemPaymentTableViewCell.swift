//
//  ItemPaymentTableViewCell.swift
//  TravelCash
//
//  Created by Thanh-Tam Le on 6/21/17.
//  Copyright © 2017 Tam. All rights reserved.
//

import UIKit

class ItemPaymentTableViewCell: UITableViewCell {

    let titleLabel = UILabel()
    let dateLabel = UILabel()
    let priceLabel = UILabel()
    
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
        
        titleLabel.text = "Loan"
        titleLabel.font = UIFont(name: "OpenSans", size: 15)
        titleLabel.textAlignment = .left
        titleLabel.textColor = UIColor.black.withAlphaComponent(0.8)
        titleLabel.lineBreakMode = .byWordWrapping
        titleLabel.numberOfLines = 0
        
        dateLabel.text = "2017-11-01"
        dateLabel.font = UIFont(name: "OpenSans", size: 15)
        dateLabel.textAlignment = .center
        dateLabel.textColor = UIColor.black.withAlphaComponent(0.8)
        dateLabel.lineBreakMode = .byWordWrapping
        dateLabel.numberOfLines = 0
        
        priceLabel.text = "$204,000.00"
        priceLabel.font = UIFont(name: "OpenSans", size: 15)
        priceLabel.textAlignment = .right
        priceLabel.textColor = UIColor.black.withAlphaComponent(0.8)
        priceLabel.lineBreakMode = .byWordWrapping
        priceLabel.numberOfLines = 0

        addSubview(titleLabel)
        addSubview(dateLabel)
        addSubview(priceLabel)
        
        setNeedsUpdateConstraints()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if !constraintAdded {
            constraintAdded = true
            
            titleLabel.autoPinEdge(toSuperviewEdge: .left, withInset: 10)
            titleLabel.autoAlignAxis(toSuperviewAxis: .horizontal)
            titleLabel.autoMatch(.width, to: .width, of: dateLabel)
            
            dateLabel.autoAlignAxis(toSuperviewAxis: .horizontal)
            dateLabel.autoAlignAxis(toSuperviewAxis: .vertical)
            dateLabel.autoSetDimension(.width, toSize: (frame.size.width - 10 - 20)/3)
            
            priceLabel.autoPinEdge(toSuperviewEdge: .right, withInset: 10)
            priceLabel.autoAlignAxis(toSuperviewAxis: .horizontal)
            priceLabel.autoMatch(.width, to: .width, of: dateLabel)
        }
    }
    
    func bindingData(statement: Statement) {
        titleLabel.text = statement.Description

        let times = statement.TransactionDate.components(separatedBy: " ")
        if times.count > 0 {
            dateLabel.text = times[0]
        }

        if statement.TransactionAmount != "" {
            if let transactionAmount = Utils.currencyFormat(value: statement.TransactionAmount) {
                priceLabel.text = transactionAmount
            }
            else {
                priceLabel.text = "$0.00"
            }
        }
        else {
            priceLabel.text = ""
        }
    }
}
