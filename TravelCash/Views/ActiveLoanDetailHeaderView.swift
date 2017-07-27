//
//  ActiveLoanDetailHeaderView.swift
//  TravelCash
//
//  Created by Thanh-Tam Le on 6/21/17.
//  Copyright © 2017 Tam. All rights reserved.
//

import UIKit

class ActiveLoanDetailHeaderView: UITableViewCell {

    let titleLabel = UILabel()
    let loanLabel = UILabel()
    let loanContentLabel = UILabel()
    let balanceLabel = UILabel()
    let balanceContentLabel = UILabel()
    let lineView = UIView()
    let descriptionLabel = UILabel()
    let transDateLabel = UILabel()
    let transAmountLabel = UILabel()

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
        
        titleLabel.text = "Mini Statement"
        titleLabel.font = UIFont(name: "OpenSans-bold", size: 20)
        titleLabel.textAlignment = .center
        titleLabel.textColor = UIColor.black
        titleLabel.lineBreakMode = .byWordWrapping
        titleLabel.numberOfLines = 0
        
        loanLabel.text = "Loan#"
        loanLabel.font = UIFont(name: "OpenSans-bold", size: 16)
        loanLabel.textAlignment = .left
        loanLabel.textColor = UIColor.black
        loanLabel.lineBreakMode = .byTruncatingTail
        loanLabel.numberOfLines = 1
        
        loanContentLabel.text = "1-51-P-1312"
        loanContentLabel.font = UIFont(name: "OpenSans", size: 16)
        loanContentLabel.textAlignment = .center
        loanContentLabel.textColor = UIColor.black.withAlphaComponent(0.6)
        loanContentLabel.lineBreakMode = .byTruncatingTail
        loanContentLabel.numberOfLines = 1
        
        balanceLabel.text = "Balance"
        balanceLabel.font = UIFont(name: "OpenSans-bold", size: 16)
        balanceLabel.textAlignment = .left
        balanceLabel.textColor = UIColor.black
        balanceLabel.lineBreakMode = .byTruncatingTail
        balanceLabel.numberOfLines = 1
        
        balanceContentLabel.text = "$96,343.41"
        balanceContentLabel.font = UIFont(name: "OpenSans", size: 16)
        balanceContentLabel.textAlignment = .center
        balanceContentLabel.textColor = UIColor.black.withAlphaComponent(0.6)
        balanceContentLabel.lineBreakMode = .byTruncatingTail
        balanceContentLabel.numberOfLines = 1
        
        lineView.backgroundColor = UIColor.black
        
        descriptionLabel.text = "Description"
        descriptionLabel.font = UIFont(name: "OpenSans-bold", size: 16)
        descriptionLabel.textAlignment = .center
        descriptionLabel.textColor = UIColor.black
        descriptionLabel.lineBreakMode = .byWordWrapping
        descriptionLabel.numberOfLines = 0
        
        transDateLabel.text = "Date"
        transDateLabel.font = UIFont(name: "OpenSans-bold", size: 16)
        transDateLabel.textAlignment = .center
        transDateLabel.textColor = UIColor.black
        transDateLabel.lineBreakMode = .byWordWrapping
        transDateLabel.numberOfLines = 0
        
        transAmountLabel.text = "Amount"
        transAmountLabel.font = UIFont(name: "OpenSans-bold", size: 16)
        transAmountLabel.textAlignment = .center
        transAmountLabel.textColor = UIColor.black
        transAmountLabel.lineBreakMode = .byWordWrapping
        transAmountLabel.numberOfLines = 0
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(loanLabel)
        contentView.addSubview(loanContentLabel)
        contentView.addSubview(balanceLabel)
        contentView.addSubview(balanceContentLabel)
        contentView.addSubview(lineView)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(transDateLabel)
        contentView.addSubview(transAmountLabel)
        
        setNeedsUpdateConstraints()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if !constraintAdded {
            constraintAdded = true
            
            titleLabel.autoPinEdge(toSuperviewEdge: .top, withInset: 20)
            titleLabel.autoPinEdge(toSuperviewEdge: .left, withInset: 10)
            titleLabel.autoPinEdge(toSuperviewEdge: .right, withInset: 10)
            
            loanLabel.autoPinEdge(.top, to: .bottom, of: titleLabel, withOffset: 10)
            loanLabel.autoPinEdge(toSuperviewEdge: .left, withInset: 10)
            loanLabel.autoSetDimensions(to: CGSize(width: 80, height: 20))
            
            loanContentLabel.autoPinEdge(.top, to: .top, of: loanLabel)
            loanContentLabel.autoPinEdge(.left, to: .right, of: loanLabel, withOffset: 20)
            loanContentLabel.autoPinEdge(toSuperviewEdge: .right, withInset: 10)
            loanContentLabel.autoSetDimension(.height, toSize: 20)
            
            balanceLabel.autoPinEdge(.top, to: .bottom, of: loanLabel, withOffset: 5)
            balanceLabel.autoPinEdge(toSuperviewEdge: .left, withInset: 10)
            balanceLabel.autoSetDimensions(to: CGSize(width: 80, height: 20))
            
            balanceContentLabel.autoPinEdge(.top, to: .top, of: balanceLabel)
            balanceContentLabel.autoPinEdge(.left, to: .right, of: balanceLabel, withOffset: 20)
            balanceContentLabel.autoPinEdge(toSuperviewEdge: .right, withInset: 10)
            balanceContentLabel.autoSetDimension(.height, toSize: 20)
            
            lineView.autoPinEdge(.top, to: .bottom, of: balanceLabel, withOffset: 5)
            lineView.autoPinEdge(toSuperviewEdge: .right, withInset: 5)
            lineView.autoPinEdge(toSuperviewEdge: .left, withInset: 5)
            lineView.autoSetDimension(.height, toSize: 2)
            
            transDateLabel.autoPinEdge(.top, to: .bottom, of: lineView, withOffset: 5)
            transDateLabel.autoAlignAxis(toSuperviewAxis: .vertical)
            transDateLabel.autoSetDimension(.width, toSize: (frame.size.width - 10 - 20)/3)

            descriptionLabel.autoPinEdge(.top, to: .top, of: transDateLabel)
            descriptionLabel.autoPinEdge(toSuperviewEdge: .left, withInset: 10)
            descriptionLabel.autoMatch(.width, to: .width, of: transDateLabel)
            
            transAmountLabel.autoPinEdge(.top, to: .top, of: transDateLabel)
            transAmountLabel.autoPinEdge(toSuperviewEdge: .right, withInset: 10)
            transAmountLabel.autoMatch(.width, to: .width, of: transDateLabel)
        }
    }
    
    func bindingData(activeLoan: ActiveLoan) {
        loanContentLabel.text = activeLoan.LoanId
        
        if activeLoan.Balance != "" {
            if let balance = Utils.currencyFormat(value: activeLoan.Balance) {
                balanceContentLabel.text = balance
            }
            else {
                balanceContentLabel.text = "$0.00"
            }
        }
        else {
            balanceContentLabel.text = ""
        }
    }
}
