//
//  ActiveLoanTableViewCell.swift
//  TravelCash
//
//  Created by Thanh-Tam Le on 6/20/17.
//  Copyright © 2017 Tam. All rights reserved.
//

import UIKit

class ActiveLoanTableViewCell: UITableViewCell {

    let iconImgView = UIImageView()
    
    let loanLabel = UILabel()
    let loanContentLabel = UILabel()
    
    let typeLabel = UILabel()
    let typeContentLabel = UILabel()
    
    let balanceLabel = UILabel()
    let balanceContentLabel = UILabel()
    
    let arrearsLabel = UILabel()
    let arrearsContentLabel = UILabel()

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
        iconImgView.image = UIImage(named: "ic_star_border")
        iconImgView.tintColor = UIColor.red
        
        loanLabel.text = "Loan#:"
        loanLabel.font = UIFont(name: "OpenSans", size: 15)
        loanLabel.textAlignment = .left
        loanLabel.textColor = UIColor.black.withAlphaComponent(0.6)
        loanLabel.lineBreakMode = .byTruncatingTail
        loanLabel.numberOfLines = 1
        
        loanContentLabel.text = "1-51-P-1312"
        loanContentLabel.font = UIFont(name: "OpenSans", size: 15)
        loanContentLabel.textAlignment = .left
        loanContentLabel.textColor = UIColor.black.withAlphaComponent(0.6)
        loanContentLabel.lineBreakMode = .byTruncatingTail
        loanContentLabel.numberOfLines = 1
        
        typeLabel.text = "Type:"
        typeLabel.font = UIFont(name: "OpenSans", size: 15)
        typeLabel.textAlignment = .left
        typeLabel.textColor = UIColor.black.withAlphaComponent(0.6)
        typeLabel.lineBreakMode = .byTruncatingTail
        typeLabel.numberOfLines = 1
        
        typeContentLabel.text = "Guarntor on the Loan"
        typeContentLabel.font = UIFont(name: "OpenSans", size: 15)
        typeContentLabel.textAlignment = .left
        typeContentLabel.textColor = UIColor.black.withAlphaComponent(0.6)
        typeContentLabel.lineBreakMode = .byTruncatingTail
        typeContentLabel.numberOfLines = 1
        
        balanceLabel.text = "Balance:"
        balanceLabel.font = UIFont(name: "OpenSans-bold", size: 14)
        balanceLabel.textAlignment = .left
        balanceLabel.textColor = UIColor.black.withAlphaComponent(0.8)
        balanceLabel.lineBreakMode = .byTruncatingTail
        balanceLabel.numberOfLines = 1
        
        balanceContentLabel.text = "$96,847.31"
        balanceContentLabel.font = UIFont(name: "OpenSans-bold", size: 14)
        balanceContentLabel.textAlignment = .left
        balanceContentLabel.textColor = UIColor.black.withAlphaComponent(0.8)
        balanceContentLabel.lineBreakMode = .byTruncatingTail
        balanceContentLabel.numberOfLines = 1
        
        arrearsLabel.text = "Arrears:"
        arrearsLabel.font = UIFont(name: "OpenSans", size: 15)
        arrearsLabel.textAlignment = .left
        arrearsLabel.textColor = UIColor.black.withAlphaComponent(0.6)
        arrearsLabel.lineBreakMode = .byTruncatingTail
        arrearsLabel.numberOfLines = 1
        
        arrearsContentLabel.text = "$96,847.31"
        arrearsContentLabel.font = UIFont(name: "OpenSans", size: 15)
        arrearsContentLabel.textAlignment = .left
        arrearsContentLabel.textColor = UIColor.red.withAlphaComponent(0.8)
        arrearsContentLabel.lineBreakMode = .byTruncatingTail
        arrearsContentLabel.numberOfLines = 1
        
        addSubview(iconImgView)
        addSubview(loanLabel)
        addSubview(loanContentLabel)
        addSubview(typeLabel)
        addSubview(typeContentLabel)
        addSubview(balanceLabel)
        addSubview(balanceContentLabel)
        addSubview(arrearsLabel)
        addSubview(arrearsContentLabel)

