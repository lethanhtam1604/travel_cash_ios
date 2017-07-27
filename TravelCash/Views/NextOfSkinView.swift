//
//  NextOfSkinView.swift
//  TravelCash
//
//  Created by Thanh-Tam Le on 6/19/17.
//  Copyright © 2017 Tam. All rights reserved.
//

import UIKit
import DropDown

class NextOfSkinView: UIView {
    
    var constraintsAdded = false
    
    let scrollView = UIScrollView()
    let containerView = UIView()
    
    let titleLabel = UILabel()
    let numberPageLabel = UILabel()
    
    let errorLabel = UILabel()
    
    let fullNameField = UITextField()
    let fullNameBorder = UIView()
    
    let phoneNumberField = UITextField()
    let phoneNumberBorder = UIView()
    
    let addressFirstField = UITextField()
    let addressFirstBorder = UIView()
    
    let addressSecondField = UITextField()
    let addressSecondBorder = UIView()
    
    let parishField = UITextField()
    let parishBorder = UIView()
    let parishArrowDropDownView = UIView()
    let parishArrowDropDownImgView = UIImageView()
    let parishAbstract = UIView()
    let parishDropDown = DropDown()
    
    let relationshipField = UITextField()
    let relationshipBorder = UIView()
    let relationshipArrowDropDownView = UIView()
    let relationshipArrowDropDownImgView = UIImageView()
    let relationshipAbstract = UIView()
    let relationshipDropDown = DropDown()
    
    var currentDocument: UITextField!
    
