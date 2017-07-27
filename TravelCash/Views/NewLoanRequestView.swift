//
//  NewLoanRequestView.swift
//  TravelCash
//
//  Created by Thanh-Tam Le on 6/15/17.
//  Copyright © 2017 Tam. All rights reserved.
//

import UIKit
import DropDown

class NewLoanRequestView: UIView {

    var constraintsAdded = false
    
    let scrollView = UIScrollView()
    let containerView = UIView()
    
    let titleLabel = UILabel()
    
    let errorLabel = UILabel()
    
    let firstNameField = UITextField()
    let firstNameBorder = UIView()
    
    let surNameField = UITextField()
    let surNameBorder = UIView()
    
    let trnField = UITextField()
    let trnBorder = UIView()
    
    let emailField = UITextField()
    let emailBorder = UIView()
    
    let phoneNumberField = UITextField()
    let phoneNumberBorder = UIView()
    
    let addressFirstField = UITextField()
    let addressFirstBorder = UIView()
    
    let addressSecondField = UITextField()
    let addressSecondBorder = UIView()
    
    let parishField = UITextField()
    let parishBorder = UIView()
    let arrowDropDownView = UIView()
    let arrowDropDownImgView = UIImageView()
    let parishAbstract = UIView()
    let parishDropDown = DropDown()
    
    let loanRequestAmountField = UITextField()
    let loanRequestAmountBorder = UIView()
    
    let documentFirstField = UITextField()
    let documentFirstBorder = UIView()
    let documentFirstView = UIView()
    
    let documentSecondField = UITextField()
    let documentSecondBorder = UIView()
    let documentSecondView = UIView()
    
    let documentThirdField = UITextField()
    let documentThirdBorder = UIView()
    let documentThirdView = UIView()
    
    let documentFourthField = UITextField()
    let documentFourthBorder = UIView()
    let documentFourthView = UIView()
    
    let documentFifthField = UITextField()
    let documentFifthBorder = UIView()
    let documentFifthView = UIView()

    let submitButton = UIButton()
        
    var currentDocument: UITextField!