        setNeedsUpdateConstraints()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if !constraintAdded {
            constraintAdded = true
            
            iconImgView.autoPinEdge(toSuperviewEdge: .left, withInset: 5)
            iconImgView.autoSetDimensions(to: CGSize(width: 40, height: 40))
            iconImgView.autoAlignAxis(toSuperviewAxis: .horizontal)
            
            loanLabel.autoPinEdge(toSuperviewEdge: .top, withInset: 5)
            loanLabel.autoPinEdge(.left, to: .right, of: iconImgView, withOffset: 10)
            loanLabel.autoSetDimensions(to: CGSize(width: 60, height: 20))
            
            loanContentLabel.autoPinEdge(.top, to: .top, of: loanLabel)
            loanContentLabel.autoPinEdge(.left, to: .right, of: loanLabel, withOffset: 10)
            loanContentLabel.autoPinEdge(toSuperviewEdge: .right, withInset: 5)
            loanContentLabel.autoSetDimension(.height, toSize: 20)
            
            typeLabel.autoPinEdge(.top, to: .bottom, of: loanLabel, withOffset: 2)
            typeLabel.autoPinEdge(.left, to: .right, of: iconImgView, withOffset: 10)
            typeLabel.autoSetDimensions(to: CGSize(width: 60, height: 20))
            
            typeContentLabel.autoPinEdge(.top, to: .top, of: typeLabel)
            typeContentLabel.autoPinEdge(.left, to: .right, of: typeLabel, withOffset: 10)
            typeContentLabel.autoPinEdge(toSuperviewEdge: .right, withInset: 5)
            typeContentLabel.autoSetDimension(.height, toSize: 20)
            
            balanceLabel.autoPinEdge(.top, to: .bottom, of: typeLabel, withOffset: 2)
            balanceLabel.autoPinEdge(.left, to: .right, of: iconImgView, withOffset: 10)
            balanceLabel.autoSetDimensions(to: CGSize(width: 60, height: 20))
            
            balanceContentLabel.autoPinEdge(.top, to: .top, of: balanceLabel)
            balanceContentLabel.autoPinEdge(.left, to: .right, of: balanceLabel, withOffset: 10)
            balanceContentLabel.autoPinEdge(toSuperviewEdge: .right, withInset: 5)
            balanceContentLabel.autoSetDimension(.height, toSize: 20)
            
            arrearsLabel.autoPinEdge(.top, to: .bottom, of: balanceLabel, withOffset: 2)
            arrearsLabel.autoPinEdge(.left, to: .right, of: iconImgView, withOffset: 10)
            arrearsLabel.autoSetDimensions(to: CGSize(width: 60, height: 20))
            
            arrearsContentLabel.autoPinEdge(.top, to: .top, of: arrearsLabel)
            arrearsContentLabel.autoPinEdge(.left, to: .right, of: arrearsLabel, withOffset: 10)
            arrearsContentLabel.autoPinEdge(toSuperviewEdge: .right, withInset: 5)
            arrearsContentLabel.autoSetDimension(.height, toSize: 20)
        }
    }
    
    func bindingData(activeLoan: ActiveLoan) {
        loanContentLabel.text = activeLoan.LoanId
        typeContentLabel.text = activeLoan.Type

        if activeLoan.Balance != "" {
            if let balanceString = Utils.currencyFormat(value: activeLoan.Balance) {
                balanceContentLabel.text = balanceString
            }
            else {
                balanceContentLabel.text = "$0.00"
            }
        }
        else {
            balanceContentLabel.text = ""
        }

        if activeLoan.Arrears != "" {
            if let arrearsString = Utils.currencyFormat(value: activeLoan.Arrears) {
                arrearsContentLabel.text = arrearsString
            }
            else {
                arrearsContentLabel.text = "$0.00"
            }
        }
        else {
            arrearsContentLabel.text = ""
        }

        let arrears = Double(activeLoan.Arrears) ?? 0

        if arrears >= 0 {
            let warningImg = UIImage(named: "warning_black")
            let warningTintedImg = warningImg?.withRenderingMode(.alwaysTemplate)
            iconImgView.image = warningTintedImg
            iconImgView.tintColor = UIColor.red
        }
        else {
            arrearsLabel.isHidden = true
            arrearsContentLabel.isHidden = true
            let checkboxImg = UIImage(named: "checkbox-marked-outline")
            let checkboxTintedImg = checkboxImg?.withRenderingMode(.alwaysTemplate)
            iconImgView.image = checkboxTintedImg
            iconImgView.tintColor = UIColor(0x2E7D32)
        }
    }
}
