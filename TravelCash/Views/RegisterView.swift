//
//  RegisterView.swift
//  TravelCash
//
//  Created by Thanh-Tam Le on 6/14/17.
//  Copyright © 2017 Tam. All rights reserved.
//

import UIKit
import FRHyperLabel

class RegisterView: UIView {

    var constraintsAdded = false
    
    let scrollView = UIScrollView()
    let containerView = UIView()
    
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
    
    let passwordField = UITextField()
    let passwordBorder = UIView()
    
    let confirmPasswordField = UITextField()
    let confirmPasswordBorder = UIView()
    
    let termsAndPrivacyLabel = FRHyperLabel()
    
    let nextButton = UIButton()
    
    let termsAndConditionsURL = "http://www.example.com/terms";
    let privacyURL = "http://www.example.com/privacy";
    
    convenience init() {
        self.init(frame: .zero)
        
        backgroundColor = UIColor.white
        tintColor = Global.colorMain
        addTapToDismiss()
        
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.bounces = true
        
        errorLabel.font = UIFont(name: "OpenSans", size: 14)
        errorLabel.textAlignment = .center
        errorLabel.textColor = UIColor.red.withAlphaComponent(0.7)
        errorLabel.adjustsFontSizeToFitWidth = true
        
        firstNameField.textAlignment = .left
        firstNameField.placeholder = "First Name"
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
        surNameField.placeholder = "Surname"
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
        trnField.placeholder = "TRN"
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
        emailField.placeholder = "Email"
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
        phoneNumberField.placeholder = "Phone Number"
        phoneNumberField.textColor = UIColor.black
        phoneNumberField.returnKeyType = .next
        phoneNumberField.keyboardType = .phonePad
        phoneNumberField.inputAccessoryView = UIView()
        phoneNumberField.autocorrectionType = .no
        phoneNumberField.autocapitalizationType = .none
        phoneNumberField.font = UIFont(name: "OpenSans", size: 17)
        phoneNumberBorder.backgroundColor = Global.colorSeparator
        phoneNumberField.addSubview(phoneNumberBorder)
        
        passwordField.textAlignment = .left
        passwordField.placeholder = "Password"
        passwordField.textColor = UIColor.black
        passwordField.returnKeyType = .next
        passwordField.keyboardType = .default
        passwordField.isSecureTextEntry = true
        passwordField.inputAccessoryView = UIView()
        passwordField.autocorrectionType = .no
        passwordField.autocapitalizationType = .none
        passwordField.font = UIFont(name: "OpenSans", size: 17)
        passwordBorder.backgroundColor = Global.colorSeparator
        passwordField.addSubview(passwordBorder)
        
        confirmPasswordField.textAlignment = .left
        confirmPasswordField.placeholder = "Confirm Password"
        confirmPasswordField.textColor = UIColor.black
        confirmPasswordField.returnKeyType = .done
        confirmPasswordField.keyboardType = .default
        confirmPasswordField.isSecureTextEntry = true
        confirmPasswordField.inputAccessoryView = UIView()
        confirmPasswordField.autocorrectionType = .no
        confirmPasswordField.autocapitalizationType = .none
        confirmPasswordField.font = UIFont(name: "OpenSans", size: 17)
        confirmPasswordBorder.backgroundColor = Global.colorSeparator
        confirmPasswordField.addSubview(confirmPasswordBorder)
        
        nextButton.setTitle("NEXT", for: .normal)
        nextButton.backgroundColor = Global.colorNewUser
        nextButton.setTitleColor(UIColor.white, for: .normal)
        nextButton.setTitleColor(Global.colorMain, for: .highlighted)
        nextButton.layer.cornerRadius = 5
        nextButton.titleLabel?.font = UIFont(name: "OpenSans-semibold", size: 15)
        nextButton.clipsToBounds = true
        
        termsAndPrivacyLabel.font = UIFont(name: "OpenSans", size: 16)
        termsAndPrivacyLabel.textAlignment = .center
        termsAndPrivacyLabel.textColor = UIColor.gray.withAlphaComponent(0.8)
        termsAndPrivacyLabel.numberOfLines = 0
        
        let str = "By using this app you agree to Terms of Use and Privacy Policy"
        let attributes: [String : Any] = [NSFontAttributeName: UIFont.preferredFont(forTextStyle: .headline)]
        termsAndPrivacyLabel.attributedText = NSAttributedString(string: str, attributes: attributes)
        
        containerView.addSubview(errorLabel)
        containerView.addSubview(firstNameField)
        containerView.addSubview(surNameField)
        containerView.addSubview(trnField)
        containerView.addSubview(emailField)
        containerView.addSubview(phoneNumberField)
        containerView.addSubview(passwordField)
        containerView.addSubview(confirmPasswordField)
        containerView.addSubview(nextButton)
        containerView.addSubview(termsAndPrivacyLabel)

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
            
            errorLabel.autoPinEdge(toSuperviewEdge: .top, withInset: 10)
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
            
            emailField.autoPinEdge(.top, to: .bottom, of: trnField, withOffset: 20)
            emailField.autoPinEdge(toSuperviewEdge: .left, withInset: alpha)
            emailField.autoPinEdge(toSuperviewEdge: .right, withInset: alpha)
            emailField.autoSetDimension(.height, toSize: 40)
            
            emailBorder.autoPinEdge(toSuperviewEdge: .left)
            emailBorder.autoPinEdge(toSuperviewEdge: .right)
            emailBorder.autoPinEdge(toSuperviewEdge: .bottom)
            emailBorder.autoSetDimension(.height, toSize: 0.7)
            
            phoneNumberField.autoPinEdge(.top, to: .bottom, of: emailField, withOffset: 20)
            phoneNumberField.autoPinEdge(toSuperviewEdge: .left, withInset: alpha)
            phoneNumberField.autoPinEdge(toSuperviewEdge: .right, withInset: alpha)
            phoneNumberField.autoSetDimension(.height, toSize: 40)
            
            phoneNumberBorder.autoPinEdge(toSuperviewEdge: .left)
            phoneNumberBorder.autoPinEdge(toSuperviewEdge: .right)
            phoneNumberBorder.autoPinEdge(toSuperviewEdge: .bottom)
            phoneNumberBorder.autoSetDimension(.height, toSize: 0.7)
            
            passwordField.autoPinEdge(.top, to: .bottom, of: phoneNumberField, withOffset: 20)
            passwordField.autoPinEdge(toSuperviewEdge: .left, withInset: alpha)
            passwordField.autoPinEdge(toSuperviewEdge: .right, withInset: alpha)
            passwordField.autoSetDimension(.height, toSize: 40)
            
            passwordBorder.autoPinEdge(toSuperviewEdge: .left)
            passwordBorder.autoPinEdge(toSuperviewEdge: .right)
            passwordBorder.autoPinEdge(toSuperviewEdge: .bottom)
            passwordBorder.autoSetDimension(.height, toSize: 0.7)
            
            confirmPasswordField.autoPinEdge(.top, to: .bottom, of: passwordField, withOffset: 20)
            confirmPasswordField.autoPinEdge(toSuperviewEdge: .left, withInset: alpha)
            confirmPasswordField.autoPinEdge(toSuperviewEdge: .right, withInset: alpha)
            confirmPasswordField.autoSetDimension(.height, toSize: 40)
            
            confirmPasswordBorder.autoPinEdge(toSuperviewEdge: .left)
            confirmPasswordBorder.autoPinEdge(toSuperviewEdge: .right)
            confirmPasswordBorder.autoPinEdge(toSuperviewEdge: .bottom)
            confirmPasswordBorder.autoSetDimension(.height, toSize: 0.7)
            
            termsAndPrivacyLabel.autoPinEdge(.top, to: .bottom, of: confirmPasswordField, withOffset: 10)
            termsAndPrivacyLabel.autoPinEdge(toSuperviewEdge: .left, withInset: alpha)
            termsAndPrivacyLabel.autoPinEdge(toSuperviewEdge: .right, withInset: alpha)
            
            nextButton.autoPinEdge(.top, to: .bottom, of: termsAndPrivacyLabel, withOffset: 30)
            nextButton.autoPinEdge(toSuperviewEdge: .left, withInset: alpha + 10)
            nextButton.autoPinEdge(toSuperviewEdge: .right, withInset: alpha + 10)
            nextButton.autoSetDimension(.height, toSize: 45)
        }
    }
}
