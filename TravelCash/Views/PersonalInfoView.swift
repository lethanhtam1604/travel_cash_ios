//
//  PersonalInfoView.swift
//  TravelCash
//
//  Created by Thanh-Tam Le on 6/18/17.
//  Copyright © 2017 Tam. All rights reserved.
//

import UIKit
import DropDown

class PersonalInfoView: UIView {
    
    var constraintsAdded = false
    
    let scrollView = UIScrollView()
    let containerView = UIView()
    
    let titleLabel = UILabel()
    let numberPageLabel = UILabel()

    let errorLabel = UILabel()

    let loanAmountField = UITextField()
    let loanAmountBorder = UIView()

    let firstNameField = UITextField()
    let firstNameBorder = UIView()
    
    let surNameField = UITextField()
    let surNameBorder = UIView()
    
    let middleNameField = UITextField()
    let middleNameBorder = UIView()
    
    let aliasOrNicknameField = UITextField()
    let aliasOrNicknameBorder = UIView()
    
    let genderField = UITextField()
    let genderBorder = UIView()
    let genderArrowDropDownView = UIView()
    let genderArrowDropDownImgView = UIImageView()
    let genderAbstract = UIView()
    let genderDropDown = DropDown()
    
    let dobField = UITextField()
    let dobBorder = UIView()
    let dateRangeView = UIView()
    let dateRangeImgView = UIImageView()
    let dobAbstract = UIView()
    
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
    let parishArrowDropDownView = UIView()
    let parishArrowDropDownImgView = UIImageView()
    let parishAbstract = UIView()
    let parishDropDown = DropDown()
    
    let idTypeField = UITextField()
    let idTypeBorder = UIView()
    let idTypeArrowDropDownView = UIView()
    let idTypeArrowDropDownImgView = UIImageView()
    let idTypeAbstract = UIView()
    let idTypeDropDown = DropDown()
    
    let idNumberField = UITextField()
    let idNumberBorder = UIView()
    
    let numberOfDependentsField = UITextField()
    let numberOfDependentsBorder = UIView()
    
    let homeStatusField = UITextField()
    let homeStatusBorder = UIView()
    let homeStatusArrowDropDownView = UIView()
    let homeStatusArrowDropDownImgView = UIImageView()
    let homeStatusAbstract = UIView()
    let homeStatusDropDown = DropDown()

    var currentDocument: UITextField!
    
