//
//  ApplicationSummaryView.swift
//  TravelCash
//
//  Created by Thanh-Tam Le on 6/19/17.
//  Copyright © 2017 Tam. All rights reserved.
//

import UIKit
import DropDown

class ApplicationSummaryView: UIView {
    
    var constraintsAdded = false
    
    let scrollView = UIScrollView()
    let containerView = UIView()
    
    let titleLabel = UILabel()
    let numberPageLabel = UILabel()
    
    let fullNameLabel = UILabel()
    let fullNameContentLabel = UILabel()

    let addressLabel = UILabel()
    let addressContentLabel = UILabel()
    
    let trnLabel = UILabel()
    let trnContentLabel = UILabel()
    
    let idLabel = UILabel()
    let idContentLabel = UILabel()
    
    let employerLabel = UILabel()
    let employerContentLabel = UILabel()
    
    let occupationLabel = UILabel()
    let occupationContentLabel = UILabel()
    
    let netIncomeLabel = UILabel()
    let netIncomeContentLabel = UILabel()
    
    let referenceLabel = UILabel()
    let referenceContentLabel = UILabel()
    
    let nextOfSkinLabel = UILabel()
    let nextOfSkinContentLabel = UILabel()
    
    var currentDocument: UITextField!
    
    convenience init() {
        self.init(frame: .zero)
        
        backgroundColor = UIColor.white
        tintColor = Global.colorMain
        addTapToDismiss()
        
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.bounces = true
        
        titleLabel.text = "Application Summary"
        titleLabel.font = UIFont(name: "OpenSans", size: 24)
        titleLabel.textAlignment = .left
        titleLabel.textColor = Global.colorMidBlue
        titleLabel.lineBreakMode = .byWordWrapping
        titleLabel.numberOfLines = 0
        
        numberPageLabel.text = "7/7"
        numberPageLabel.font = UIFont(name: "OpenSans", size: 17)
        numberPageLabel.textAlignment = .center
        numberPageLabel.textColor = UIColor.black.withAlphaComponent(0.8)
        numberPageLabel.lineBreakMode = .byWordWrapping
        numberPageLabel.numberOfLines = 0
        numberPageLabel.layer.cornerRadius = 15
        numberPageLabel.layer.backgroundColor = UIColor.gray.withAlphaComponent(0.3).cgColor
        
        fullNameLabel.text = "Full Name"
        fullNameLabel.font = UIFont(name: "OpenSans-bold", size: 16)
        fullNameLabel.textAlignment = .left
        fullNameLabel.textColor = UIColor.black.withAlphaComponent(0.8)
        fullNameLabel.lineBreakMode = .byWordWrapping
        fullNameLabel.numberOfLines = 0
        
        fullNameContentLabel.text = "Humain Shahid"
        fullNameContentLabel.font = UIFont(name: "OpenSans", size: 15)
        fullNameContentLabel.textAlignment = .left
        fullNameContentLabel.textColor = UIColor.black.withAlphaComponent(0.6)
        fullNameContentLabel.lineBreakMode = .byWordWrapping
        fullNameContentLabel.numberOfLines = 0
        
        addressLabel.text = "Address"
        addressLabel.font = UIFont(name: "OpenSans-bold", size: 16)
        addressLabel.textAlignment = .left
        addressLabel.textColor = UIColor.black.withAlphaComponent(0.8)
        addressLabel.lineBreakMode = .byWordWrapping
        addressLabel.numberOfLines = 0
        
        addressContentLabel.text = "312/9 Lo Sieu Street, 13 Ward, District 11, Ho Chi Minh City"
        addressContentLabel.font = UIFont(name: "OpenSans", size: 15)
        addressContentLabel.textAlignment = .left
        addressContentLabel.textColor = UIColor.black.withAlphaComponent(0.6)
        addressContentLabel.lineBreakMode = .byWordWrapping
        addressContentLabel.numberOfLines = 0
        
        trnLabel.text = "TRN"
        trnLabel.font = UIFont(name: "OpenSans-bold", size: 16)
        trnLabel.textAlignment = .left
        trnLabel.textColor = UIColor.black.withAlphaComponent(0.8)
        trnLabel.lineBreakMode = .byWordWrapping
        trnLabel.numberOfLines = 0
        
        trnContentLabel.text = "123-123-123"
        trnContentLabel.font = UIFont(name: "OpenSans", size: 15)
        trnContentLabel.textAlignment = .left
        trnContentLabel.textColor = UIColor.black.withAlphaComponent(0.6)
        trnContentLabel.lineBreakMode = .byWordWrapping
        trnContentLabel.numberOfLines = 0
        
        idLabel.text = "ID"
        idLabel.font = UIFont(name: "OpenSans-bold", size: 16)
        idLabel.textAlignment = .left
        idLabel.textColor = UIColor.black.withAlphaComponent(0.8)
        idLabel.lineBreakMode = .byWordWrapping
        idLabel.numberOfLines = 0
        
        idContentLabel.text = "National - 12312312"
        idContentLabel.font = UIFont(name: "OpenSans", size: 15)
        idContentLabel.textAlignment = .left
        idContentLabel.textColor = UIColor.black.withAlphaComponent(0.6)
        idContentLabel.lineBreakMode = .byWordWrapping
        idContentLabel.numberOfLines = 0
        
        employerLabel.text = "Employer"
        employerLabel.font = UIFont(name: "OpenSans-bold", size: 16)
        employerLabel.textAlignment = .left
        employerLabel.textColor = UIColor.black.withAlphaComponent(0.8)
        employerLabel.lineBreakMode = .byWordWrapping
        employerLabel.numberOfLines = 0
        
        employerContentLabel.text = ""
        employerContentLabel.font = UIFont(name: "OpenSans", size: 15)
        employerContentLabel.textAlignment = .left
        employerContentLabel.textColor = UIColor.black.withAlphaComponent(0.6)
        employerContentLabel.lineBreakMode = .byWordWrapping
        employerContentLabel.numberOfLines = 0
        
        occupationLabel.text = "Occupation"
        occupationLabel.font = UIFont(name: "OpenSans-bold", size: 16)
        occupationLabel.textAlignment = .left
        occupationLabel.textColor = UIColor.black.withAlphaComponent(0.8)
        occupationLabel.lineBreakMode = .byWordWrapping
        occupationLabel.numberOfLines = 0
        
        occupationContentLabel.text = "Business Man"
        occupationContentLabel.font = UIFont(name: "OpenSans", size: 15)
        occupationContentLabel.textAlignment = .left
        occupationContentLabel.textColor = UIColor.black.withAlphaComponent(0.6)
        occupationContentLabel.lineBreakMode = .byWordWrapping
        occupationContentLabel.numberOfLines = 0
        
        netIncomeLabel.text = "Net Income"
        netIncomeLabel.font = UIFont(name: "OpenSans-bold", size: 16)
        netIncomeLabel.textAlignment = .left
        netIncomeLabel.textColor = UIColor.black.withAlphaComponent(0.8)
        netIncomeLabel.lineBreakMode = .byWordWrapping
        netIncomeLabel.numberOfLines = 0
        
        netIncomeContentLabel.text = "$20000"
        netIncomeContentLabel.font = UIFont(name: "OpenSans", size: 15)
        netIncomeContentLabel.textAlignment = .left
        netIncomeContentLabel.textColor = UIColor.black.withAlphaComponent(0.6)
        netIncomeContentLabel.lineBreakMode = .byWordWrapping
        netIncomeContentLabel.numberOfLines = 0
        
        referenceLabel.text = "Reference"
        referenceLabel.font = UIFont(name: "OpenSans-bold", size: 16)
        referenceLabel.textAlignment = .left
        referenceLabel.textColor = UIColor.black.withAlphaComponent(0.8)
        referenceLabel.lineBreakMode = .byWordWrapping
        referenceLabel.numberOfLines = 0
        
        referenceContentLabel.text = "Humain"
        referenceContentLabel.font = UIFont(name: "OpenSans", size: 15)
        referenceContentLabel.textAlignment = .left
        referenceContentLabel.textColor = UIColor.black.withAlphaComponent(0.6)
        referenceContentLabel.lineBreakMode = .byWordWrapping
        referenceContentLabel.numberOfLines = 0
        
        nextOfSkinLabel.text = "Next of Skin"
        nextOfSkinLabel.font = UIFont(name: "OpenSans-bold", size: 16)
        nextOfSkinLabel.textAlignment = .left
        nextOfSkinLabel.textColor = UIColor.black.withAlphaComponent(0.8)
        nextOfSkinLabel.lineBreakMode = .byWordWrapping
        nextOfSkinLabel.numberOfLines = 0
        
        nextOfSkinContentLabel.text = "Haider"
        nextOfSkinContentLabel.font = UIFont(name: "OpenSans", size: 15)
        nextOfSkinContentLabel.textAlignment = .left
        nextOfSkinContentLabel.textColor = UIColor.black.withAlphaComponent(0.6)
        nextOfSkinContentLabel.lineBreakMode = .byWordWrapping
        nextOfSkinContentLabel.numberOfLines = 0
        
        containerView.addSubview(titleLabel)
        containerView.addSubview(numberPageLabel) 
        containerView.addSubview(fullNameLabel)
        containerView.addSubview(fullNameContentLabel)
        containerView.addSubview(addressLabel)
        containerView.addSubview(addressContentLabel)
        containerView.addSubview(trnLabel)
        containerView.addSubview(trnContentLabel)
        containerView.addSubview(idLabel)
        containerView.addSubview(idContentLabel)
        containerView.addSubview(employerLabel)
        containerView.addSubview(employerContentLabel)
        containerView.addSubview(occupationLabel)
        containerView.addSubview(occupationContentLabel)
        containerView.addSubview(netIncomeLabel)
        containerView.addSubview(netIncomeContentLabel)
        containerView.addSubview(referenceLabel)
        containerView.addSubview(referenceContentLabel)
        containerView.addSubview(nextOfSkinLabel)
        containerView.addSubview(nextOfSkinContentLabel)
        
        scrollView.addSubview(containerView)
        addSubview(scrollView)
        setNeedsUpdateConstraints()
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        if !constraintsAdded {
            constraintsAdded = true
            
            scrollView.autoPinEdgesToSuperviewEdges()

            containerView.autoPinEdgesToSuperviewEdges()
            containerView.autoMatch(.width, to: .width, of: self)
            
            let alpha: CGFloat = 20
            
            titleLabel.autoPinEdge(toSuperviewEdge: .top, withInset: 10)
            titleLabel.autoPinEdge(toSuperviewEdge: .left, withInset: 10)
            titleLabel.autoPinEdge(.right, to: .left, of: numberPageLabel, withOffset: 10)
            
            numberPageLabel.autoPinEdge(toSuperviewEdge: .top, withInset: 10)
            numberPageLabel.autoPinEdge(toSuperviewEdge: .right, withInset: 10)
            numberPageLabel.autoSetDimensions(to: CGSize(width: 50, height: 30))
            
            fullNameLabel.autoPinEdge(.top, to: .top, of: fullNameContentLabel)
            fullNameLabel.autoPinEdge(toSuperviewEdge: .left, withInset: alpha)
            fullNameLabel.autoSetDimension(.width, toSize: 100)
            
            fullNameContentLabel.autoPinEdge(.top, to: .bottom, of: titleLabel, withOffset: 20)
            fullNameContentLabel.autoPinEdge(.left, to: .right, of: fullNameLabel, withOffset: 10)
            fullNameContentLabel.autoPinEdge(toSuperviewEdge: .right, withInset: alpha)
            fullNameContentLabel.autoSetDimension(.height, toSize: 20)

            addressLabel.autoPinEdge(.top, to: .top, of: addressContentLabel)
            addressLabel.autoPinEdge(toSuperviewEdge: .left, withInset: alpha)
            addressLabel.autoSetDimension(.width, toSize: 100)
            
            addressContentLabel.autoPinEdge(.top, to: .bottom, of: fullNameContentLabel, withOffset: 10)
            addressContentLabel.autoPinEdge(.left, to: .right, of: addressLabel, withOffset: 10)
            addressContentLabel.autoPinEdge(toSuperviewEdge: .right, withInset: alpha)
            addressContentLabel.autoSetDimension(.height, toSize: 20)

            trnLabel.autoPinEdge(.top, to: .top, of: trnContentLabel)
            trnLabel.autoPinEdge(toSuperviewEdge: .left, withInset: alpha)
            trnLabel.autoSetDimension(.width, toSize: 100)
            
            trnContentLabel.autoPinEdge(.top, to: .bottom, of: addressContentLabel, withOffset: 10)
            trnContentLabel.autoPinEdge(.left, to: .right, of: trnLabel, withOffset: 10)
            trnContentLabel.autoPinEdge(toSuperviewEdge: .right, withInset: alpha)
            trnContentLabel.autoSetDimension(.height, toSize: 20)

            idLabel.autoPinEdge(.top, to: .top, of: idContentLabel)
            idLabel.autoPinEdge(toSuperviewEdge: .left, withInset: alpha)
            idLabel.autoSetDimension(.width, toSize: 100)
            
            idContentLabel.autoPinEdge(.top, to: .bottom, of: trnContentLabel, withOffset: 10)
            idContentLabel.autoPinEdge(.left, to: .right, of: idLabel, withOffset: 10)
            idContentLabel.autoPinEdge(toSuperviewEdge: .right, withInset: alpha)
            idContentLabel.autoSetDimension(.height, toSize: 20)

            employerLabel.autoPinEdge(.top, to: .top, of: employerContentLabel)
            employerLabel.autoPinEdge(toSuperviewEdge: .left, withInset: alpha)
            employerLabel.autoSetDimension(.width, toSize: 100)
            
            employerContentLabel.autoPinEdge(.top, to: .bottom, of: idContentLabel, withOffset: 10)
            employerContentLabel.autoPinEdge(.left, to: .right, of: employerLabel, withOffset: 10)
            employerContentLabel.autoPinEdge(toSuperviewEdge: .right, withInset: alpha)
            employerContentLabel.autoSetDimension(.height, toSize: 20)
            
            occupationLabel.autoPinEdge(.top, to: .top, of: occupationContentLabel)
            occupationLabel.autoPinEdge(toSuperviewEdge: .left, withInset: alpha)
            occupationLabel.autoSetDimension(.width, toSize: 100)
            
            occupationContentLabel.autoPinEdge(.top, to: .bottom, of: employerContentLabel, withOffset: 10)
            occupationContentLabel.autoPinEdge(.left, to: .right, of: occupationLabel, withOffset: 10)
            occupationContentLabel.autoPinEdge(toSuperviewEdge: .right, withInset: alpha)
            occupationContentLabel.autoSetDimension(.height, toSize: 20)

            netIncomeLabel.autoPinEdge(.top, to: .top, of: netIncomeContentLabel)
            netIncomeLabel.autoPinEdge(toSuperviewEdge: .left, withInset: alpha)
            netIncomeLabel.autoSetDimension(.width, toSize: 100)
            
            netIncomeContentLabel.autoPinEdge(.top, to: .bottom, of: occupationContentLabel, withOffset: 10)
            netIncomeContentLabel.autoPinEdge(.left, to: .right, of: netIncomeLabel, withOffset: 10)
            netIncomeContentLabel.autoPinEdge(toSuperviewEdge: .right, withInset: alpha)
            netIncomeContentLabel.autoSetDimension(.height, toSize: 20)

            referenceLabel.autoPinEdge(.top, to: .top, of: referenceContentLabel)
            referenceLabel.autoPinEdge(toSuperviewEdge: .left, withInset: alpha)
            referenceLabel.autoSetDimension(.width, toSize: 100)
            
            referenceContentLabel.autoPinEdge(.top, to: .bottom, of: netIncomeContentLabel, withOffset: 10)
            referenceContentLabel.autoPinEdge(.left, to: .right, of: referenceLabel, withOffset: 10)
            referenceContentLabel.autoPinEdge(toSuperviewEdge: .right, withInset: alpha)
            referenceContentLabel.autoSetDimension(.height, toSize: 20)

            nextOfSkinLabel.autoPinEdge(.top, to: .top, of: nextOfSkinContentLabel)
            nextOfSkinLabel.autoPinEdge(toSuperviewEdge: .left, withInset: alpha)
            nextOfSkinLabel.autoSetDimension(.width, toSize: 100)
            
            nextOfSkinContentLabel.autoPinEdge(.top, to: .bottom, of: referenceContentLabel, withOffset: 10)
            nextOfSkinContentLabel.autoPinEdge(.left, to: .right, of: nextOfSkinLabel, withOffset: 10)
            nextOfSkinContentLabel.autoPinEdge(toSuperviewEdge: .right, withInset: alpha)
            nextOfSkinContentLabel.autoSetDimension(.height, toSize: 20)
        }
    }
}
