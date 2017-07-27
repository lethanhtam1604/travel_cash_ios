//
//  LoginView.swift
//  TravelCash
//
//  Created by Thanh-Tam Le on 6/14/17.
//  Copyright © 2017 Tam. All rights reserved.
//

import UIKit

class LoginView: UIView {

    var constraintsAdded = false
    
    let scrollView = UIScrollView()
    let containerView = UIView()
    
    let errorLabel = UILabel()

    let trnField = UITextField()
    let trnBorder = UIView()

    let passwordField = UITextField()
    let passwordBorder = UIView()

    let signInButton = UIButton()
    let forgotButton = UIButton()
    
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

        passwordField.textAlignment = .left
        passwordField.placeholder = "Password"
        passwordField.textColor = UIColor.black
        passwordField.returnKeyType = .done
        passwordField.keyboardType = .default
        passwordField.isSecureTextEntry = true
        passwordField.inputAccessoryView = UIView()
        passwordField.autocorrectionType = .no
        passwordField.autocapitalizationType = .none
        passwordField.font = UIFont(name: "OpenSans", size: 17)
        passwordBorder.backgroundColor = Global.colorSeparator
        passwordField.addSubview(passwordBorder)
        
        signInButton.setTitle("LOGIN", for: .normal)
        signInButton.backgroundColor = Global.colorNewUser
        signInButton.setTitleColor(UIColor.white, for: .normal)
        signInButton.setTitleColor(Global.colorMain, for: .highlighted)
        signInButton.layer.cornerRadius = 5
        signInButton.titleLabel?.font = UIFont(name: "OpenSans-semibold", size: 15)
        signInButton.clipsToBounds = true
        
        forgotButton.setTitle("Forget your password?", for: .normal)
        forgotButton.setTitleColor(Global.colorLogin, for: .normal)
        forgotButton.setTitleColor(Global.colorSelected, for: .highlighted)
        forgotButton.titleLabel?.font = UIFont(name: "OpenSans", size: 15)
        forgotButton.contentHorizontalAlignment = .center
      
        containerView.addSubview(errorLabel)
        containerView.addSubview(trnField)
        containerView.addSubview(passwordField)
        containerView.addSubview(signInButton)
        containerView.addSubview(forgotButton)

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
            
            trnField.autoPinEdge(.top, to: .bottom, of: errorLabel, withOffset: 10)
            trnField.autoPinEdge(toSuperviewEdge: .left, withInset: alpha)
            trnField.autoPinEdge(toSuperviewEdge: .right, withInset: alpha)
            trnField.autoSetDimension(.height, toSize: 40)
            
            trnBorder.autoPinEdge(toSuperviewEdge: .left)
            trnBorder.autoPinEdge(toSuperviewEdge: .right)
            trnBorder.autoPinEdge(toSuperviewEdge: .bottom)
            trnBorder.autoSetDimension(.height, toSize: 0.7)
            
            passwordField.autoPinEdge(.top, to: .bottom, of: trnField, withOffset: 20)
            passwordField.autoPinEdge(toSuperviewEdge: .left, withInset: alpha)
            passwordField.autoPinEdge(toSuperviewEdge: .right, withInset: alpha)
            passwordField.autoSetDimension(.height, toSize: 40)
            
            passwordBorder.autoPinEdge(toSuperviewEdge: .left)
            passwordBorder.autoPinEdge(toSuperviewEdge: .right)
            passwordBorder.autoPinEdge(toSuperviewEdge: .bottom)
            passwordBorder.autoSetDimension(.height, toSize: 0.7)
            
            signInButton.autoPinEdge(.top, to: .bottom, of: passwordField, withOffset: 30)
            signInButton.autoPinEdge(toSuperviewEdge: .left, withInset: alpha + 10)
            signInButton.autoPinEdge(toSuperviewEdge: .right, withInset: alpha + 10)
            signInButton.autoSetDimension(.height, toSize: 45)
            
            forgotButton.autoPinEdge(.top, to: .bottom, of: signInButton, withOffset: 30)
            forgotButton.autoAlignAxis(toSuperviewAxis: .vertical)
            forgotButton.autoSetDimension(.height, toSize: 30)
        }
    }
}