    convenience init() {
        self.init(frame: .zero)
        
        backgroundColor = UIColor.white
        tintColor = Global.colorMain
        addTapToDismiss()
        
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.bounces = true
        
        titleLabel.text = "Fill in the basics and we will get right back to you about your loan request"
        titleLabel.font = UIFont(name: "OpenSans", size: 16)
        titleLabel.textAlignment = .center
        titleLabel.textColor = UIColor.black.withAlphaComponent(0.8)
        titleLabel.lineBreakMode = .byWordWrapping
        titleLabel.numberOfLines = 0
        
        errorLabel.font = UIFont(name: "OpenSans", size: 14)
        errorLabel.textAlignment = .center
        errorLabel.textColor = UIColor.red.withAlphaComponent(0.7)
        errorLabel.adjustsFontSizeToFitWidth = true
        
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
        
        surNameField.textAlignment = .left
        surNameField.placeholder = "Surname*"
        surNameField.textColor = UIColor.black
        surNameField.returnKeyType = .next
        surNameField.keyboardType = .namePhonePad
        surNameField.inputAccessoryView = UIView()
        surNameField.autocorrectionType = .no
        surNameField.autocapitalizationType = .none
        surNameField.font = UIFont(name: "OpenSans", size: 17)
        surNameBorder.backgroundColor = Global.colorSeparator
        surNameField.addSubview(surNameBorder)
        
        trnField.textAlignment = .left
        trnField.placeholder = "TRN*"
        trnField.textColor = UIColor.black
        trnField.returnKeyType = .next
        trnField.keyboardType = .phonePad
        trnField.inputAccessoryView = UIView()
        trnField.autocorrectionType = .no
        trnField.autocapitalizationType = .none
        trnField.font = UIFont(name: "OpenSans", size: 17)
        trnBorder.backgroundColor = Global.colorSeparator
        trnField.addSubview(trnBorder)
        
        emailField.textAlignment = .left
        emailField.placeholder = "Email*"
        emailField.textColor = UIColor.black
        emailField.returnKeyType = .next
        emailField.keyboardType = .emailAddress
        emailField.inputAccessoryView = UIView()
        emailField.autocorrectionType = .no
        emailField.autocapitalizationType = .none
        emailField.font = UIFont(name: "OpenSans", size: 17)
        emailBorder.backgroundColor = Global.colorSeparator
        emailField.addSubview(emailBorder)
        
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
        
        addressFirstField.textAlignment = .left
        addressFirstField.placeholder = "Address 1*"
        addressFirstField.textColor = UIColor.black
        addressFirstField.returnKeyType = .next
        addressFirstField.keyboardType = .namePhonePad
        addressFirstField.inputAccessoryView = UIView()
        addressFirstField.autocorrectionType = .no
        addressFirstField.autocapitalizationType = .none
        addressFirstField.font = UIFont(name: "OpenSans", size: 17)
        addressFirstBorder.backgroundColor = Global.colorSeparator
        addressFirstField.addSubview(addressFirstBorder)
        
        addressSecondField.textAlignment = .left
        addressSecondField.placeholder = "Address 2"
        addressSecondField.textColor = UIColor.black
        addressSecondField.returnKeyType = .next
        addressSecondField.keyboardType = .namePhonePad
        addressSecondField.inputAccessoryView = UIView()
        addressSecondField.autocorrectionType = .no
        addressSecondField.autocapitalizationType = .none
        addressSecondField.font = UIFont(name: "OpenSans", size: 17)
        addressSecondBorder.backgroundColor = Global.colorSeparator
        addressSecondField.addSubview(addressSecondBorder)
        
        parishField.textAlignment = .left
        parishField.placeholder = "Parish*"
        parishField.textColor = UIColor.black
        parishField.returnKeyType = .next
        parishField.keyboardType = .phonePad
        parishField.inputAccessoryView = UIView()
        parishField.autocorrectionType = .no
        parishField.autocapitalizationType = .none
        parishField.font = UIFont(name: "OpenSans", size: 17)
        parishBorder.backgroundColor = Global.colorSeparator
        parishField.addSubview(parishBorder)
        parishAbstract.backgroundColor = UIColor.clear
        arrowDropDownView.backgroundColor = UIColor.white
        arrowDropDownView.addSubview(arrowDropDownImgView)
        parishField.addSubview(arrowDropDownView)
        parishField.addSubview(parishAbstract)
        
        arrowDropDownImgView.clipsToBounds = true
        arrowDropDownImgView.contentMode = .scaleAspectFit
        arrowDropDownImgView.image = UIImage(named: "ic_arrow_drop_down")
        
        parishDropDown.anchorView = parishBorder
        parishDropDown.direction = .bottom
        parishDropDown.bottomOffset = CGPoint(x: 0, y: 1)
        parishDropDown.selectionAction = { [unowned self] (index, item) in
            self.parishField.text = item
        }
        
        loanRequestAmountField.textAlignment = .left
        loanRequestAmountField.placeholder = "Loan Request Amount*"
        loanRequestAmountField.textColor = UIColor.black
        loanRequestAmountField.returnKeyType = .next
        loanRequestAmountField.keyboardType = .phonePad
        loanRequestAmountField.inputAccessoryView = UIView()
        loanRequestAmountField.autocorrectionType = .no
        loanRequestAmountField.autocapitalizationType = .none
        loanRequestAmountField.font = UIFont(name: "OpenSans", size: 17)
        loanRequestAmountBorder.backgroundColor = Global.colorSeparator
        loanRequestAmountField.addSubview(loanRequestAmountBorder)
        
        documentFirstField.textAlignment = .left
        documentFirstField.placeholder = "Document 1"
        documentFirstField.textColor = UIColor.black
        documentFirstField.inputAccessoryView = UIView()
        documentFirstField.font = UIFont(name: "OpenSans", size: 17)
        documentFirstBorder.backgroundColor = Global.colorSeparator
        documentFirstField.addSubview(documentFirstBorder)
        documentFirstField.addSubview(documentFirstView)
        
        documentSecondField.textAlignment = .left
        documentSecondField.placeholder = "Document 2"
        documentSecondField.textColor = UIColor.black
        documentSecondField.inputAccessoryView = UIView()
        documentSecondField.font = UIFont(name: "OpenSans", size: 17)
        documentSecondBorder.backgroundColor = Global.colorSeparator
        documentSecondField.addSubview(documentSecondBorder)
        documentSecondField.addSubview(documentSecondView)
        
        documentThirdField.textAlignment = .left
        documentThirdField.placeholder = "Document 3"
        documentThirdField.textColor = UIColor.black
        documentThirdField.inputAccessoryView = UIView()
        documentThirdField.font = UIFont(name: "OpenSans", size: 17)
        documentThirdBorder.backgroundColor = Global.colorSeparator
        documentThirdField.addSubview(documentThirdBorder)
        documentThirdField.addSubview(documentThirdView)
        
        documentFourthField.textAlignment = .left
        documentFourthField.placeholder = "Document 4"
        documentFourthField.textColor = UIColor.black
        documentFourthField.inputAccessoryView = UIView()
        documentFourthField.font = UIFont(name: "OpenSans", size: 17)
        documentFourthBorder.backgroundColor = Global.colorSeparator
        documentFourthField.addSubview(documentFourthBorder)
        documentFourthField.addSubview(documentFourthView)
        
        documentFifthField.textAlignment = .left
        documentFifthField.placeholder = "Document 5"
        documentFifthField.textColor = UIColor.black
        documentFifthField.inputAccessoryView = UIView()
        documentFifthField.font = UIFont(name: "OpenSans", size: 17)
        documentFifthBorder.backgroundColor = Global.colorSeparator
        documentFifthField.addSubview(documentFifthBorder)
        documentFifthField.addSubview(documentFifthView)
        
        submitButton.setTitle("SUBMIT REQUEST", for: .normal)
        submitButton.backgroundColor = Global.colorNewUser
        submitButton.setTitleColor(UIColor.white, for: .normal)
        submitButton.setTitleColor(Global.colorMain, for: .highlighted)
        submitButton.layer.cornerRadius = 5
        submitButton.titleLabel?.font = UIFont(name: "OpenSans-semibold", size: 15)
        submitButton.clipsToBounds = true
        
        containerView.addSubview(titleLabel)
        containerView.addSubview(errorLabel)
        containerView.addSubview(firstNameField)
        containerView.addSubview(surNameField)
        containerView.addSubview(trnField)
        containerView.addSubview(phoneNumberField)
        containerView.addSubview(emailField)
        containerView.addSubview(addressFirstField)
        containerView.addSubview(addressSecondField)
        containerView.addSubview(parishField)
        containerView.addSubview(loanRequestAmountField)
        containerView.addSubview(documentFirstField)
        containerView.addSubview(documentSecondField)
        containerView.addSubview(documentThirdField)
        containerView.addSubview(documentFourthField)
        containerView.addSubview(documentFifthField)
        containerView.addSubview(submitButton)
        
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
            
            let alpha: CGFloat = 40
            
            titleLabel.autoPinEdge(toSuperviewEdge: .top, withInset: 10)
            titleLabel.autoPinEdge(toSuperviewEdge: .left, withInset: 10)
            titleLabel.autoPinEdge(toSuperviewEdge: .right, withInset: 10)
            
            errorLabel.autoPinEdge(.top, to: .bottom, of: titleLabel, withOffset: 10)
            errorLabel.autoPinEdge(toSuperviewEdge: .left, withInset: 10)
            errorLabel.autoPinEdge(toSuperviewEdge: .right, withInset: 10)
            errorLabel.autoSetDimension(.height, toSize: 20)
            
            firstNameField.autoPinEdge(.top, to: .bottom, of: errorLabel, withOffset: 10)
            firstNameField.autoPinEdge(toSuperviewEdge: .left, withInset: alpha)
            firstNameField.autoPinEdge(toSuperviewEdge: .right, withInset: alpha)
            firstNameField.autoSetDimension(.height, toSize: 40)
            
            firstNameBorder.autoPinEdge(toSuperviewEdge: .left)
            firstNameBorder.autoPinEdge(toSuperviewEdge: .right)
            firstNameBorder.autoPinEdge(toSuperviewEdge: .bottom)
            firstNameBorder.autoSetDimension(.height, toSize: 0.7)
            
            surNameField.autoPinEdge(.top, to: .bottom, of: firstNameField, withOffset: 20)
            surNameField.autoPinEdge(toSuperviewEdge: .left, withInset: alpha)
            surNameField.autoPinEdge(toSuperviewEdge: .right, withInset: alpha)
            surNameField.autoSetDimension(.height, toSize: 40)
            
            surNameBorder.autoPinEdge(toSuperviewEdge: .left)
            surNameBorder.autoPinEdge(toSuperviewEdge: .right)
            surNameBorder.autoPinEdge(toSuperviewEdge: .bottom)
            surNameBorder.autoSetDimension(.height, toSize: 0.7)
            
            trnField.autoPinEdge(.top, to: .bottom, of: surNameField, withOffset: 20)
            trnField.autoPinEdge(toSuperviewEdge: .left, withInset: alpha)
            trnField.autoPinEdge(toSuperviewEdge: .right, withInset: alpha)
            trnField.autoSetDimension(.height, toSize: 40)
            
            trnBorder.autoPinEdge(toSuperviewEdge: .left)
            trnBorder.autoPinEdge(toSuperviewEdge: .right)
            trnBorder.autoPinEdge(toSuperviewEdge: .bottom)
            trnBorder.autoSetDimension(.height, toSize: 0.7)
            
            phoneNumberField.autoPinEdge(.top, to: .bottom, of: trnField, withOffset: 20)
            phoneNumberField.autoPinEdge(toSuperviewEdge: .left, withInset: alpha)
            phoneNumberField.autoPinEdge(toSuperviewEdge: .right, withInset: alpha)
            phoneNumberField.autoSetDimension(.height, toSize: 40)
            
            phoneNumberBorder.autoPinEdge(toSuperviewEdge: .left)
            phoneNumberBorder.autoPinEdge(toSuperviewEdge: .right)
            phoneNumberBorder.autoPinEdge(toSuperviewEdge: .bottom)
            phoneNumberBorder.autoSetDimension(.height, toSize: 0.7)
            
            emailField.autoPinEdge(.top, to: .bottom, of: phoneNumberField, withOffset: 20)
            emailField.autoPinEdge(toSuperviewEdge: .left, withInset: alpha)
            emailField.autoPinEdge(toSuperviewEdge: .right, withInset: alpha)
            emailField.autoSetDimension(.height, toSize: 40)
            
            emailBorder.autoPinEdge(toSuperviewEdge: .left)
            emailBorder.autoPinEdge(toSuperviewEdge: .right)
            emailBorder.autoPinEdge(toSuperviewEdge: .bottom)
            emailBorder.autoSetDimension(.height, toSize: 0.7)
            
            addressFirstField.autoPinEdge(.top, to: .bottom, of: emailField, withOffset: 20)
            addressFirstField.autoPinEdge(toSuperviewEdge: .left, withInset: alpha)
            addressFirstField.autoPinEdge(toSuperviewEdge: .right, withInset: alpha)
            addressFirstField.autoSetDimension(.height, toSize: 40)
            
            addressFirstBorder.autoPinEdge(toSuperviewEdge: .left)
            addressFirstBorder.autoPinEdge(toSuperviewEdge: .right)
            addressFirstBorder.autoPinEdge(toSuperviewEdge: .bottom)
            addressFirstBorder.autoSetDimension(.height, toSize: 0.7)
            
            addressSecondField.autoPinEdge(.top, to: .bottom, of: addressFirstField, withOffset: 20)
            addressSecondField.autoPinEdge(toSuperviewEdge: .left, withInset: alpha)
            addressSecondField.autoPinEdge(toSuperviewEdge: .right, withInset: alpha)
            addressSecondField.autoSetDimension(.height, toSize: 40)
            
            addressSecondBorder.autoPinEdge(toSuperviewEdge: .left)
            addressSecondBorder.autoPinEdge(toSuperviewEdge: .right)
            addressSecondBorder.autoPinEdge(toSuperviewEdge: .bottom)
            addressSecondBorder.autoSetDimension(.height, toSize: 0.7)
            
            parishField.autoPinEdge(.top, to: .bottom, of: addressSecondField, withOffset: 20)
            parishField.autoPinEdge(toSuperviewEdge: .left, withInset: alpha)
            parishField.autoPinEdge(toSuperviewEdge: .right, withInset: alpha)
            parishField.autoSetDimension(.height, toSize: 40)
            
            arrowDropDownView.autoPinEdge(toSuperviewEdge: .right, withInset: 0)
            arrowDropDownView.autoPinEdge(toSuperviewEdge: .top, withInset: 0)
            arrowDropDownView.autoPinEdge(toSuperviewEdge: .bottom, withInset: 1)
            arrowDropDownView.autoSetDimension(.width, toSize: 25)
            
            arrowDropDownImgView.autoPinEdge(toSuperviewEdge: .top, withInset: 12)
            arrowDropDownImgView.autoPinEdge(toSuperviewEdge: .right, withInset: 1)
            arrowDropDownImgView.autoSetDimensions(to: CGSize(width: 25, height: 25))
            
            parishAbstract.autoPinEdgesToSuperviewEdges()
            
            parishBorder.autoPinEdge(toSuperviewEdge: .left)
            parishBorder.autoPinEdge(toSuperviewEdge: .right)
            parishBorder.autoPinEdge(toSuperviewEdge: .bottom)
            parishBorder.autoSetDimension(.height, toSize: 0.7)
            
            loanRequestAmountField.autoPinEdge(.top, to: .bottom, of: parishField, withOffset: 20)
            loanRequestAmountField.autoPinEdge(toSuperviewEdge: .left, withInset: alpha)
            loanRequestAmountField.autoPinEdge(toSuperviewEdge: .right, withInset: alpha)
            loanRequestAmountField.autoSetDimension(.height, toSize: 40)
            
            loanRequestAmountBorder.autoPinEdge(toSuperviewEdge: .left)
            loanRequestAmountBorder.autoPinEdge(toSuperviewEdge: .right)
            loanRequestAmountBorder.autoPinEdge(toSuperviewEdge: .bottom)
            loanRequestAmountBorder.autoSetDimension(.height, toSize: 0.7)
            
            documentFirstField.autoPinEdge(.top, to: .bottom, of: loanRequestAmountField, withOffset: 20)
            documentFirstField.autoPinEdge(toSuperviewEdge: .left, withInset: alpha)
            documentFirstField.autoPinEdge(toSuperviewEdge: .right, withInset: alpha)
            documentFirstField.autoSetDimension(.height, toSize: 40)
            
            documentFirstBorder.autoPinEdge(toSuperviewEdge: .left)
            documentFirstBorder.autoPinEdge(toSuperviewEdge: .right)
            documentFirstBorder.autoPinEdge(toSuperviewEdge: .bottom)
            documentFirstBorder.autoSetDimension(.height, toSize: 0.7)
            
            documentFirstView.autoPinEdgesToSuperviewEdges()
            
            documentSecondField.autoPinEdge(.top, to: .bottom, of: documentFirstField, withOffset: 20)
            documentSecondField.autoPinEdge(toSuperviewEdge: .left, withInset: alpha)
            documentSecondField.autoPinEdge(toSuperviewEdge: .right, withInset: alpha)
            documentSecondField.autoSetDimension(.height, toSize: 40)
            
            documentSecondBorder.autoPinEdge(toSuperviewEdge: .left)
            documentSecondBorder.autoPinEdge(toSuperviewEdge: .right)
            documentSecondBorder.autoPinEdge(toSuperviewEdge: .bottom)
            documentSecondBorder.autoSetDimension(.height, toSize: 0.7)
            
            documentSecondView.autoPinEdgesToSuperviewEdges()
            
            documentThirdField.autoPinEdge(.top, to: .bottom, of: documentSecondField, withOffset: 20)
            documentThirdField.autoPinEdge(toSuperviewEdge: .left, withInset: alpha)
            documentThirdField.autoPinEdge(toSuperviewEdge: .right, withInset: alpha)
            documentThirdField.autoSetDimension(.height, toSize: 40)
            
            documentThirdBorder.autoPinEdge(toSuperviewEdge: .left)
            documentThirdBorder.autoPinEdge(toSuperviewEdge: .right)
            documentThirdBorder.autoPinEdge(toSuperviewEdge: .bottom)
            documentThirdBorder.autoSetDimension(.height, toSize: 0.7)
            
            documentThirdView.autoPinEdgesToSuperviewEdges()
            
            documentFourthField.autoPinEdge(.top, to: .bottom, of: documentThirdField, withOffset: 20)
            documentFourthField.autoPinEdge(toSuperviewEdge: .left, withInset: alpha)
            documentFourthField.autoPinEdge(toSuperviewEdge: .right, withInset: alpha)
            documentFourthField.autoSetDimension(.height, toSize: 40)
            
            documentFourthBorder.autoPinEdge(toSuperviewEdge: .left)
            documentFourthBorder.autoPinEdge(toSuperviewEdge: .right)
            documentFourthBorder.autoPinEdge(toSuperviewEdge: .bottom)
            documentFourthBorder.autoSetDimension(.height, toSize: 0.7)
            
            documentFourthView.autoPinEdgesToSuperviewEdges()
            
            documentFifthField.autoPinEdge(.top, to: .bottom, of: documentFourthField, withOffset: 20)
            documentFifthField.autoPinEdge(toSuperviewEdge: .left, withInset: alpha)
            documentFifthField.autoPinEdge(toSuperviewEdge: .right, withInset: alpha)
            documentFifthField.autoSetDimension(.height, toSize: 40)
            
            documentFifthBorder.autoPinEdge(toSuperviewEdge: .left)
            documentFifthBorder.autoPinEdge(toSuperviewEdge: .right)
            documentFifthBorder.autoPinEdge(toSuperviewEdge: .bottom)
            documentFifthBorder.autoSetDimension(.height, toSize: 0.7)
            
            documentFifthView.autoPinEdgesToSuperviewEdges()
            
            submitButton.autoPinEdge(.top, to: .bottom, of: documentFifthField, withOffset: 30)
            submitButton.autoPinEdge(toSuperviewEdge: .left, withInset: alpha + 10)
            submitButton.autoPinEdge(toSuperviewEdge: .right, withInset: alpha + 10)
            submitButton.autoSetDimension(.height, toSize: 45)
        }
    }
}