    convenience init() {
        self.init(frame: .zero)
        
        backgroundColor = UIColor.white
        tintColor = Global.colorMain
        addTapToDismiss()
        
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.bounces = true
        
        titleLabel.text = "Next of Skin"
        titleLabel.font = UIFont(name: "OpenSans", size: 24)
        titleLabel.textAlignment = .left
        titleLabel.textColor = Global.colorMidBlue
        titleLabel.lineBreakMode = .byWordWrapping
        titleLabel.numberOfLines = 0
        
        numberPageLabel.text = "5/7"
        numberPageLabel.font = UIFont(name: "OpenSans", size: 17)
        numberPageLabel.textAlignment = .center
        numberPageLabel.textColor = UIColor.black.withAlphaComponent(0.8)
        numberPageLabel.lineBreakMode = .byWordWrapping
        numberPageLabel.numberOfLines = 0
        numberPageLabel.layer.cornerRadius = 15
        numberPageLabel.layer.backgroundColor = UIColor.gray.withAlphaComponent(0.3).cgColor
        
        errorLabel.font = UIFont(name: "OpenSans", size: 14)
        errorLabel.textAlignment = .center
        errorLabel.textColor = UIColor.red.withAlphaComponent(0.7)
        errorLabel.adjustsFontSizeToFitWidth = true
        
        fullNameField.textAlignment = .left
        fullNameField.placeholder = "Full Name*"
        fullNameField.textColor = UIColor.black
        fullNameField.returnKeyType = .next
        fullNameField.keyboardType = .namePhonePad
        fullNameField.inputAccessoryView = UIView()
        fullNameField.autocorrectionType = .no
        fullNameField.autocapitalizationType = .none
        fullNameField.font = UIFont(name: "OpenSans", size: 17)
        fullNameBorder.backgroundColor = Global.colorSeparator
        fullNameField.addSubview(fullNameBorder)
        
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
        addressSecondField.placeholder = "Address 2*"
        addressSecondField.textColor = UIColor.black
        addressSecondField.returnKeyType = .next
        addressSecondField.keyboardType = .namePhonePad
        addressSecondField.inputAccessoryView = UIView()
        addressSecondField.autocorrectionType = .no
        addressSecondField.autocapitalizationType = .none
        addressSecondField.font = UIFont(name: "OpenSans", size: 17)
        addressSecondBorder.backgroundColor = Global.colorSeparator
        addressSecondField.addSubview(addressSecondBorder)
        
        parishArrowDropDownView.backgroundColor = UIColor.white
        parishArrowDropDownView.addSubview(parishArrowDropDownImgView)
        
        parishArrowDropDownImgView.clipsToBounds = true
        parishArrowDropDownImgView.contentMode = .scaleAspectFit
        parishArrowDropDownImgView.image = UIImage(named: "ic_arrow_drop_down")
        
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
        parishField.addSubview(parishArrowDropDownView)
        parishField.addSubview(parishAbstract)
        
        parishDropDown.anchorView = parishBorder
        parishDropDown.direction = .bottom
        parishDropDown.bottomOffset = CGPoint(x: 0, y: 1)
        parishDropDown.selectionAction = { [unowned self] (index, item) in
            self.parishField.text = item
        }
        
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
        
        relationshipArrowDropDownView.backgroundColor = UIColor.white
        relationshipArrowDropDownView.addSubview(relationshipArrowDropDownImgView)
        
        relationshipArrowDropDownImgView.clipsToBounds = true
        relationshipArrowDropDownImgView.contentMode = .scaleAspectFit
        relationshipArrowDropDownImgView.image = UIImage(named: "ic_arrow_drop_down")
        
        relationshipField.textAlignment = .left
        relationshipField.placeholder = "Relationship*"
        relationshipField.textColor = UIColor.black
        relationshipField.returnKeyType = .next
        relationshipField.keyboardType = .phonePad
        relationshipField.inputAccessoryView = UIView()
        relationshipField.autocorrectionType = .no
        relationshipField.autocapitalizationType = .none
        relationshipField.font = UIFont(name: "OpenSans", size: 17)
        relationshipBorder.backgroundColor = Global.colorSeparator
        relationshipField.addSubview(relationshipBorder)
        relationshipAbstract.backgroundColor = UIColor.clear
        relationshipField.addSubview(relationshipArrowDropDownView)
        relationshipField.addSubview(relationshipAbstract)
        
        relationshipDropDown.anchorView = relationshipBorder
        relationshipDropDown.direction = .bottom
        relationshipDropDown.bottomOffset = CGPoint(x: 0, y: 1)
        relationshipDropDown.selectionAction = { [unowned self] (index, item) in
            self.relationshipField.text = item
        }
        
        containerView.addSubview(titleLabel)
        containerView.addSubview(numberPageLabel)
        containerView.addSubview(errorLabel)
        containerView.addSubview(fullNameField)
        containerView.addSubview(phoneNumberField)
        containerView.addSubview(addressFirstField)
        containerView.addSubview(addressSecondField)
        containerView.addSubview(parishField)
        containerView.addSubview(relationshipField)
        
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
            
            errorLabel.autoPinEdge(.top, to: .bottom, of: titleLabel, withOffset: 10)
            errorLabel.autoPinEdge(toSuperviewEdge: .left, withInset: 10)
            errorLabel.autoPinEdge(toSuperviewEdge: .right, withInset: 10)
            errorLabel.autoSetDimension(.height, toSize: 20)
            
            fullNameField.autoPinEdge(.top, to: .bottom, of: errorLabel, withOffset: 10)
            fullNameField.autoPinEdge(toSuperviewEdge: .left, withInset: alpha)
            fullNameField.autoPinEdge(toSuperviewEdge: .right, withInset: alpha)
            fullNameField.autoSetDimension(.height, toSize: 40)
            
            fullNameBorder.autoPinEdge(toSuperviewEdge: .left)
            fullNameBorder.autoPinEdge(toSuperviewEdge: .right)
            fullNameBorder.autoPinEdge(toSuperviewEdge: .bottom)
            fullNameBorder.autoSetDimension(.height, toSize: 0.7)
            
            phoneNumberField.autoPinEdge(.top, to: .bottom, of: fullNameField, withOffset: 20)
            phoneNumberField.autoPinEdge(toSuperviewEdge: .left, withInset: alpha)
            phoneNumberField.autoPinEdge(toSuperviewEdge: .right, withInset: alpha)
            phoneNumberField.autoSetDimension(.height, toSize: 40)
            
            phoneNumberBorder.autoPinEdge(toSuperviewEdge: .left)
            phoneNumberBorder.autoPinEdge(toSuperviewEdge: .right)
            phoneNumberBorder.autoPinEdge(toSuperviewEdge: .bottom)
            phoneNumberBorder.autoSetDimension(.height, toSize: 0.7)
            
            addressFirstField.autoPinEdge(.top, to: .bottom, of: phoneNumberField, withOffset: 20)
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
            
            parishArrowDropDownView.autoPinEdge(toSuperviewEdge: .right, withInset: 0)
            parishArrowDropDownView.autoPinEdge(toSuperviewEdge: .top, withInset: 0)
            parishArrowDropDownView.autoPinEdge(toSuperviewEdge: .bottom, withInset: 1)
            parishArrowDropDownView.autoSetDimension(.width, toSize: 25)
            
            parishArrowDropDownImgView.autoPinEdge(toSuperviewEdge: .top, withInset: 12)
            parishArrowDropDownImgView.autoPinEdge(toSuperviewEdge: .right, withInset: 1)
            parishArrowDropDownImgView.autoSetDimensions(to: CGSize(width: 25, height: 25))
            
            parishField.autoPinEdge(.top, to: .bottom, of: addressSecondField, withOffset: 20)
            parishField.autoPinEdge(toSuperviewEdge: .left, withInset: alpha)
            parishField.autoPinEdge(toSuperviewEdge: .right, withInset: alpha)
            parishField.autoSetDimension(.height, toSize: 40)
            
            parishAbstract.autoPinEdgesToSuperviewEdges()
            
            parishBorder.autoPinEdge(toSuperviewEdge: .left)
            parishBorder.autoPinEdge(toSuperviewEdge: .right)
            parishBorder.autoPinEdge(toSuperviewEdge: .bottom)
            parishBorder.autoSetDimension(.height, toSize: 0.7)
            
            relationshipArrowDropDownView.autoPinEdge(toSuperviewEdge: .right, withInset: 0)
            relationshipArrowDropDownView.autoPinEdge(toSuperviewEdge: .top, withInset: 0)
            relationshipArrowDropDownView.autoPinEdge(toSuperviewEdge: .bottom, withInset: 1)
            relationshipArrowDropDownView.autoSetDimension(.width, toSize: 25)
            
            relationshipArrowDropDownImgView.autoPinEdge(toSuperviewEdge: .top, withInset: 12)
            relationshipArrowDropDownImgView.autoPinEdge(toSuperviewEdge: .right, withInset: 1)
            relationshipArrowDropDownImgView.autoSetDimensions(to: CGSize(width: 25, height: 25))
            
            relationshipField.autoPinEdge(.top, to: .bottom, of: parishField, withOffset: 20)
            relationshipField.autoPinEdge(toSuperviewEdge: .left, withInset: alpha)
            relationshipField.autoPinEdge(toSuperviewEdge: .right, withInset: alpha)
            relationshipField.autoSetDimension(.height, toSize: 40)
            
            relationshipAbstract.autoPinEdgesToSuperviewEdges()
            
            relationshipBorder.autoPinEdge(toSuperviewEdge: .left)
            relationshipBorder.autoPinEdge(toSuperviewEdge: .right)
            relationshipBorder.autoPinEdge(toSuperviewEdge: .bottom)
            relationshipBorder.autoSetDimension(.height, toSize: 0.7)
        }
    }
}
