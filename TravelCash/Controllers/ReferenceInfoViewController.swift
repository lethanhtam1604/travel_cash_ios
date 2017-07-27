//
//  ReferenceInfoViewController.swift
//  TravelCash
//
//  Created by Thanh-Tam Le on 6/18/17.
//  Copyright © 2017 Tam. All rights reserved.
//

import UIKit

class ReferenceInfoViewController: UIViewController {
    
    let referenceInfoView = ReferenceInfoView()
    
    override func loadView() {
        view = referenceInfoView
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
        
        referenceInfoView.fullNameField.delegate = self
        referenceInfoView.phoneNumberField.delegate = self
        referenceInfoView.addressFirstField.delegate = self
        referenceInfoView.addressSecondField.delegate = self
        
        referenceInfoView.parishAbstract.addGestureRecognizer(UITapGestureRecognizer(target: self, action:  #selector(actionTapToParishView)))
        referenceInfoView.relationshipAbstract.addGestureRecognizer(UITapGestureRecognizer(target: self, action:  #selector(actionTapToRelationshipView)))
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let rectTitle = NSString(string: referenceInfoView.titleLabel.text ?? "").boundingRect(with: CGSize(width: view.frame.width - 20, height: 1000), options: NSStringDrawingOptions.usesFontLeading.union(NSStringDrawingOptions.usesLineFragmentOrigin), attributes: [NSFontAttributeName: UIFont(name: "OpenSans", size: 16)!], context: nil)
        
        let height: CGFloat = 10 + rectTitle.height + 10 + 20 + 10 + 40 + 20 + 40 + 20 + 40 + 20 + 40 + 20 + 40 + 20 + 40 + 20 + 40 + 20 + 40 + 50
        
        referenceInfoView.containerView.autoSetDimension(.height, toSize: height)
        referenceInfoView.scrollView.contentSize = referenceInfoView.containerView.bounds.size
    }

    func hideAllKeyboard() {
        referenceInfoView.fullNameField.resignFirstResponder()
        referenceInfoView.phoneNumberField.resignFirstResponder()
        referenceInfoView.addressFirstField.resignFirstResponder()
        referenceInfoView.addressSecondField.resignFirstResponder()
    }
    
    func actionTapToParishView() {
        hideAllKeyboard()
        referenceInfoView.parishDropDown.dataSource = ["Kingston", "St. Andrew", "St. Catherine", "Clarendon", "Manchester", "St. Elizabeth", "Westmoreland", "Hanover", "St. James", "Trelawny", "St. Ann", "St. Mary", "Portland", "St. Thomas"]
        referenceInfoView.parishDropDown.show()
    }
    
    func actionTapToRelationshipView() {
        hideAllKeyboard()
        referenceInfoView.relationshipDropDown.dataSource = ["Mother", "Father", "Sister", "Brother", "Aunt", "Uncle", "Cousin", "Wife", "Husband"]
        referenceInfoView.relationshipDropDown.show()
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
        
        if referenceInfoView.fullNameField.text == "" {
            Utils.showAlert(title: "Error", message: "Full Name can not be empty!", viewController: self)
            return
        }
        
        if referenceInfoView.phoneNumberField.text == ""  {
            Utils.showAlert(title: "Error", message: "Phone Number can not be empty!", viewController: self)
            return
        }
        
        if referenceInfoView.addressFirstField.text == "" {
            Utils.showAlert(title: "Error", message: "Address 1 can not be empty!", viewController: self)
            return
        }
        
        if referenceInfoView.addressSecondField.text == "" {
            Utils.showAlert(title: "Error", message: "Address 2 can not be empty!", viewController: self)
            return
        }
        
        if referenceInfoView.parishField.text == "" {
            Utils.showAlert(title: "Error", message: "Parish can not be empty!", viewController: self)
            return
        }
        
        if referenceInfoView.relationshipField.text == "" {
            Utils.showAlert(title: "Error", message: "Relationship can not be empty!", viewController: self)
            return
        }
        
        isSaving = true

        Global.newLoanApp.referenceInfo.refFullName = referenceInfoView.fullNameField.text ?? ""
        Global.newLoanApp.referenceInfo.refPhone = referenceInfoView.phoneNumberField.text ?? ""
        Global.newLoanApp.referenceInfo.refAddress_1 = referenceInfoView.addressFirstField.text ?? ""
        Global.newLoanApp.referenceInfo.refAddress_2 = referenceInfoView.addressSecondField.text ?? ""
        Global.newLoanApp.referenceInfo.refParish = referenceInfoView.parishField.text ?? ""
        Global.newLoanApp.referenceInfo.refRelationship = referenceInfoView.relationshipField.text ?? ""

        let viewController = NextOfSkinViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func checkInput(textField: UITextField, value: String?) -> Bool {
        switch textField {
        case referenceInfoView.fullNameField:
            if value != nil && value!.isValidName() {
                referenceInfoView.errorLabel.text = nil
                referenceInfoView.fullNameBorder.backgroundColor = Global.colorSeparator
                return true
            }
            referenceInfoView.errorLabel.text = "Invalid Full Name"
            referenceInfoView.fullNameBorder.backgroundColor = UIColor.red.withAlphaComponent(0.8)
            
        case referenceInfoView.phoneNumberField:
            if value != nil && value!.isValidPhone() {
                referenceInfoView.errorLabel.text = nil
                referenceInfoView.phoneNumberBorder.backgroundColor = Global.colorSeparator
                return true
            }
            referenceInfoView.errorLabel.text = "Invalid Phone Number"
            referenceInfoView.phoneNumberBorder.backgroundColor = UIColor.red.withAlphaComponent(0.8)
            
        case referenceInfoView.addressFirstField:
            if value != nil && value!.isValidName() {
                referenceInfoView.errorLabel.text = nil
                referenceInfoView.addressFirstBorder.backgroundColor = Global.colorSeparator
                return true
            }
            referenceInfoView.errorLabel.text = "Invalid Address 1"
            referenceInfoView.addressFirstBorder.backgroundColor = UIColor.red.withAlphaComponent(0.8)
            
        case referenceInfoView.addressSecondField:
            if value != nil && value!.isValidName() {
                referenceInfoView.errorLabel.text = nil
                referenceInfoView.addressSecondBorder.backgroundColor = Global.colorSeparator
                return true
            }
            referenceInfoView.errorLabel.text = "Invalid Address 2"
            referenceInfoView.addressSecondBorder.backgroundColor = UIColor.red.withAlphaComponent(0.8)
            
        default:
            return true
        }
        return false
    }
}

extension ReferenceInfoViewController: UITextFieldDelegate {

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let newString = NSString(string: textField.text!).replacingCharacters(in: range, with: string)
        _ = checkInput(textField: textField, value: newString)

        if (textField == referenceInfoView.phoneNumberField) {
            return textField.phoneNumberFormat(string: string, range: range)
        }
        else {
            return true
        }
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case referenceInfoView.fullNameField:
            if checkInput(textField: textField, value: textField.text) {
                textField.resignFirstResponder()
                referenceInfoView.phoneNumberField.becomeFirstResponder()
                return true
            }
        case referenceInfoView.phoneNumberField:
            if checkInput(textField: textField, value: textField.text) {
                textField.resignFirstResponder()
                referenceInfoView.addressFirstField.becomeFirstResponder()
                return true
            }
        case referenceInfoView.addressFirstField:
            if checkInput(textField: textField, value: textField.text) {
                textField.resignFirstResponder()
                referenceInfoView.addressSecondField.becomeFirstResponder()
                return true
            }
        case referenceInfoView.addressSecondField:
            if checkInput(textField: textField, value: textField.text) {
                textField.resignFirstResponder()
                actionTapToParishView()
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
