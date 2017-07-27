//
//  WorkingInfoViewController.swift
//  TravelCash
//
//  Created by Thanh-Tam Le on 6/18/17.
//  Copyright © 2017 Tam. All rights reserved.
//

import UIKit

class WorkingInfoViewController: UIViewController {
    
    let workingInfoView = WorkingInfoView()
    
    override func loadView() {
        view = workingInfoView
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
        
        workingInfoView.employerField.delegate = self
        workingInfoView.phoneNumberField.delegate = self
        workingInfoView.addressFirstField.delegate = self
        workingInfoView.addressSecondField.delegate = self
        workingInfoView.yearField.delegate = self
        workingInfoView.monthField.delegate = self
        workingInfoView.occupationField.delegate = self
        workingInfoView.netIncomeField.delegate = self
        
        workingInfoView.parishAbstract.addGestureRecognizer(UITapGestureRecognizer(target: self, action:  #selector(actionTapToParishView)))
        workingInfoView.salaryCycleAbstract.addGestureRecognizer(UITapGestureRecognizer(target: self, action:  #selector(actionTapToSalaryCycleView)))
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let rectTitle = NSString(string: workingInfoView.titleLabel.text ?? "").boundingRect(with: CGSize(width: view.frame.width - 20, height: 1000), options: NSStringDrawingOptions.usesFontLeading.union(NSStringDrawingOptions.usesLineFragmentOrigin), attributes: [NSFontAttributeName: UIFont(name: "OpenSans", size: 16)!], context: nil)
        
        let height: CGFloat = 10 + rectTitle.height + 20 + 20 + 10 + 20 + 10 + 40 + 20 + 40 + 20 + 40 + 20 + 40 + 20 + 40 + 20 + 40 + 20 + 40 + 20 + 40 + 20 + 20 + 20 + 40 + 20 + 40 + 50
        
        workingInfoView.containerView.autoSetDimension(.height, toSize: height)
        workingInfoView.scrollView.contentSize = workingInfoView.containerView.bounds.size
    }

    func hideAllKeyboard() {
        workingInfoView.employerField.resignFirstResponder()
        workingInfoView.addressFirstField.resignFirstResponder()
        workingInfoView.addressSecondField.resignFirstResponder()
        workingInfoView.phoneNumberField.resignFirstResponder()
        workingInfoView.yearField.resignFirstResponder()
        workingInfoView.monthField.resignFirstResponder()
        workingInfoView.occupationField.resignFirstResponder()
        workingInfoView.netIncomeField.resignFirstResponder()
    }

    func actionTapToParishView() {
        hideAllKeyboard()
        workingInfoView.parishDropDown.dataSource = ["Kingston", "St. Andrew", "St. Catherine", "Clarendon", "Manchester", "St. Elizabeth", "Westmoreland", "Hanover", "St. James", "Trelawny", "St. Ann", "St. Mary", "Portland", "St. Thomas"]
        workingInfoView.parishDropDown.show()
    }
    
    func actionTapToSalaryCycleView() {
        hideAllKeyboard()
        workingInfoView.salaryCycleDropDown.dataSource = ["Weekly", "Bi-Weekly", "Monthly"]
        workingInfoView.salaryCycleDropDown.show()
    }
    
    func actionTapToBackButton() {
        navigationController?.popViewController(animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        isSaving = false
    }
    
    var isSaving = false
    
    func actionTapToNextButton() {
        hideAllKeyboard()

        if isSaving {
            return
        }

        if workingInfoView.checkBox.on {
            if workingInfoView.occupationField.text == "" {
                Utils.showAlert(title: "Error", message: "Occupation can not be empty!", viewController: self)
                return
            }

            if workingInfoView.netIncomeField.text == ""  {
                Utils.showAlert(title: "Error", message: "Net Income can not be empty!", viewController: self)
                return
            }

            if workingInfoView.salaryCycleField.text == "" {
                Utils.showAlert(title: "Error", message: "Salary Cycle can not be empty!", viewController: self)
                return
            }
        }
        
        isSaving = true

        Global.newLoanApp.workingInfo.employer = workingInfoView.employerField.text ?? ""
        Global.newLoanApp.workingInfo.employerAddress_1 = workingInfoView.addressFirstField.text ?? ""
        Global.newLoanApp.workingInfo.employerAddress_2 = workingInfoView.addressSecondField.text ?? ""
        Global.newLoanApp.workingInfo.employerParish = workingInfoView.parishField.text ?? ""
        Global.newLoanApp.workingInfo.employerPhone = workingInfoView.phoneNumberField.text ?? ""
        Global.newLoanApp.workingInfo.employerYears = workingInfoView.yearField.text ?? ""
        Global.newLoanApp.workingInfo.employerMonths = workingInfoView.monthField.text ?? ""
        Global.newLoanApp.workingInfo.employerOccupation = workingInfoView.occupationField.text ?? ""
        Global.newLoanApp.workingInfo.employerNetIncome = workingInfoView.netIncomeField.text ?? ""
        Global.newLoanApp.workingInfo.employerSalaryCycle = workingInfoView.salaryCycleField.text ?? ""
        
        let viewController = ReferenceInfoViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func checkInput(textField: UITextField, value: String?) -> Bool {
        switch textField {
        case workingInfoView.employerField:
            if value != nil && value!.isValidName() {
                workingInfoView.errorLabel.text = nil
                workingInfoView.employerBorder.backgroundColor = Global.colorSeparator
                return true
            }
            workingInfoView.errorLabel.text = "Invalid Employer"
            workingInfoView.employerBorder.backgroundColor = UIColor.red.withAlphaComponent(0.8)
            
        case workingInfoView.phoneNumberField:
            if value != nil && value!.isValidPhone() {
                workingInfoView.errorLabel.text = nil
                workingInfoView.phoneNumberBorder.backgroundColor = Global.colorSeparator
                return true
            }
            workingInfoView.errorLabel.text = "Invalid Phone Number"
            workingInfoView.phoneNumberBorder.backgroundColor = UIColor.red.withAlphaComponent(0.8)
            
        case workingInfoView.addressFirstField:
            if value != nil && value!.isValidName() {
                workingInfoView.errorLabel.text = nil
                workingInfoView.addressFirstBorder.backgroundColor = Global.colorSeparator
                return true
            }
            workingInfoView.errorLabel.text = "Invalid Address 1"
            workingInfoView.addressFirstBorder.backgroundColor = UIColor.red.withAlphaComponent(0.8)
            
        case workingInfoView.addressSecondField:
            if value != nil && value!.isValidName() {
                workingInfoView.errorLabel.text = nil
                workingInfoView.addressSecondBorder.backgroundColor = Global.colorSeparator
                return true
            }
            workingInfoView.errorLabel.text = "Invalid Address 2"
            workingInfoView.addressSecondBorder.backgroundColor = UIColor.red.withAlphaComponent(0.8)
            
        case workingInfoView.netIncomeField:
            if value != nil && value!.isValidNumber() {
                workingInfoView.errorLabel.text = nil
                workingInfoView.netIncomeBorder.backgroundColor = Global.colorSeparator
                return true
            }
            workingInfoView.errorLabel.text = "Invalid Net Income"
            workingInfoView.netIncomeBorder.backgroundColor = UIColor.red.withAlphaComponent(0.8)
           
        case workingInfoView.monthField:
            if value != nil && value!.isValidNumber() {
                workingInfoView.errorLabel.text = nil
                workingInfoView.monthBorder.backgroundColor = Global.colorSeparator
                return true
            }
            workingInfoView.errorLabel.text = "Invalid Months"
            workingInfoView.monthBorder.backgroundColor = UIColor.red.withAlphaComponent(0.8)
       
        case workingInfoView.yearField:
            if value != nil && value!.isValidNumber() {
                workingInfoView.errorLabel.text = nil
                workingInfoView.yearBorder.backgroundColor = Global.colorSeparator
                return true
            }
            workingInfoView.errorLabel.text = "Invalid Years"
            workingInfoView.yearBorder.backgroundColor = UIColor.red.withAlphaComponent(0.8)
            
        case workingInfoView.occupationField:
            if value != nil && value!.isValidName() {
                workingInfoView.errorLabel.text = nil
                workingInfoView.occupationBorder.backgroundColor = Global.colorSeparator
                return true
            }
            workingInfoView.errorLabel.text = "Invalid Occupation"
            workingInfoView.occupationBorder.backgroundColor = UIColor.red.withAlphaComponent(0.8)
            
        default:
            return true
        }
        return false
    }
}

extension WorkingInfoViewController: UITextFieldDelegate {

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let newString = NSString(string: textField.text!).replacingCharacters(in: range, with: string)
        _ = checkInput(textField: textField, value: newString)

        if (textField == workingInfoView.phoneNumberField) {
            return textField.phoneNumberFormat(string: string, range: range)
        }
        else {
            return true
        }
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case workingInfoView.employerField:
            if checkInput(textField: textField, value: textField.text) {
                textField.resignFirstResponder()
                workingInfoView.addressFirstField.becomeFirstResponder()
                return true
            }
        case workingInfoView.addressFirstField:
            if checkInput(textField: textField, value: textField.text) {
                textField.resignFirstResponder()
                workingInfoView.addressSecondField.becomeFirstResponder()
                return true
            }
        case workingInfoView.addressSecondField:
            if checkInput(textField: textField, value: textField.text) {
                textField.resignFirstResponder()
                actionTapToParishView()
                return true
            }
        case workingInfoView.phoneNumberField:
            if checkInput(textField: textField, value: textField.text) {
                textField.resignFirstResponder()
                workingInfoView.yearField.becomeFirstResponder()
                return true
            }
        case workingInfoView.yearField:
            if checkInput(textField: textField, value: textField.text) {
                textField.resignFirstResponder()
                workingInfoView.monthField.becomeFirstResponder()
                return true
            }
        case workingInfoView.monthField:
            if checkInput(textField: textField, value: textField.text) {
                textField.resignFirstResponder()
                workingInfoView.occupationField.becomeFirstResponder()
                return true
            }
        case workingInfoView.occupationField:
            if checkInput(textField: textField, value: textField.text) {
                textField.resignFirstResponder()
                workingInfoView.netIncomeField.becomeFirstResponder()
                return true
            }
        case workingInfoView.netIncomeField:
            if checkInput(textField: textField, value: textField.text) {
                textField.resignFirstResponder()
                actionTapToSalaryCycleView()
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
