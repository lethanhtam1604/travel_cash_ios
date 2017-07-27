//
//  WorkingInfoView.swift
//  TravelCash
//
//  Created by Thanh-Tam Le on 6/18/17.
//  Copyright © 2017 Tam. All rights reserved.
//

import UIKit
import DropDown

class WorkingInfoView: UIView {

    var constraintsAdded = false
    
    let scrollView = UIScrollView()
    let containerView = UIView()
    
    let titleLabel = UILabel()
    let numberPageLabel = UILabel()
    
    let errorLabel = UILabel()
    
    let checkBox = CheckboxButton()
    let checkBoxTitleLabel = UILabel()
    
    let employerField = UITextField()
    let employerBorder = UIView()
    
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
    
    let phoneNumberField = UITextField()
    let phoneNumberBorder = UIView()
    
    let yearField = UITextField()
    let yearBorder = UIView()
    
    let monthField = UITextField()
    let monthBorder = UIView()
    
    let occupationField = UITextField()
    let occupationBorder = UIView()
    
    let netIncomeField = UITextField()
    let netIncomeBorder = UIView()
    
    let salaryCycleField = UITextField()
    let salaryCycleBorder = UIView()
    let salaryCycleArrowDropDownView = UIView()
    let salaryCycleArrowDropDownImgView = UIImageView()
    let salaryCycleAbstract = UIView()
    let salaryCycleDropDown = DropDown()
    
    var currentDocument: UITextField!
    
