//
//  PersonalInfoViewController.swift
//  TravelCash
//
//  Created by Thanh-Tam Le on 6/18/17.
//  Copyright © 2017 Tam. All rights reserved.
//

import UIKit
import SwiftOverlays
class PersonalInfoViewController: UIViewController {
    
    let personalInfoView = PersonalInfoView()
    
    override func loadView() {
        view = personalInfoView
        view.setNeedsUpdateConstraints()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //enable swipe back when it changed leftBarButtonItem
        navigationController?.interactivePopGestureRecognizer?.delegate = nil
        
        
        title = "NEW LOAN APPLICATION"
        
        let backBarButton = UIBarButtonItem(image: UIImage(named: "i_nav_back"), style: .done, target: self, action: #selector(actionTapToBackButton))
        backBarButton.tintColor = UIColor.white
        self.navigationItem.leftBarButtonItem = backBarButton
        
        let nextBarButton = UIBarButtonItem(title: "NEXT", style: .done, target: self, action: #selector(actionTapToNextButton))
        nextBarButton.setTitleTextAttributes([NSFontAttributeName: UIFont(name: "OpenSans-semibold", size: 15)!], for: UIControlState.normal)
        self.navigationItem.rightBarButtonItem = nextBarButton
        
        personalInfoView.firstNameField.delegate = self
        personalInfoView.surNameField.delegate = self
        personalInfoView.middleNameField.delegate = self
        personalInfoView.aliasOrNicknameField.delegate = self
        personalInfoView.trnField.delegate = self
        personalInfoView.emailField.delegate = self
        personalInfoView.phoneNumberField.delegate = self
        personalInfoView.addressFirstField.delegate = self
        personalInfoView.addressSecondField.delegate = self
        personalInfoView.idNumberField.delegate = self
        personalInfoView.numberOfDependentsField.delegate = self
        
        personalInfoView.genderAbstract.addGestureRecognizer(UITapGestureRecognizer(target: self, action:  #selector(actionTapToGenderView)))
        personalInfoView.dobAbstract.addGestureRecognizer(UITapGestureRecognizer(target: self, action:  #selector(actionTapToDobView)))
        personalInfoView.parishAbstract.addGestureRecognizer(UITapGestureRecognizer(target: self, action:  #selector(actionTapToParishView)))
        personalInfoView.idTypeAbstract.addGestureRecognizer(UITapGestureRecognizer(target: self, action:  #selector(actionTapToIDTypeView)))
        personalInfoView.homeStatusAbstract.addGestureRecognizer(UITapGestureRecognizer(target: self, action:  #selector(actionTapToHomeStatusView)))

        loadData()
    }

    func loadData() {

        if let user = Global.currentUser {
            personalInfoView.firstNameField.text = user.first_name
            personalInfoView.surNameField.text = user.surname
            personalInfoView.trnField.text = user.trn
            personalInfoView.phoneNumberField.text = user.phone_number
            personalInfoView.emailField.text = user.email
            personalInfoView.addressFirstField.text = user.address_1
            personalInfoView.addressSecondField.text = user.address_2
            personalInfoView.parishField.text = user.parish
            personalInfoView.dobField.text = user.dob
            
            _ = personalInfoView.phoneNumberField.phoneNumberFormat(string: "", range: NSRange(location: user.phone_number.length(), length: 0))
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let rectTitle = NSString(string: personalInfoView.titleLabel.text ?? "").boundingRect(with: CGSize(width: view.frame.width - 20, height: 1000), options: NSStringDrawingOptions.usesFontLeading.union(NSStringDrawingOptions.usesLineFragmentOrigin), attributes: [NSFontAttributeName: UIFont(name: "OpenSans", size: 16)!], context: nil)
        
        let height: CGFloat = 10 + rectTitle.height + 10 + 20 + 10 + 40 + 20 + 40 + 20 + 40 + 20 + 40 + 20 + 40 + 20 + 40 + 20 + 40 + 20 + 40 + 20 + 40 + 20 + 40 + 20 + 40 + 20 + 40 + 20 + 40 + 20 + 40 + 20 + 40 + 20 + 40 + 20 + 20 + 20 + 40 + 20 + 40 + 50
        
        personalInfoView.containerView.autoSetDimension(.height, toSize: height)
        personalInfoView.scrollView.contentSize = personalInfoView.containerView.bounds.size
    }

    func hideAllKeyboard() {
        personalInfoView.loanAmountField.resignFirstResponder()
        personalInfoView.firstNameField.resignFirstResponder()
        personalInfoView.surNameField.resignFirstResponder()
        personalInfoView.middleNameField.resignFirstResponder()
        personalInfoView.aliasOrNicknameField.resignFirstResponder()
        personalInfoView.emailField.resignFirstResponder()
        personalInfoView.phoneNumberField.resignFirstResponder()
        personalInfoView.addressFirstField.resignFirstResponder()
        personalInfoView.addressSecondField.resignFirstResponder()
        personalInfoView.idNumberField.resignFirstResponder()
        personalInfoView.trnField.resignFirstResponder()
        personalInfoView.numberOfDependentsField.resignFirstResponder()
    }

    func actionTapToGenderView() {
        hideAllKeyboard()
        personalInfoView.genderDropDown.dataSource = ["Male", "Female"]
        personalInfoView.genderDropDown.show()
    }
    
    var fromDate : NSDate? {
        didSet {
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
            dateFormatter.dateFormat = "yyyy-MM-dd"
            
            if fromDate != nil {
                personalInfoView.dobField.text = dateFormatter.string(from: fromDate! as Date)
            }
        }
    }
    
    func actionTapToDobView() {
        hideAllKeyboard()
        var date = NSDate()
        if(fromDate != nil) {
            date = fromDate!
        }
        
        var datePickerViewController : UIViewController!
        datePickerViewController = AIDatePickerController.picker(with: date as Date!, selectedBlock: {
            newDate in
            self.fromDate = newDate as NSDate?
            datePickerViewController.dismiss(animated: true, completion: nil)
        }, cancel: {
            datePickerViewController.dismiss(animated: true, completion: nil)
        }) as! UIViewController
        
        datePickerViewController.view.tintColor = Global.colorMain
        
        present(datePickerViewController, animated: true, completion: nil)
    }
    
    func actionTapToParishView() {
        hideAllKeyboard()
        personalInfoView.parishDropDown.dataSource = ["Kingston", "St. Andrew", "St. Catherine", "Clarendon", "Manchester", "St. Elizabeth", "Westmoreland", "Hanover", "St. James", "Trelawny", "St. Ann", "St. Mary", "Portland", "St. Thomas"]
        personalInfoView.parishDropDown.show()
    }
    
    func actionTapToIDTypeView() {
        hideAllKeyboard()
        personalInfoView.idTypeDropDown.dataSource = ["Driver License", "Passport", "Nationality"]
        personalInfoView.idTypeDropDown.show()
    }
    
    func actionTapToHomeStatusView() {
        hideAllKeyboard()
        personalInfoView.homeStatusDropDown.dataSource = ["Own", "Rent", "Other"]
        personalInfoView.homeStatusDropDown.show()
    }
    
    func actionTapToBackButton() {
        navigationController?.popViewController(animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
        isSaving = false
    }
    
    var isSaving = false
    
    func actionTapToNextButton() {
        hideAllKeyboard()

        if isSaving {
            return
        }
        
        if personalInfoView.firstNameField.text == "" {
            Utils.showAlert(title: "Error", message: "First Name can not be empty!", viewController: self)
            return
        }
        
        if personalInfoView.surNameField.text == ""  {
            Utils.showAlert(title: "Error", message: "Surname can not be empty!", viewController: self)
            return
        }
        
        if personalInfoView.genderField.text == "" {
            Utils.showAlert(title: "Error", message: "Gender can not be empty!", viewController: self)
            return
        }
        
        if personalInfoView.dobField.text == ""  {
            Utils.showAlert(title: "Error", message: "DOB can not be empty!", viewController: self)
            return
        }
        
        if personalInfoView.emailField.text == ""  {
            Utils.showAlert(title: "Error", message: "Email can not be empty!", viewController: self)
            return
        }
        
        if personalInfoView.phoneNumberField.text == "" {
            Utils.showAlert(title: "Error", message: "Phone Number can not be empty!", viewController: self)
            return
        }
        
        if personalInfoView.addressFirstField.text == ""  {
            Utils.showAlert(title: "Error", message: "Address 1 can not be empty!", viewController: self)
            return
        }
        
        if personalInfoView.addressSecondField.text == ""  {
            Utils.showAlert(title: "Error", message: "Address 2 can not be empty!", viewController: self)
            return
        }
        
        if personalInfoView.parishField.text == "" {
            Utils.showAlert(title: "Error", message: "Parish can not be empty!", viewController: self)
            return
        }
        
        if personalInfoView.idTypeField.text == "" {
            Utils.showAlert(title: "Error", message: "ID Type can not be empty!", viewController: self)
            return
        }
        
        if personalInfoView.idNumberField.text == ""  {
            Utils.showAlert(title: "Error", message: "ID Number can not be empty!", viewController: self)
            return
        }
        
        if personalInfoView.trnField.text == ""  {
            Utils.showAlert(title: "Error", message: "TRN can not be empty!", viewController: self)
            return
        }
        
        if personalInfoView.numberOfDependentsField.text == ""  {
            Utils.showAlert(title: "Error", message: "Number of Dependents can not be empty!", viewController: self)
            return
        }
        
        if personalInfoView.homeStatusField.text == ""  {
            Utils.showAlert(title: "Error", message: "Home Status can not be empty!", viewController: self)
            return
        }

        isSaving = true

        Global.newLoanApp.personalInfo.loanAmount = personalInfoView.loanAmountField.text ?? ""
        Global.newLoanApp.personalInfo.first_name = personalInfoView.firstNameField.text ?? ""
        Global.newLoanApp.personalInfo.surname = personalInfoView.surNameField.text ?? ""
        Global.newLoanApp.personalInfo.middleName = personalInfoView.middleNameField.text ?? ""
        Global.newLoanApp.personalInfo.aliasOrNickname = personalInfoView.aliasOrNicknameField.text ?? ""
        Global.newLoanApp.personalInfo.gender = personalInfoView.genderField.text ?? ""
        Global.newLoanApp.personalInfo.dob = personalInfoView.dobField.text ?? ""
        Global.newLoanApp.personalInfo.email = personalInfoView.emailField.text ?? ""
        Global.newLoanApp.personalInfo.phone_number = personalInfoView.phoneNumberField.text ?? ""
        Global.newLoanApp.personalInfo.address_1 = personalInfoView.addressFirstField.text ?? ""
        Global.newLoanApp.personalInfo.address_2 = personalInfoView.addressSecondField.text ?? ""
        Global.newLoanApp.personalInfo.parish = personalInfoView.parishField.text ?? ""
        Global.newLoanApp.personalInfo.idType = personalInfoView.idTypeField.text ?? ""
        Global.newLoanApp.personalInfo.idNumber = personalInfoView.idNumberField.text ?? ""
        Global.newLoanApp.personalInfo.trn = personalInfoView.trnField.text ?? ""
        Global.newLoanApp.personalInfo.numberOfDependents = personalInfoView.numberOfDependentsField.text ?? ""
        Global.newLoanApp.personalInfo.homeStatus = personalInfoView.homeStatusField.text ?? ""
        
        let viewController = BankInfoViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func checkInput(textField: UITextField, value: String?) -> Bool {
        switch textField {
        case personalInfoView.firstNameField:
            if value != nil && value!.isValidName() {
                personalInfoView.errorLabel.text = nil
                personalInfoView.firstNameBorder.backgroundColor = Global.colorSeparator
                return true
            }
            personalInfoView.errorLabel.text = "Invalid First Name"
            personalInfoView.firstNameBorder.backgroundColor = UIColor.red.withAlphaComponent(0.8)
            
        case personalInfoView.surNameField:
            if value != nil && value!.isValidName() {
                personalInfoView.errorLabel.text = nil
                personalInfoView.surNameBorder.backgroundColor = Global.colorSeparator
                return true
            }
            personalInfoView.errorLabel.text = "Invalid Surname"
            personalInfoView.surNameBorder.backgroundColor = UIColor.red.withAlphaComponent(0.8)
            
        case personalInfoView.trnField:
            if value != nil && value!.isValidTRN() {
                personalInfoView.errorLabel.text = nil
                personalInfoView.trnBorder.backgroundColor = Global.colorSeparator
                return true
            }
            personalInfoView.errorLabel.text = "Invalid TRN"
            personalInfoView.trnBorder.backgroundColor = UIColor.red.withAlphaComponent(0.8)
            
        case personalInfoView.phoneNumberField:
            if value != nil && value!.isValidPhone() {
                personalInfoView.errorLabel.text = nil
                personalInfoView.phoneNumberBorder.backgroundColor = Global.colorSeparator
                return true
            }
            personalInfoView.errorLabel.text = "Invalid Phone Number"
            personalInfoView.phoneNumberBorder.backgroundColor = UIColor.red.withAlphaComponent(0.8)
            
        case personalInfoView.emailField:
            if value != nil && value!.isValidEmail() {
                personalInfoView.errorLabel.text = nil
                personalInfoView.emailBorder.backgroundColor = Global.colorSeparator
                return true
            }
            personalInfoView.errorLabel.text = "Invalid Email"
            personalInfoView.emailBorder.backgroundColor = UIColor.red.withAlphaComponent(0.8)
            
        case personalInfoView.addressFirstField:
            if value != nil && value!.isValidName() {
                personalInfoView.errorLabel.text = nil
                personalInfoView.addressFirstBorder.backgroundColor = Global.colorSeparator
                return true
            }
            personalInfoView.errorLabel.text = "Invalid Address 1"
            personalInfoView.addressFirstBorder.backgroundColor = UIColor.red.withAlphaComponent(0.8)
            
        case personalInfoView.addressSecondField:
            if value != nil && value!.isValidName() {
                personalInfoView.errorLabel.text = nil
                personalInfoView.addressSecondBorder.backgroundColor = Global.colorSeparator
                return true
            }
            personalInfoView.errorLabel.text = "Invalid Address 2"
            personalInfoView.addressSecondBorder.backgroundColor = UIColor.red.withAlphaComponent(0.8)
            
        case personalInfoView.idNumberField:
            if value != nil && value!.isValidNumber() {
                personalInfoView.errorLabel.text = nil
                personalInfoView.idNumberBorder.backgroundColor = Global.colorSeparator
                return true
            }
            personalInfoView.errorLabel.text = "Invalid ID Number"
            personalInfoView.idNumberBorder.backgroundColor = UIColor.red.withAlphaComponent(0.8)
            
        case personalInfoView.numberOfDependentsField:
            if value != nil && value!.isValidNumber() {
                personalInfoView.errorLabel.text = nil
                personalInfoView.numberOfDependentsBorder.backgroundColor = Global.colorSeparator
                return true
            }
            personalInfoView.errorLabel.text = "Invalid Number of Dependents"
            personalInfoView.numberOfDependentsBorder.backgroundColor = UIColor.red.withAlphaComponent(0.8)
            
        default:
            return true
        }
        return false
    }
}

extension PersonalInfoViewController: UITextFieldDelegate {

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let newString = NSString(string: textField.text!).replacingCharacters(in: range, with: string)
        _ = checkInput(textField: textField, value: newString)

        if (textField == personalInfoView.trnField) {
            return textField.TRNFormat(string: string, range: range)
        }
        else if (textField == personalInfoView.phoneNumberField) {
            return textField.phoneNumberFormat(string: string, range: range)
        }
        else {
            return true
        }
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case personalInfoView.firstNameField:
            if checkInput(textField: textField, value: textField.text) {
                textField.resignFirstResponder()
                personalInfoView.surNameField.becomeFirstResponder()
                return true
            }
        case personalInfoView.surNameField:
            if checkInput(textField: textField, value: textField.text) {
                textField.resignFirstResponder()
                personalInfoView.middleNameField.becomeFirstResponder()
                return true
            }
        case personalInfoView.middleNameField:
            if checkInput(textField: textField, value: textField.text) {
                textField.resignFirstResponder()
                personalInfoView.aliasOrNicknameField.becomeFirstResponder()
                return true
            }
        case personalInfoView.aliasOrNicknameField:
            if checkInput(textField: textField, value: textField.text) {
                textField.resignFirstResponder()
                actionTapToGenderView()
                return true
            }
        case personalInfoView.emailField:
            if checkInput(textField: textField, value: textField.text) {
                textField.resignFirstResponder()
                personalInfoView.phoneNumberField.becomeFirstResponder()
                return true
            }
        case personalInfoView.phoneNumberField:
            if checkInput(textField: textField, value: textField.text) {
                textField.resignFirstResponder()
                personalInfoView.addressFirstField.becomeFirstResponder()
                return true
            }
        case personalInfoView.addressFirstField:
            if checkInput(textField: textField, value: textField.text) {
                textField.resignFirstResponder()
                personalInfoView.addressSecondField.becomeFirstResponder()
                return true
            }
        case personalInfoView.addressSecondField:
            if checkInput(textField: textField, value: textField.text) {
                textField.resignFirstResponder()
                actionTapToParishView()
                return true
            }
        case personalInfoView.idNumberField:
            if checkInput(textField: textField, value: textField.text) {
                textField.resignFirstResponder()
                personalInfoView.trnField.becomeFirstResponder()
                return true
            }
        case personalInfoView.trnField:
            if checkInput(textField: textField, value: textField.text) {
                textField.resignFirstResponder()
                personalInfoView.numberOfDependentsField.becomeFirstResponder()
                return true
            }
        default:
            if checkInput(textField: textField, value: textField.text) {
                textField.resignFirstResponder()
                return true
            }
        }
        return false
    }
}
