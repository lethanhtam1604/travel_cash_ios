//
//  NextOfSkinViewController.swift
//  TravelCash
//
//  Created by Thanh-Tam Le on 6/19/17.
//  Copyright © 2017 Tam. All rights reserved.
//

import UIKit

class NextOfSkinViewController: UIViewController {
    
    let nextOfSkinView = NextOfSkinView()
    
    override func loadView() {
        view = nextOfSkinView
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
        
        nextOfSkinView.fullNameField.delegate = self
        nextOfSkinView.phoneNumberField.delegate = self
        nextOfSkinView.addressFirstField.delegate = self
        nextOfSkinView.addressSecondField.delegate = self
        
        nextOfSkinView.parishAbstract.addGestureRecognizer(UITapGestureRecognizer(target: self, action:  #selector(actionTapToParishView)))
        nextOfSkinView.relationshipAbstract.addGestureRecognizer(UITapGestureRecognizer(target: self, action:  #selector(actionTapToRelationshipView)))
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let rectTitle = NSString(string: nextOfSkinView.titleLabel.text ?? "").boundingRect(with: CGSize(width: view.frame.width - 20, height: 1000), options: NSStringDrawingOptions.usesFontLeading.union(NSStringDrawingOptions.usesLineFragmentOrigin), attributes: [NSFontAttributeName: UIFont(name: "OpenSans", size: 16)!], context: nil)
        
        let height: CGFloat = 10 + rectTitle.height + 10 + 20 + 10 + 40 + 20 + 40 + 20 + 40 + 20 + 40 + 20 + 40 + 20 + 40 + 20 + 40 + 20 + 40 + 50
        
        nextOfSkinView.containerView.autoSetDimension(.height, toSize: height)
        nextOfSkinView.scrollView.contentSize = nextOfSkinView.containerView.bounds.size
    }

    func hideAllKeyboard() {
        nextOfSkinView.fullNameField.resignFirstResponder()
        nextOfSkinView.phoneNumberField.resignFirstResponder()
        nextOfSkinView.addressFirstField.resignFirstResponder()
        nextOfSkinView.addressSecondField.resignFirstResponder()
    }

    func actionTapToParishView() {
        hideAllKeyboard()
        nextOfSkinView.parishDropDown.dataSource = ["Kingston", "St. Andrew", "St. Catherine", "Clarendon", "Manchester", "St. Elizabeth", "Westmoreland", "Hanover", "St. James", "Trelawny", "St. Ann", "St. Mary", "Portland", "St. Thomas"]
        nextOfSkinView.parishDropDown.show()
    }
    
    func actionTapToRelationshipView() {
        hideAllKeyboard()
        nextOfSkinView.relationshipDropDown.dataSource = ["Mother", "Father", "Sister", "Brother", "Aunt", "Uncle", "Cousin", "Wife", "Husband"]
        nextOfSkinView.relationshipDropDown.show()
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
        
        if nextOfSkinView.fullNameField.text == "" {
            Utils.showAlert(title: "Error", message: "Full Name can not be empty!", viewController: self)
            return
        }
        
        if nextOfSkinView.phoneNumberField.text == ""  {
            Utils.showAlert(title: "Error", message: "Phone Number can not be empty!", viewController: self)
            return
        }
        
        if nextOfSkinView.addressFirstField.text == "" {
            Utils.showAlert(title: "Error", message: "Address 1 can not be empty!", viewController: self)
            return
        }
        
        if nextOfSkinView.addressSecondField.text == "" {
            Utils.showAlert(title: "Error", message: "Address 2 can not be empty!", viewController: self)
            return
        }
        
        if nextOfSkinView.parishField.text == "" {
            Utils.showAlert(title: "Error", message: "Parish can not be empty!", viewController: self)
            return
        }
        
        if nextOfSkinView.relationshipField.text == "" {
            Utils.showAlert(title: "Error", message: "Relationship can not be empty!", viewController: self)
            return
        }

        isSaving = true

        Global.newLoanApp.skin.skinFullName = nextOfSkinView.fullNameField.text ?? ""
        Global.newLoanApp.skin.skinPhone = nextOfSkinView.phoneNumberField.text ?? ""
        Global.newLoanApp.skin.skinAddress_1 = nextOfSkinView.addressFirstField.text ?? ""
        Global.newLoanApp.skin.skinAddress_2 = nextOfSkinView.addressSecondField.text ?? ""
        Global.newLoanApp.skin.skinParish = nextOfSkinView.parishField.text ?? ""
        Global.newLoanApp.skin.skinRelationship = nextOfSkinView.relationshipField.text ?? ""

        let viewController = AttachmentViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func checkInput(textField: UITextField, value: String?) -> Bool {
        switch textField {
        case nextOfSkinView.fullNameField:
            if value != nil && value!.isValidName() {
                nextOfSkinView.errorLabel.text = nil
                nextOfSkinView.fullNameBorder.backgroundColor = Global.colorSeparator
                return true
            }
            nextOfSkinView.errorLabel.text = "Invalid Full Name"
            nextOfSkinView.fullNameBorder.backgroundColor = UIColor.red.withAlphaComponent(0.8)
            
        case nextOfSkinView.phoneNumberField:
            if value != nil && value!.isValidPhone() {
                nextOfSkinView.errorLabel.text = nil
                nextOfSkinView.phoneNumberBorder.backgroundColor = Global.colorSeparator
                return true
            }
            nextOfSkinView.errorLabel.text = "Invalid Phone Number"
            nextOfSkinView.phoneNumberBorder.backgroundColor = UIColor.red.withAlphaComponent(0.8)
            
        case nextOfSkinView.addressFirstField:
            if value != nil && value!.isValidName() {
                nextOfSkinView.errorLabel.text = nil
                nextOfSkinView.addressFirstBorder.backgroundColor = Global.colorSeparator
                return true
            }
            nextOfSkinView.errorLabel.text = "Invalid Address 1"
            nextOfSkinView.addressFirstBorder.backgroundColor = UIColor.red.withAlphaComponent(0.8)
            
        case nextOfSkinView.addressSecondField:
            if value != nil && value!.isValidName() {
                nextOfSkinView.errorLabel.text = nil
                nextOfSkinView.addressSecondBorder.backgroundColor = Global.colorSeparator
                return true
            }
            nextOfSkinView.errorLabel.text = "Invalid Address 2"
            nextOfSkinView.addressSecondBorder.backgroundColor = UIColor.red.withAlphaComponent(0.8)
            
        default:
            return true
        }
        return false
    }
}

extension NextOfSkinViewController: UITextFieldDelegate {

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let newString = NSString(string: textField.text!).replacingCharacters(in: range, with: string)
        _ = checkInput(textField: textField, value: newString)

        if (textField == nextOfSkinView.phoneNumberField) {
            return textField.phoneNumberFormat(string: string, range: range)
        }
        else {
            return true
        }
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case nextOfSkinView.fullNameField:
            if checkInput(textField: textField, value: textField.text) {
                textField.resignFirstResponder()
                nextOfSkinView.phoneNumberField.becomeFirstResponder()
                return true
            }
        case nextOfSkinView.phoneNumberField:
            if checkInput(textField: textField, value: textField.text) {
                textField.resignFirstResponder()
                nextOfSkinView.addressFirstField.becomeFirstResponder()
                return true
            }
        case nextOfSkinView.addressFirstField:
            if checkInput(textField: textField, value: textField.text) {
                textField.resignFirstResponder()
                nextOfSkinView.addressSecondField.becomeFirstResponder()
                return true
            }
        case nextOfSkinView.addressSecondField:
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
