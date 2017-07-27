//
//  FeedbackView.swift
//  TravelCash
//
//  Created by Thanh-Tam Le on 6/22/17.
//  Copyright © 2017 Tam. All rights reserved.
//

import UIKit
import DropDown

class FeedbackView: UIView {
    
    var constraintsAdded = false
    
    let scrollView = UIScrollView()
    let containerView = UIView()
    
    let firstNameField = UITextField()
    let firstNameBorder = UIView()
    
    let surnameField = UITextField()
    let surnameBorder = UIView()
    
    let phoneNumberField = UITextField()
    let phoneNumberBorder = UIView()
    
    let complaintLabel = UILabel()
    let complaintTV = UITextView()
    
    let cancelBtn = UIButton()
    let sendBtn = UIButton()
    
    convenience init() {
        self.init(frame: .zero)
        
        backgroundColor = UIColor.white
        tintColor = Global.colorMain
        addTapToDismiss()
        
        firstNameField.textAlignment = .left
        firstNameField.placeholder = "First Name*"
        firstNameField.textColor = UIColor.black
        firstNameField.returnKeyType = .next
        firstNameField.keyboardType = .namePhonePad
        firstNameField.inputAccessoryView = UIView()
        firstNameField.autocorrectionType = .no
        firstNameField.autocapitalizationType = .none
        firstNameField.font = UIFont(name: "OpenSans", size: 17)
        firstNameBorder.backgroundColor = Global.colorSeparator
        firstNameField.addSubview(firstNameBorder)
        
        surnameField.textAlignment = .left
        surnameField.placeholder = "Surname*"
        surnameField.textColor = UIColor.black
        surnameField.returnKeyType = .next
        surnameField.keyboardType = .namePhonePad
        surnameField.inputAccessoryView = UIView()
        surnameField.autocorrectionType = .no
        surnameField.autocapitalizationType = .none
        surnameField.font = UIFont(name: "OpenSans", size: 17)
        surnameBorder.backgroundColor = Global.colorSeparator
        surnameField.addSubview(surnameBorder)

        phoneNumberField.textAlignment = .left
        phoneNumberField.placeholder = "Phone Number*"
        phoneNumberField.textColor = UIColor.black
        phoneNumberField.returnKeyType = .next
        phoneNumberField.keyboardType = .phonePad
        phoneNumberField.inputAccessoryView = UIView()
        phoneNumberField.autocorrectionType = .no
        phoneNumberField.autocapitalizationType = .none
        phoneNumberField.font = UIFont(name: "OpenSans", size: 17)
        phoneNumberBorder.backgroundColor = Global.colorSeparator
        phoneNumberField.addSubview(phoneNumberBorder)

        complaintLabel.text = "Complaint/Suggestion*"
        complaintLabel.font = UIFont(name: "OpenSans", size: 14)
        complaintLabel.textAlignment = .left
        complaintLabel.textColor = UIColor.black.withAlphaComponent(0.8)
        complaintLabel.lineBreakMode = .byWordWrapping
        complaintLabel.numberOfLines = 0
        
        complaintTV.text = ""
        complaintTV.font = UIFont(name: "OpenSans", size: 14)
        complaintTV.textAlignment = .left
        complaintTV.textColor = UIColor.black
        complaintTV.layer.borderColor = Global.colorSeparator.cgColor
        complaintTV.layer.borderWidth = 0.7
        
        cancelBtn.setTitle("CANCEL", for: .normal)
        cancelBtn.backgroundColor = Global.colorMidBlue
        cancelBtn.setTitleColor(UIColor.white, for: .normal)
        cancelBtn.setTitleColor(Global.colorSelected, for: .highlighted)
        cancelBtn.layer.cornerRadius = 5
        cancelBtn.titleLabel?.font = UIFont(name: "OpenSans-semibold", size: 15)
        cancelBtn.clipsToBounds = true
        cancelBtn.titleLabel?.lineBreakMode = .byWordWrapping
        cancelBtn.titleLabel?.textAlignment = .center
        
        sendBtn.setTitle("SEND", for: .normal)
        sendBtn.backgroundColor = Global.colorMidBlue
        sendBtn.setTitleColor(UIColor.white, for: .normal)
        sendBtn.setTitleColor(Global.colorSelected, for: .highlighted)
        sendBtn.layer.cornerRadius = 5
        sendBtn.titleLabel?.font = UIFont(name: "OpenSans-semibold", size: 15)
        sendBtn.clipsToBounds = true
        sendBtn.titleLabel?.lineBreakMode = .byWordWrapping
        sendBtn.titleLabel?.textAlignment = .center
        
        containerView.addSubview(firstNameField)
        containerView.addSubview(surnameField)
        containerView.addSubview(phoneNumberField)
        containerView.addSubview(complaintLabel)
        containerView.addSubview(complaintTV)
        
        scrollView.addSubview(containerView)
        addSubview(scrollView)
        addSubview(cancelBtn)
        addSubview(sendBtn)
        setNeedsUpdateConstraints()
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        if !constraintsAdded {
            constraintsAdded = true
            
            scrollView.autoPinEdge(toSuperviewEdge: .top, withInset: 0)
            scrollView.autoPinEdge(toSuperviewEdge: .left, withInset: 0)
            scrollView.autoPinEdge(toSuperviewEdge: .right, withInset: 0)
            scrollView.autoPinEdge(.bottom, to: .top, of: cancelBtn, withOffset: -10)
            
            containerView.autoPinEdgesToSuperviewEdges()
            containerView.autoMatch(.width, to: .width, of: self)
            
            let alpha: CGFloat = 20

            firstNameField.autoPinEdge(toSuperviewEdge: .top, withInset: 20)
            firstNameField.autoPinEdge(toSuperviewEdge: .left, withInset: alpha)
            firstNameField.autoPinEdge(toSuperviewEdge: .right, withInset: alpha)
            firstNameField.autoSetDimension(.height, toSize: 40)

            firstNameBorder.autoPinEdge(toSuperviewEdge: .left)
            firstNameBorder.autoPinEdge(toSuperviewEdge: .right)
            firstNameBorder.autoPinEdge(toSuperviewEdge: .bottom)
            firstNameBorder.autoSetDimension(.height, toSize: 0.7)

            surnameField.autoPinEdge(.top, to: .bottom, of: firstNameField, withOffset: 20)
            surnameField.autoPinEdge(toSuperviewEdge: .left, withInset: alpha)
            surnameField.autoPinEdge(toSuperviewEdge: .right, withInset: alpha)
            surnameField.autoSetDimension(.height, toSize: 40)
            
            surnameBorder.autoPinEdge(toSuperviewEdge: .left)
            surnameBorder.autoPinEdge(toSuperviewEdge: .right)
            surnameBorder.autoPinEdge(toSuperviewEdge: .bottom)
            surnameBorder.autoSetDimension(.height, toSize: 0.7)
            
            phoneNumberField.autoPinEdge(.top, to: .bottom, of: surnameField, withOffset: 20)
            phoneNumberField.autoPinEdge(toSuperviewEdge: .left, withInset: alpha)
            phoneNumberField.autoPinEdge(toSuperviewEdge: .right, withInset: alpha)
            phoneNumberField.autoSetDimension(.height, toSize: 40)
            
            phoneNumberBorder.autoPinEdge(toSuperviewEdge: .left)
            phoneNumberBorder.autoPinEdge(toSuperviewEdge: .right)
            phoneNumberBorder.autoPinEdge(toSuperviewEdge: .bottom)
            phoneNumberBorder.autoSetDimension(.height, toSize: 0.7)

            complaintLabel.autoPinEdge(.top, to: .bottom, of: phoneNumberField, withOffset: 20)
            complaintLabel.autoPinEdge(toSuperviewEdge: .left, withInset: alpha)
            complaintLabel.autoPinEdge(toSuperviewEdge: .right, withInset: alpha)
            
            complaintTV.autoPinEdge(.top, to: .bottom, of: complaintLabel, withOffset: 0)
            complaintTV.autoPinEdge(toSuperviewEdge: .left, withInset: alpha)
            complaintTV.autoPinEdge(toSuperviewEdge: .right, withInset: alpha)
            complaintTV.autoSetDimension(.height, toSize: 100)
            
            sendBtn.autoPinEdge(toSuperviewEdge: .bottom, withInset: 10)
            sendBtn.autoPinEdge(toSuperviewEdge: .right, withInset: 10)
            sendBtn.autoSetDimensions(to: CGSize(width: 80, height: 30))
            
            cancelBtn.autoPinEdge(.bottom, to: .bottom, of: sendBtn)
            cancelBtn.autoMatch(.height, to: .height, of: sendBtn)
            cancelBtn.autoMatch(.width, to: .width, of: sendBtn)
            cancelBtn.autoPinEdge(.right, to: .left, of: sendBtn, withOffset: -10)
        }
    }
}
