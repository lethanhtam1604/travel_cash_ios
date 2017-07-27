//
//  BankInfoView.swift
//  TravelCash
//
//  Created by Thanh-Tam Le on 6/18/17.
//  Copyright © 2017 Tam. All rights reserved.
//

import UIKit
import DropDown
import M13Checkbox

class BankInfoView: UIView {
    
    var constraintsAdded = false
    
    let scrollView = UIScrollView()
    let containerView = UIView()
        
    let titleLabel = UILabel()
    let numberPageLabel = UILabel()
    
    let errorLabel = UILabel()
    
    let checkBox = CheckboxButton()
    let notAvailable = UILabel()
    
    let bankNameField = UITextField()
    let bankNameBorder = UIView()
    
    let branchField = UITextField()
    let branchBorder = UIView()
    
    let accountTypeField = UITextField()
    let accountTypeBorder = UIView()
    let accountTypeArrowDropDownView = UIView()
    let accountTypeArrowDropDownImgView = UIImageView()
    let accountTypeAbstract = UIView()
    let accountTypeDropDown = DropDown()
    
    var currentDocument: UITextField!
    
    convenience init() {
        self.init(frame: .zero)
        
        backgroundColor = UIColor.white
        tintColor = Global.colorMain
        addTapToDismiss()
        
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.bounces = true
        
        titleLabel.text = "Banking Information"
        titleLabel.font = UIFont(name: "OpenSans", size: 24)
        titleLabel.textAlignment = .left
        titleLabel.textColor = Global.colorMidBlue
        titleLabel.lineBreakMode = .byWordWrapping
        titleLabel.numberOfLines = 0
        
        numberPageLabel.text = "2/7"
        numberPageLabel.font = UIFont(name: "OpenSans", size: 17)
        numberPageLabel.textAlignment = .center
        numberPageLabel.textColor = UIColor.black.withAlphaComponent(0.8)
        numberPageLabel.lineBreakMode = .byWordWrapping
        numberPageLabel.numberOfLines = 0
        numberPageLabel.layer.cornerRadius = 15
        numberPageLabel.layer.backgroundColor = UIColor.gray.withAlphaComponent(0.3).cgColor
        
        checkBox.containerColor = Global.colorMain
        checkBox.backgroundColor = Global.colorMain
        checkBox.checkColor = UIColor.white
        checkBox.on = true
        
        notAvailable.text = "Not Available"
        notAvailable.font = UIFont(name: "OpenSans", size: 16)
        notAvailable.textAlignment = .left
        notAvailable.textColor = UIColor.black.withAlphaComponent(0.8)
        notAvailable.numberOfLines = 1
        
        errorLabel.font = UIFont(name: "OpenSans", size: 14)
        errorLabel.textAlignment = .center
        errorLabel.textColor = UIColor.red.withAlphaComponent(0.7)
        errorLabel.adjustsFontSizeToFitWidth = true
        
        bankNameField.textAlignment = .left
        bankNameField.placeholder = "Bank Name*"
        bankNameField.textColor = UIColor.black
        bankNameField.returnKeyType = .next
        bankNameField.keyboardType = .namePhonePad
        bankNameField.inputAccessoryView = UIView()
        bankNameField.autocorrectionType = .no
        bankNameField.autocapitalizationType = .none
        bankNameField.font = UIFont(name: "OpenSans", size: 17)
        bankNameBorder.backgroundColor = Global.colorSeparator
        bankNameField.addSubview(bankNameBorder)
        
        branchField.textAlignment = .left
        branchField.placeholder = "Branch*"
        branchField.textColor = UIColor.black
        branchField.returnKeyType = .next
        branchField.keyboardType = .namePhonePad
        branchField.inputAccessoryView = UIView()
        branchField.autocorrectionType = .no
        branchField.autocapitalizationType = .none
        branchField.font = UIFont(name: "OpenSans", size: 17)
        branchBorder.backgroundColor = Global.colorSeparator
        branchField.addSubview(branchBorder)
        
        accountTypeArrowDropDownView.backgroundColor = UIColor.white
        accountTypeArrowDropDownView.addSubview(accountTypeArrowDropDownImgView)
        
        accountTypeArrowDropDownImgView.clipsToBounds = true
        accountTypeArrowDropDownImgView.contentMode = .scaleAspectFit
        accountTypeArrowDropDownImgView.image = UIImage(named: "ic_arrow_drop_down")
        
        accountTypeField.textAlignment = .left
        accountTypeField.placeholder = "Account Type*"
        accountTypeField.textColor = UIColor.black
        accountTypeField.returnKeyType = .next
        accountTypeField.keyboardType = .phonePad
        accountTypeField.inputAccessoryView = UIView()
        accountTypeField.autocorrectionType = .no
        accountTypeField.autocapitalizationType = .none
        accountTypeField.font = UIFont(name: "OpenSans", size: 17)
        accountTypeBorder.backgroundColor = Global.colorSeparator
        accountTypeField.addSubview(accountTypeBorder)
        accountTypeAbstract.backgroundColor = UIColor.clear
        accountTypeField.addSubview(accountTypeArrowDropDownView)
        accountTypeField.addSubview(accountTypeAbstract)
        
        accountTypeDropDown.anchorView = accountTypeBorder
        accountTypeDropDown.direction = .bottom
        accountTypeDropDown.bottomOffset = CGPoint(x: 0, y: 1)
        accountTypeDropDown.selectionAction = { [unowned self] (index, item) in
            self.accountTypeField.text = item
        }
        
        containerView.addSubview(titleLabel)
        containerView.addSubview(numberPageLabel)
        containerView.addSubview(checkBox)
        containerView.addSubview(notAvailable)
        containerView.addSubview(errorLabel)
        containerView.addSubview(bankNameField)
        containerView.addSubview(branchField)
        containerView.addSubview(accountTypeField)
        
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
            titleLabel.autoPinEdge(.right, to: .left, of: numberPageLabel, withOffset: 10)
            
            numberPageLabel.autoPinEdge(toSuperviewEdge: .top, withInset: 10)
            numberPageLabel.autoPinEdge(toSuperviewEdge: .right, withInset: 10)
            numberPageLabel.autoSetDimensions(to: CGSize(width: 50, height: 30))
            
            checkBox.autoPinEdge(.top, to: .bottom, of: titleLabel, withOffset: 20)
            checkBox.autoPinEdge(toSuperviewEdge: .left, withInset: alpha)
            checkBox.autoSetDimension(.width, toSize: 20)
            checkBox.autoSetDimension(.height, toSize: 20)
            
            notAvailable.autoPinEdge(.top, to: .bottom, of: titleLabel, withOffset: 20)
            notAvailable.autoPinEdge(.left, to: .right, of: checkBox, withOffset: 10)
            notAvailable.autoPinEdge(toSuperviewEdge: .right, withInset: alpha)
            notAvailable.autoSetDimension(.height, toSize: 20)
            
            errorLabel.autoPinEdge(.top, to: .bottom, of: checkBox, withOffset: 10)
            errorLabel.autoPinEdge(toSuperviewEdge: .left, withInset: 10)
            errorLabel.autoPinEdge(toSuperviewEdge: .right, withInset: 10)
            errorLabel.autoSetDimension(.height, toSize: 20)
            
            bankNameField.autoPinEdge(.top, to: .bottom, of: errorLabel, withOffset: 10)
            bankNameField.autoPinEdge(toSuperviewEdge: .left, withInset: alpha)
            bankNameField.autoPinEdge(toSuperviewEdge: .right, withInset: alpha)
            bankNameField.autoSetDimension(.height, toSize: 40)
            
            bankNameBorder.autoPinEdge(toSuperviewEdge: .left)
            bankNameBorder.autoPinEdge(toSuperviewEdge: .right)
            bankNameBorder.autoPinEdge(toSuperviewEdge: .bottom)
            bankNameBorder.autoSetDimension(.height, toSize: 0.7)
            
            branchField.autoPinEdge(.top, to: .bottom, of: bankNameField, withOffset: 20)
            branchField.autoPinEdge(toSuperviewEdge: .left, withInset: alpha)
            branchField.autoPinEdge(toSuperviewEdge: .right, withInset: alpha)
            branchField.autoSetDimension(.height, toSize: 40)
            
            branchBorder.autoPinEdge(toSuperviewEdge: .left)
            branchBorder.autoPinEdge(toSuperviewEdge: .right)
            branchBorder.autoPinEdge(toSuperviewEdge: .bottom)
            branchBorder.autoSetDimension(.height, toSize: 0.7)
            
            accountTypeArrowDropDownView.autoPinEdge(toSuperviewEdge: .right, withInset: 0)
            accountTypeArrowDropDownView.autoPinEdge(toSuperviewEdge: .top, withInset: 0)
            accountTypeArrowDropDownView.autoPinEdge(toSuperviewEdge: .bottom, withInset: 1)
            accountTypeArrowDropDownView.autoSetDimension(.width, toSize: 25)
            
            accountTypeArrowDropDownImgView.autoPinEdge(toSuperviewEdge: .top, withInset: 12)
            accountTypeArrowDropDownImgView.autoPinEdge(toSuperviewEdge: .right, withInset: 1)
            accountTypeArrowDropDownImgView.autoSetDimensions(to: CGSize(width: 25, height: 25))
            
            accountTypeField.autoPinEdge(.top, to: .bottom, of: branchField, withOffset: 20)
            accountTypeField.autoPinEdge(toSuperviewEdge: .left, withInset: alpha)
            accountTypeField.autoPinEdge(toSuperviewEdge: .right, withInset: alpha)
            accountTypeField.autoSetDimension(.height, toSize: 40)
            
            accountTypeAbstract.autoPinEdgesToSuperviewEdges()
            
            accountTypeBorder.autoPinEdge(toSuperviewEdge: .left)
            accountTypeBorder.autoPinEdge(toSuperviewEdge: .right)
            accountTypeBorder.autoPinEdge(toSuperviewEdge: .bottom)
            accountTypeBorder.autoSetDimension(.height, toSize: 0.7)
        }
    }
}
