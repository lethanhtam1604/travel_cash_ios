//
//  ActiveLoanHeaderView.swift
//  TravelCash
//
//  Created by Thanh-Tam Le on 6/21/17.
//  Copyright © 2017 Tam. All rights reserved.
//

import UIKit

class ActiveLoanHeaderView: UITableViewCell {

    let newLoanRequestButton = UIButton()
    let applyForLoanButton = UIButton()
    let makeRequest = UIButton()
    let activeLoanTopView = UIView()
    let activeLoanLabel = UILabel()
    let activeLoanBottomView = UIView()
    
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
        
        activeLoanLabel.text = "Active Loans"
        activeLoanLabel.font = UIFont(name: "OpenSans", size: 18)
        activeLoanLabel.textAlignment = .left
        activeLoanLabel.textColor = UIColor.black.withAlphaComponent(0.6)
        activeLoanTopView.backgroundColor = UIColor.red
        activeLoanBottomView.backgroundColor = UIColor.red
        
        applyForLoanButton.setTitle("APPLY FOR LOAN", for: .normal)
        applyForLoanButton.backgroundColor = Global.colorNewUser
        applyForLoanButton.setTitleColor(UIColor.white, for: .normal)
        applyForLoanButton.setTitleColor(Global.colorSelected, for: .highlighted)
        applyForLoanButton.layer.cornerRadius = 5
        applyForLoanButton.titleLabel?.font = UIFont(name: "OpenSans-semibold", size: 15)
        applyForLoanButton.clipsToBounds = true
        
        newLoanRequestButton.setTitle("NEW LOAN REQUEST", for: .normal)
        newLoanRequestButton.backgroundColor = Global.colorMain
        newLoanRequestButton.setTitleColor(UIColor.white, for: .normal)
        newLoanRequestButton.setTitleColor(Global.colorSelected, for: .highlighted)
        newLoanRequestButton.layer.cornerRadius = 5
        newLoanRequestButton.titleLabel?.font = UIFont(name: "OpenSans-semibold", size: 15)
        newLoanRequestButton.clipsToBounds = true
        
        makeRequest.setTitle("MAKE A REQUEST", for: .normal)
        makeRequest.backgroundColor = Global.colorMain
        makeRequest.setTitleColor(UIColor.white, for: .normal)
        makeRequest.setTitleColor(Global.colorSelected, for: .highlighted)
        makeRequest.layer.cornerRadius = 5
        makeRequest.titleLabel?.font = UIFont(name: "OpenSans-semibold", size: 15)
        makeRequest.clipsToBounds = true
        
        contentView.addSubview(applyForLoanButton)
        contentView.addSubview(newLoanRequestButton)
        contentView.addSubview(makeRequest)
        contentView.addSubview(activeLoanTopView)
        contentView.addSubview(activeLoanBottomView)
        contentView.addSubview(activeLoanLabel)
        setNeedsUpdateConstraints()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if !constraintAdded {
            constraintAdded = true
            
            let alpha: CGFloat = 50
            
            applyForLoanButton.autoPinEdge(toSuperviewEdge: .top, withInset: 10)
            applyForLoanButton.autoPinEdge(toSuperviewEdge: .left, withInset: alpha)
            applyForLoanButton.autoPinEdge(toSuperviewEdge: .right, withInset: alpha)
            applyForLoanButton.autoSetDimension(.height, toSize: 45)
            
            newLoanRequestButton.autoPinEdge(.top, to: .bottom, of: applyForLoanButton, withOffset: 10)
            newLoanRequestButton.autoPinEdge(toSuperviewEdge: .left, withInset: alpha)
            newLoanRequestButton.autoPinEdge(toSuperviewEdge: .right, withInset: alpha)
            newLoanRequestButton.autoSetDimension(.height, toSize: 45)
            
            makeRequest.autoPinEdge(.top, to: .bottom, of: newLoanRequestButton, withOffset: 10)
            makeRequest.autoPinEdge(toSuperviewEdge: .left, withInset: alpha)
            makeRequest.autoPinEdge(toSuperviewEdge: .right, withInset: alpha)
            makeRequest.autoSetDimension(.height, toSize: 45)
            
            activeLoanTopView.autoPinEdge(.top, to: .bottom, of: makeRequest, withOffset: 10)
            activeLoanTopView.autoPinEdge(toSuperviewEdge: .left, withInset: 0)
            activeLoanTopView.autoPinEdge(toSuperviewEdge: .right, withInset: 0)
            activeLoanTopView.autoSetDimension(.height, toSize: 1)
            
            activeLoanLabel.autoPinEdge(.top, to: .bottom, of: activeLoanTopView, withOffset: 0)
            activeLoanLabel.autoPinEdge(toSuperviewEdge: .left, withInset: 10)
            activeLoanLabel.autoPinEdge(toSuperviewEdge: .right, withInset: 0)
            activeLoanLabel.autoSetDimension(.height, toSize: 35)
            
            activeLoanBottomView.autoPinEdge(.top, to: .bottom, of: activeLoanLabel, withOffset: 0)
            activeLoanBottomView.autoPinEdge(toSuperviewEdge: .left, withInset: 0)
            activeLoanBottomView.autoPinEdge(toSuperviewEdge: .right, withInset: 0)
            activeLoanBottomView.autoSetDimension(.height, toSize: 1)
        }
    }
}