    convenience init() {
        self.init(frame: .zero)
        
        backgroundColor = UIColor.white
        tintColor = Global.colorMain
        addTapToDismiss()
        
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.bounces = true
        
        titleLabel.text = "Working Information"
        titleLabel.font = UIFont(name: "OpenSans", size: 24)
        titleLabel.textAlignment = .left
        titleLabel.textColor = Global.colorMidBlue
        titleLabel.lineBreakMode = .byWordWrapping
        titleLabel.numberOfLines = 0
        
        numberPageLabel.text = "3/7"
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
        
        checkBoxTitleLabel.text = "I am self-employed"
        checkBoxTitleLabel.font = UIFont(name: "OpenSans", size: 16)
        checkBoxTitleLabel.textAlignment = .left
        checkBoxTitleLabel.textColor = UIColor.black.withAlphaComponent(0.8)
        checkBoxTitleLabel.numberOfLines = 1
        
        errorLabel.font = UIFont(name: "OpenSans", size: 14)
        errorLabel.textAlignment = .center
        errorLabel.textColor = UIColor.red.withAlphaComponent(0.7)
        errorLabel.adjustsFontSizeToFitWidth = true
        
        employerField.textAlignment = .left
        employerField.placeholder = "Employer"
        employerField.textColor = UIColor.black
        employerField.returnKeyType = .next
        employerField.keyboardType = .namePhonePad
        employerField.inputAccessoryView = UIView()
        employerField.autocorrectionType = .no
        employerField.autocapitalizationType = .none
        employerField.font = UIFont(name: "OpenSans", size: 17)
        employerBorder.backgroundColor = Global.colorSeparator
        employerField.addSubview(employerBorder)
        
        addressFirstField.textAlignment = .left
        addressFirstField.placeholder = "Address 1"
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
        
        parishArrowDropDownView.backgroundColor = UIColor.white
        parishArrowDropDownView.addSubview(parishArrowDropDownImgView)
        
        parishArrowDropDownImgView.clipsToBounds = true
        parishArrowDropDownImgView.contentMode = .scaleAspectFit
        parishArrowDropDownImgView.image = UIImage(named: "ic_arrow_drop_down")
        
        parishField.textAlignment = .left
        parishField.placeholder = "Parish"
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
        
        yearField.textAlignment = .left
        yearField.placeholder = "Years"
        yearField.textColor = UIColor.black
        yearField.returnKeyType = .next
        yearField.keyboardType = .phonePad
        yearField.inputAccessoryView = UIView()
        yearField.autocorrectionType = .no
        yearField.autocapitalizationType = .none
        yearField.font = UIFont(name: "OpenSans", size: 17)
        yearBorder.backgroundColor = Global.colorSeparator
        yearField.addSubview(yearBorder)
        
        monthField.textAlignment = .left
        monthField.placeholder = "Months"
        monthField.textColor = UIColor.black
        monthField.returnKeyType = .next
        monthField.keyboardType = .phonePad
        monthField.inputAccessoryView = UIView()
        monthField.autocorrectionType = .no
        monthField.autocapitalizationType = .none
        monthField.font = UIFont(name: "OpenSans", size: 17)
        monthBorder.backgroundColor = Global.colorSeparator
        monthField.addSubview(monthBorder)
        
        occupationField.textAlignment = .left
        occupationField.placeholder = "Occupation*"
        occupationField.textColor = UIColor.black
        occupationField.returnKeyType = .next
        occupationField.keyboardType = .namePhonePad
        occupationField.inputAccessoryView = UIView()
        occupationField.autocorrectionType = .no
        occupationField.autocapitalizationType = .none
        occupationField.font = UIFont(name: "OpenSans", size: 17)
        occupationBorder.backgroundColor = Global.colorSeparator
        occupationField.addSubview(occupationBorder)
        
        netIncomeField.textAlignment = .left
        netIncomeField.placeholder = "Net Income*"
        netIncomeField.textColor = UIColor.black
        netIncomeField.returnKeyType = .next
        netIncomeField.keyboardType = .phonePad
        netIncomeField.inputAccessoryView = UIView()
        netIncomeField.autocorrectionType = .no
        netIncomeField.autocapitalizationType = .none
        netIncomeField.font = UIFont(name: "OpenSans", size: 17)
        netIncomeBorder.backgroundColor = Global.colorSeparator
        netIncomeField.addSubview(netIncomeBorder)
        
        salaryCycleArrowDropDownView.backgroundColor = UIColor.white
        salaryCycleArrowDropDownView.addSubview(salaryCycleArrowDropDownImgView)
        
        salaryCycleArrowDropDownImgView.clipsToBounds = true
        salaryCycleArrowDropDownImgView.contentMode = .scaleAspectFit
        salaryCycleArrowDropDownImgView.image = UIImage(named: "ic_arrow_drop_down")
        
        salaryCycleField.textAlignment = .left
        salaryCycleField.placeholder = "Salary Cycle*"
        salaryCycleField.textColor = UIColor.black
        salaryCycleField.returnKeyType = .next
        salaryCycleField.keyboardType = .phonePad
        salaryCycleField.inputAccessoryView = UIView()
        salaryCycleField.autocorrectionType = .no
        salaryCycleField.autocapitalizationType = .none
        salaryCycleField.font = UIFont(name: "OpenSans", size: 17)
        salaryCycleBorder.backgroundColor = Global.colorSeparator
        salaryCycleField.addSubview(salaryCycleBorder)
        salaryCycleAbstract.backgroundColor = UIColor.clear
        salaryCycleField.addSubview(salaryCycleArrowDropDownView)
        salaryCycleField.addSubview(salaryCycleAbstract)
        
        salaryCycleDropDown.anchorView = salaryCycleBorder
        salaryCycleDropDown.direction = .bottom
        salaryCycleDropDown.bottomOffset = CGPoint(x: 0, y: 1)
        salaryCycleDropDown.selectionAction = { [unowned self] (index, item) in
            self.salaryCycleField.text = item
        }
        
        containerView.addSubview(titleLabel)
        containerView.addSubview(numberPageLabel)
        containerView.addSubview(checkBox)
        containerView.addSubview(checkBoxTitleLabel)
        containerView.addSubview(errorLabel)
        containerView.addSubview(employerField)
        containerView.addSubview(addressFirstField)
        containerView.addSubview(addressSecondField)
        containerView.addSubview(parishField)
        containerView.addSubview(phoneNumberField)
        containerView.addSubview(yearField)
        containerView.addSubview(monthField)
        containerView.addSubview(occupationField)
        containerView.addSubview(netIncomeField)
        containerView.addSubview(salaryCycleField)

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
            
            checkBoxTitleLabel.autoPinEdge(.top, to: .bottom, of: titleLabel, withOffset: 20)
            checkBoxTitleLabel.autoPinEdge(.left, to: .right, of: checkBox, withOffset: 10)
            checkBoxTitleLabel.autoPinEdge(toSuperviewEdge: .right, withInset: alpha)
            checkBoxTitleLabel.autoSetDimension(.height, toSize: 20)
            
            errorLabel.autoPinEdge(.top, to: .bottom, of: checkBox, withOffset: 10)
            errorLabel.autoPinEdge(toSuperviewEdge: .left, withInset: 10)
            errorLabel.autoPinEdge(toSuperviewEdge: .right, withInset: 10)
            errorLabel.autoSetDimension(.height, toSize: 20)
            
            employerField.autoPinEdge(.top, to: .bottom, of: errorLabel, withOffset: 10)
            employerField.autoPinEdge(toSuperviewEdge: .left, withInset: alpha)
            employerField.autoPinEdge(toSuperviewEdge: .right, withInset: alpha)
            employerField.autoSetDimension(.height, toSize: 40)
            
            employerBorder.autoPinEdge(toSuperviewEdge: .left)
            employerBorder.autoPinEdge(toSuperviewEdge: .right)
            employerBorder.autoPinEdge(toSuperviewEdge: .bottom)
            employerBorder.autoSetDimension(.height, toSize: 0.7)
            
            addressFirstField.autoPinEdge(.top, to: .bottom, of: employerField, withOffset: 20)
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
            
            phoneNumberField.autoPinEdge(.top, to: .bottom, of: parishField, withOffset: 20)
            phoneNumberField.autoPinEdge(toSuperviewEdge: .left, withInset: alpha)
            phoneNumberField.autoPinEdge(toSuperviewEdge: .right, withInset: alpha)
            phoneNumberField.autoSetDimension(.height, toSize: 40)
            
            phoneNumberBorder.autoPinEdge(toSuperviewEdge: .left)
            phoneNumberBorder.autoPinEdge(toSuperviewEdge: .right)
            phoneNumberBorder.autoPinEdge(toSuperviewEdge: .bottom)
            phoneNumberBorder.autoSetDimension(.height, toSize: 0.7)
            
            yearField.autoPinEdge(.top, to: .bottom, of: phoneNumberField, withOffset: 20)
            yearField.autoPinEdge(toSuperviewEdge: .left, withInset: alpha)
            yearField.autoSetDimension(.height, toSize: 45)
            yearField.autoSetDimension(.width, toSize: self.bounds.size.width/2 - alpha - 5)
            
            yearBorder.autoPinEdge(toSuperviewEdge: .left)
            yearBorder.autoPinEdge(toSuperviewEdge: .right)
            yearBorder.autoPinEdge(toSuperviewEdge: .bottom)
            yearBorder.autoSetDimension(.height, toSize: 0.7)
            
            monthField.autoPinEdge(.top, to: .bottom, of: phoneNumberField, withOffset: 20)
            monthField.autoPinEdge(.left, to: .right, of: yearField, withOffset: 10)
            monthField.autoSetDimension(.height, toSize: 45)
            monthField.autoSetDimension(.width, toSize: self.bounds.size.width/2 - alpha - 5)
            
            monthBorder.autoPinEdge(toSuperviewEdge: .left)
            monthBorder.autoPinEdge(toSuperviewEdge: .right)
            monthBorder.autoPinEdge(toSuperviewEdge: .bottom)
            monthBorder.autoSetDimension(.height, toSize: 0.7)
            
            occupationField.autoPinEdge(.top, to: .bottom, of: yearField, withOffset: 40)
            occupationField.autoPinEdge(toSuperviewEdge: .left, withInset: alpha)
            occupationField.autoPinEdge(toSuperviewEdge: .right, withInset: alpha)
            occupationField.autoSetDimension(.height, toSize: 40)
            
            occupationBorder.autoPinEdge(toSuperviewEdge: .left)
            occupationBorder.autoPinEdge(toSuperviewEdge: .right)
            occupationBorder.autoPinEdge(toSuperviewEdge: .bottom)
            occupationBorder.autoSetDimension(.height, toSize: 0.7)
            
            netIncomeField.autoPinEdge(.top, to: .bottom, of: occupationField, withOffset: 20)
            netIncomeField.autoPinEdge(toSuperviewEdge: .left, withInset: alpha)
            netIncomeField.autoPinEdge(toSuperviewEdge: .right, withInset: alpha)
            netIncomeField.autoSetDimension(.height, toSize: 40)
            
            netIncomeBorder.autoPinEdge(toSuperviewEdge: .left)
            netIncomeBorder.autoPinEdge(toSuperviewEdge: .right)
            netIncomeBorder.autoPinEdge(toSuperviewEdge: .bottom)
            netIncomeBorder.autoSetDimension(.height, toSize: 0.7)
            
            salaryCycleArrowDropDownView.autoPinEdge(toSuperviewEdge: .right, withInset: 0)
            salaryCycleArrowDropDownView.autoPinEdge(toSuperviewEdge: .top, withInset: 0)
            salaryCycleArrowDropDownView.autoPinEdge(toSuperviewEdge: .bottom, withInset: 1)
            salaryCycleArrowDropDownView.autoSetDimension(.width, toSize: 25)
            
            salaryCycleArrowDropDownImgView.autoPinEdge(toSuperviewEdge: .top, withInset: 12)
            salaryCycleArrowDropDownImgView.autoPinEdge(toSuperviewEdge: .right, withInset: 1)
            salaryCycleArrowDropDownImgView.autoSetDimensions(to: CGSize(width: 25, height: 25))
            
            salaryCycleField.autoPinEdge(.top, to: .bottom, of: netIncomeField, withOffset: 20)
            salaryCycleField.autoPinEdge(toSuperviewEdge: .left, withInset: alpha)
            salaryCycleField.autoPinEdge(toSuperviewEdge: .right, withInset: alpha)
            salaryCycleField.autoSetDimension(.height, toSize: 40)
            
            salaryCycleAbstract.autoPinEdgesToSuperviewEdges()
            
            salaryCycleBorder.autoPinEdge(toSuperviewEdge: .left)
            salaryCycleBorder.autoPinEdge(toSuperviewEdge: .right)
            salaryCycleBorder.autoPinEdge(toSuperviewEdge: .bottom)
            salaryCycleBorder.autoSetDimension(.height, toSize: 0.7)
        }
    }
}