    convenience init() {
        self.init(frame: .zero)
        
        backgroundColor = UIColor.white
        tintColor = Global.colorMain
        addTapToDismiss()
        
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.bounces = true
        
        titleLabel.text = "Personal Information"
        titleLabel.font = UIFont(name: "OpenSans", size: 24)
        titleLabel.textAlignment = .left
        titleLabel.textColor = Global.colorMidBlue
        titleLabel.lineBreakMode = .byWordWrapping
        titleLabel.numberOfLines = 0
        
        numberPageLabel.text = "1/7"
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

        loanAmountField.textAlignment = .left
        loanAmountField.placeholder = "Loan Amount"
        loanAmountField.textColor = UIColor.black
        loanAmountField.returnKeyType = .next
        loanAmountField.keyboardType = .numberPad
        loanAmountField.inputAccessoryView = UIView()
        loanAmountField.autocorrectionType = .no
        loanAmountField.autocapitalizationType = .none
        loanAmountField.font = UIFont(name: "OpenSans", size: 17)
        loanAmountBorder.backgroundColor = Global.colorSeparator
        loanAmountField.addSubview(loanAmountBorder)

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
        
        middleNameField.textAlignment = .left
        middleNameField.placeholder = "Middle Name"
        middleNameField.textColor = UIColor.black
        middleNameField.returnKeyType = .next
        middleNameField.keyboardType = .namePhonePad
        middleNameField.inputAccessoryView = UIView()
        middleNameField.autocorrectionType = .no
        middleNameField.autocapitalizationType = .none
        middleNameField.font = UIFont(name: "OpenSans", size: 17)
        middleNameBorder.backgroundColor = Global.colorSeparator
        middleNameField.addSubview(middleNameBorder)
        
        aliasOrNicknameField.textAlignment = .left
        aliasOrNicknameField.placeholder = "Alias or Nickname"
        aliasOrNicknameField.textColor = UIColor.black
        aliasOrNicknameField.returnKeyType = .next
        aliasOrNicknameField.keyboardType = .namePhonePad
        aliasOrNicknameField.inputAccessoryView = UIView()
        aliasOrNicknameField.autocorrectionType = .no
        aliasOrNicknameField.autocapitalizationType = .none
        aliasOrNicknameField.font = UIFont(name: "OpenSans", size: 17)
        aliasOrNicknameBorder.backgroundColor = Global.colorSeparator
        aliasOrNicknameField.addSubview(aliasOrNicknameBorder)
        
        genderArrowDropDownView.backgroundColor = UIColor.white
        genderArrowDropDownView.addSubview(genderArrowDropDownImgView)
        
        genderArrowDropDownImgView.clipsToBounds = true
        genderArrowDropDownImgView.contentMode = .scaleAspectFit
        genderArrowDropDownImgView.image = UIImage(named: "ic_arrow_drop_down")
        
        genderField.textAlignment = .left
        genderField.placeholder = "Gender*"
        genderField.textColor = UIColor.black
        genderField.returnKeyType = .next
        genderField.keyboardType = .phonePad
        genderField.inputAccessoryView = UIView()
        genderField.autocorrectionType = .no
        genderField.autocapitalizationType = .none
        genderField.font = UIFont(name: "OpenSans", size: 17)
        genderBorder.backgroundColor = Global.colorSeparator
        genderField.addSubview(genderBorder)
        genderAbstract.backgroundColor = UIColor.clear
        genderField.addSubview(genderArrowDropDownView)
        genderField.addSubview(genderAbstract)
        
        genderDropDown.anchorView = genderBorder
        genderDropDown.direction = .bottom
        genderDropDown.bottomOffset = CGPoint(x: 0, y: 1)
        genderDropDown.selectionAction = { [unowned self] (index, item) in
            self.genderField.text = item
        }
        
        dobField.textAlignment = .left
        dobField.placeholder = "Enter DOB*"
        dobField.textColor = UIColor.black
        dobField.returnKeyType = .next
        dobField.keyboardType = .phonePad
        dobField.inputAccessoryView = UIView()
        dobField.autocorrectionType = .no
        dobField.autocapitalizationType = .none
        dobField.font = UIFont(name: "OpenSans", size: 17)
        dobBorder.backgroundColor = Global.colorSeparator
        dobField.addSubview(dobBorder)
        dobAbstract.backgroundColor = UIColor.clear
        dateRangeView.backgroundColor = UIColor.white
        dateRangeView.addSubview(dateRangeImgView)
        dobField.addSubview(dateRangeView)
        dobField.addSubview(dobAbstract)
        
        dateRangeImgView.clipsToBounds = true
        dateRangeImgView.contentMode = .scaleAspectFit
        dateRangeImgView.image = UIImage(named: "ic_date_range")
        
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
        
        idTypeArrowDropDownView.backgroundColor = UIColor.white
        idTypeArrowDropDownView.addSubview(idTypeArrowDropDownImgView)
        
        idTypeArrowDropDownImgView.clipsToBounds = true
        idTypeArrowDropDownImgView.contentMode = .scaleAspectFit
        idTypeArrowDropDownImgView.image = UIImage(named: "ic_arrow_drop_down")
        
        idTypeField.textAlignment = .left
        idTypeField.placeholder = "ID Type*"
        idTypeField.textColor = UIColor.black
        idTypeField.returnKeyType = .next
        idTypeField.keyboardType = .phonePad
        idTypeField.inputAccessoryView = UIView()
        idTypeField.autocorrectionType = .no
        idTypeField.autocapitalizationType = .none
        idTypeField.font = UIFont(name: "OpenSans", size: 17)
        idTypeBorder.backgroundColor = Global.colorSeparator
        idTypeField.addSubview(idTypeBorder)
        idTypeAbstract.backgroundColor = UIColor.clear
        idTypeField.addSubview(idTypeArrowDropDownView)
        idTypeField.addSubview(idTypeAbstract)
        
        idTypeDropDown.anchorView = idTypeBorder
        idTypeDropDown.direction = .bottom
        idTypeDropDown.bottomOffset = CGPoint(x: 0, y: 1)
        idTypeDropDown.selectionAction = { [unowned self] (index, item) in
            self.idTypeField.text = item
        }
        
        idNumberField.textAlignment = .left
        idNumberField.placeholder = "ID Number*"
        idNumberField.textColor = UIColor.black
        idNumberField.returnKeyType = .next
        idNumberField.keyboardType = .phonePad
        idNumberField.inputAccessoryView = UIView()
        idNumberField.autocorrectionType = .no
        idNumberField.autocapitalizationType = .none
        idNumberField.font = UIFont(name: "OpenSans", size: 17)
        idNumberBorder.backgroundColor = Global.colorSeparator
        idNumberField.addSubview(idNumberBorder)
        
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
        
        numberOfDependentsField.textAlignment = .left
        numberOfDependentsField.placeholder = "Number of Dependents*"
        numberOfDependentsField.textColor = UIColor.black
        numberOfDependentsField.returnKeyType = .next
        numberOfDependentsField.keyboardType = .phonePad
        numberOfDependentsField.inputAccessoryView = UIView()
        numberOfDependentsField.autocorrectionType = .no
        numberOfDependentsField.autocapitalizationType = .none
        numberOfDependentsField.font = UIFont(name: "OpenSans", size: 17)
        numberOfDependentsBorder.backgroundColor = Global.colorSeparator
        numberOfDependentsField.addSubview(numberOfDependentsBorder)
        
        homeStatusArrowDropDownView.backgroundColor = UIColor.white
        homeStatusArrowDropDownView.addSubview(homeStatusArrowDropDownImgView)
        
        homeStatusArrowDropDownImgView.clipsToBounds = true
        homeStatusArrowDropDownImgView.contentMode = .scaleAspectFit
        homeStatusArrowDropDownImgView.image = UIImage(named: "ic_arrow_drop_down")
        
        homeStatusField.textAlignment = .left
        homeStatusField.placeholder = "Home Status*"
        homeStatusField.textColor = UIColor.black
        homeStatusField.returnKeyType = .next
        homeStatusField.keyboardType = .phonePad
        homeStatusField.inputAccessoryView = UIView()
        homeStatusField.autocorrectionType = .no
        homeStatusField.autocapitalizationType = .none
        homeStatusField.font = UIFont(name: "OpenSans", size: 17)
        homeStatusBorder.backgroundColor = Global.colorSeparator
        homeStatusField.addSubview(homeStatusBorder)
        homeStatusAbstract.backgroundColor = UIColor.clear
        homeStatusField.addSubview(homeStatusArrowDropDownView)
        homeStatusField.addSubview(homeStatusAbstract)
        
        homeStatusDropDown.anchorView = homeStatusBorder
        homeStatusDropDown.direction = .bottom
        homeStatusDropDown.bottomOffset = CGPoint(x: 0, y: 1)
        homeStatusDropDown.selectionAction = { [unowned self] (index, item) in
            self.homeStatusField.text = item
        }
        
        containerView.addSubview(titleLabel)
        containerView.addSubview(numberPageLabel)
        containerView.addSubview(errorLabel)
        containerView.addSubview(loanAmountField)
        containerView.addSubview(firstNameField)
        containerView.addSubview(surNameField)
        containerView.addSubview(middleNameField)
        containerView.addSubview(aliasOrNicknameField)
        containerView.addSubview(genderField)
        containerView.addSubview(dobField)
        containerView.addSubview(emailField)
        containerView.addSubview(phoneNumberField)
        containerView.addSubview(addressFirstField)
        containerView.addSubview(addressSecondField)
        containerView.addSubview(parishField)
        containerView.addSubview(idTypeField)
        containerView.addSubview(idNumberField)
        containerView.addSubview(trnField)
        containerView.addSubview(numberOfDependentsField)
        containerView.addSubview(homeStatusField)

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

            loanAmountField.autoPinEdge(.top, to: .bottom, of: errorLabel, withOffset: 10)
            loanAmountField.autoPinEdge(toSuperviewEdge: .left, withInset: alpha)
            loanAmountField.autoPinEdge(toSuperviewEdge: .right, withInset: alpha)
            loanAmountField.autoSetDimension(.height, toSize: 40)

            loanAmountBorder.autoPinEdge(toSuperviewEdge: .left)
            loanAmountBorder.autoPinEdge(toSuperviewEdge: .right)
            loanAmountBorder.autoPinEdge(toSuperviewEdge: .bottom)
            loanAmountBorder.autoSetDimension(.height, toSize: 0.7)

            firstNameField.autoPinEdge(.top, to: .bottom, of: loanAmountField, withOffset: 20)
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
            
            middleNameField.autoPinEdge(.top, to: .bottom, of: surNameField, withOffset: 20)
            middleNameField.autoPinEdge(toSuperviewEdge: .left, withInset: alpha)
            middleNameField.autoPinEdge(toSuperviewEdge: .right, withInset: alpha)
            middleNameField.autoSetDimension(.height, toSize: 40)
            
            middleNameBorder.autoPinEdge(toSuperviewEdge: .left)
            middleNameBorder.autoPinEdge(toSuperviewEdge: .right)
            middleNameBorder.autoPinEdge(toSuperviewEdge: .bottom)
            middleNameBorder.autoSetDimension(.height, toSize: 0.7)
            
            aliasOrNicknameField.autoPinEdge(.top, to: .bottom, of: middleNameField, withOffset: 20)
            aliasOrNicknameField.autoPinEdge(toSuperviewEdge: .left, withInset: alpha)
            aliasOrNicknameField.autoPinEdge(toSuperviewEdge: .right, withInset: alpha)
            aliasOrNicknameField.autoSetDimension(.height, toSize: 40)
            
            aliasOrNicknameBorder.autoPinEdge(toSuperviewEdge: .left)
            aliasOrNicknameBorder.autoPinEdge(toSuperviewEdge: .right)
            aliasOrNicknameBorder.autoPinEdge(toSuperviewEdge: .bottom)
            aliasOrNicknameBorder.autoSetDimension(.height, toSize: 0.7)
            
            genderArrowDropDownView.autoPinEdge(toSuperviewEdge: .right, withInset: 0)
            genderArrowDropDownView.autoPinEdge(toSuperviewEdge: .top, withInset: 0)
            genderArrowDropDownView.autoPinEdge(toSuperviewEdge: .bottom, withInset: 1)
            genderArrowDropDownView.autoSetDimension(.width, toSize: 25)
            
            genderArrowDropDownImgView.autoPinEdge(toSuperviewEdge: .top, withInset: 12)
            genderArrowDropDownImgView.autoPinEdge(toSuperviewEdge: .right, withInset: 1)
            genderArrowDropDownImgView.autoSetDimensions(to: CGSize(width: 25, height: 25))
            
            genderField.autoPinEdge(.top, to: .bottom, of: aliasOrNicknameField, withOffset: 20)
            genderField.autoPinEdge(toSuperviewEdge: .left, withInset: alpha)
            genderField.autoPinEdge(toSuperviewEdge: .right, withInset: alpha)
            genderField.autoSetDimension(.height, toSize: 40)
            
            genderAbstract.autoPinEdgesToSuperviewEdges()
            
            genderBorder.autoPinEdge(toSuperviewEdge: .left)
            genderBorder.autoPinEdge(toSuperviewEdge: .right)
            genderBorder.autoPinEdge(toSuperviewEdge: .bottom)
            genderBorder.autoSetDimension(.height, toSize: 0.7)
            
            dobField.autoPinEdge(.top, to: .bottom, of: genderField, withOffset: 20)
            dobField.autoPinEdge(toSuperviewEdge: .left, withInset: alpha)
            dobField.autoPinEdge(toSuperviewEdge: .right, withInset: alpha)
            dobField.autoSetDimension(.height, toSize: 40)
            
            dateRangeView.autoPinEdge(toSuperviewEdge: .right, withInset: 0)
            dateRangeView.autoPinEdge(toSuperviewEdge: .top, withInset: 0)
            dateRangeView.autoPinEdge(toSuperviewEdge: .bottom, withInset: 1)
            dateRangeView.autoSetDimension(.width, toSize: 25)
            
            dateRangeImgView.autoPinEdge(toSuperviewEdge: .top, withInset: 12)
            dateRangeImgView.autoPinEdge(toSuperviewEdge: .right, withInset: 1)
            dateRangeImgView.autoSetDimensions(to: CGSize(width: 25, height: 25))
            
            dobAbstract.autoPinEdgesToSuperviewEdges()
            
            dobBorder.autoPinEdge(toSuperviewEdge: .left)
            dobBorder.autoPinEdge(toSuperviewEdge: .right)
            dobBorder.autoPinEdge(toSuperviewEdge: .bottom)
            dobBorder.autoSetDimension(.height, toSize: 0.7)
            
            emailField.autoPinEdge(.top, to: .bottom, of: dobField, withOffset: 20)
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
            
            idTypeArrowDropDownView.autoPinEdge(toSuperviewEdge: .right, withInset: 0)
            idTypeArrowDropDownView.autoPinEdge(toSuperviewEdge: .top, withInset: 0)
            idTypeArrowDropDownView.autoPinEdge(toSuperviewEdge: .bottom, withInset: 1)
            idTypeArrowDropDownView.autoSetDimension(.width, toSize: 25)
            
            idTypeArrowDropDownImgView.autoPinEdge(toSuperviewEdge: .top, withInset: 12)
            idTypeArrowDropDownImgView.autoPinEdge(toSuperviewEdge: .right, withInset: 1)
            idTypeArrowDropDownImgView.autoSetDimensions(to: CGSize(width: 25, height: 25))
            
            idTypeField.autoPinEdge(.top, to: .bottom, of: parishField, withOffset: 20)
            idTypeField.autoPinEdge(toSuperviewEdge: .left, withInset: alpha)
            idTypeField.autoPinEdge(toSuperviewEdge: .right, withInset: alpha)
            idTypeField.autoSetDimension(.height, toSize: 40)
            
            idTypeAbstract.autoPinEdgesToSuperviewEdges()
            
            idTypeBorder.autoPinEdge(toSuperviewEdge: .left)
            idTypeBorder.autoPinEdge(toSuperviewEdge: .right)
            idTypeBorder.autoPinEdge(toSuperviewEdge: .bottom)
            idTypeBorder.autoSetDimension(.height, toSize: 0.7)
            
            idNumberField.autoPinEdge(.top, to: .bottom, of: idTypeField, withOffset: 20)
            idNumberField.autoPinEdge(toSuperviewEdge: .left, withInset: alpha)
            idNumberField.autoPinEdge(toSuperviewEdge: .right, withInset: alpha)
            idNumberField.autoSetDimension(.height, toSize: 40)
            
            idNumberBorder.autoPinEdge(toSuperviewEdge: .left)
            idNumberBorder.autoPinEdge(toSuperviewEdge: .right)
            idNumberBorder.autoPinEdge(toSuperviewEdge: .bottom)
            idNumberBorder.autoSetDimension(.height, toSize: 0.7)
            
            trnField.autoPinEdge(.top, to: .bottom, of: idNumberField, withOffset: 40)
            trnField.autoPinEdge(toSuperviewEdge: .left, withInset: alpha)
            trnField.autoPinEdge(toSuperviewEdge: .right, withInset: alpha)
            trnField.autoSetDimension(.height, toSize: 40)
            
            trnBorder.autoPinEdge(toSuperviewEdge: .left)
            trnBorder.autoPinEdge(toSuperviewEdge: .right)
            trnBorder.autoPinEdge(toSuperviewEdge: .bottom)
            trnBorder.autoSetDimension(.height, toSize: 0.7)
            
            numberOfDependentsField.autoPinEdge(.top, to: .bottom, of: trnField, withOffset: 20)
            numberOfDependentsField.autoPinEdge(toSuperviewEdge: .left, withInset: alpha)
            numberOfDependentsField.autoPinEdge(toSuperviewEdge: .right, withInset: alpha)
            numberOfDependentsField.autoSetDimension(.height, toSize: 40)
            
            numberOfDependentsBorder.autoPinEdge(toSuperviewEdge: .left)
            numberOfDependentsBorder.autoPinEdge(toSuperviewEdge: .right)
            numberOfDependentsBorder.autoPinEdge(toSuperviewEdge: .bottom)
            numberOfDependentsBorder.autoSetDimension(.height, toSize: 0.7)
            
            homeStatusArrowDropDownView.autoPinEdge(toSuperviewEdge: .right, withInset: 0)
            homeStatusArrowDropDownView.autoPinEdge(toSuperviewEdge: .top, withInset: 0)
            homeStatusArrowDropDownView.autoPinEdge(toSuperviewEdge: .bottom, withInset: 1)
            homeStatusArrowDropDownView.autoSetDimension(.width, toSize: 25)
            
            homeStatusArrowDropDownImgView.autoPinEdge(toSuperviewEdge: .top, withInset: 12)
            homeStatusArrowDropDownImgView.autoPinEdge(toSuperviewEdge: .right, withInset: 1)
            homeStatusArrowDropDownImgView.autoSetDimensions(to: CGSize(width: 25, height: 25))
            
            homeStatusField.autoPinEdge(.top, to: .bottom, of: numberOfDependentsField, withOffset: 20)
            homeStatusField.autoPinEdge(toSuperviewEdge: .left, withInset: alpha)
            homeStatusField.autoPinEdge(toSuperviewEdge: .right, withInset: alpha)
            homeStatusField.autoSetDimension(.height, toSize: 40)
            
            homeStatusAbstract.autoPinEdgesToSuperviewEdges()
            
            homeStatusBorder.autoPinEdge(toSuperviewEdge: .left)
            homeStatusBorder.autoPinEdge(toSuperviewEdge: .right)
            homeStatusBorder.autoPinEdge(toSuperviewEdge: .bottom)
            homeStatusBorder.autoSetDimension(.height, toSize: 0.7)
        }
    }
}
