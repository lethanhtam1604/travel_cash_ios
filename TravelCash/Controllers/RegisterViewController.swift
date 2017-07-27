
//
//  RegisterViewController.swift
//  TravelCash
//
//  Created by Thanh-Tam Le on 6/14/17.
//  Copyright © 2017 Tam. All rights reserved.
//

import UIKit
import FRHyperLabel
import STPopup
import SwiftOverlays

class RegisterViewController: UIViewController, UITextFieldDelegate, DisclaimerDelegate {
    
    let registerView = RegisterView()
    var viewPopupController: STPopupController!
    
    override func loadView() {
        view = registerView
        view.setNeedsUpdateConstraints()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.barTintColor = Global.colorNavBar
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white, NSFontAttributeName: UIFont(name: "OpenSans-semibold", size: 15)!]
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = false
        
        title = "CREATE YOUR ACCOUNT"
        
        let closeBarButton = UIBarButtonItem(image: UIImage(named: "ic_close_white"), style: .done, target: self, action: #selector(actionTapToCloseButton))
        closeBarButton.tintColor = UIColor.white
        self.navigationItem.rightBarButtonItem = closeBarButton
        
        registerView.firstNameField.delegate = self
        registerView.surNameField.delegate = self
        registerView.trnField.delegate = self
        registerView.emailField.delegate = self
        registerView.phoneNumberField.delegate = self
        registerView.passwordField.delegate = self
        registerView.confirmPasswordField.delegate = self

        registerView.nextButton.addTarget(self, action: #selector(actionTapToNextButton), for: .touchUpInside)
        
        let handler = { (hyperLabel: FRHyperLabel?, substring: String?) -> Void in
            
            if substring == "Terms of Use" {
                let viewController = TermsViewController()
                viewController.disclaimerDelegate = self
                self.viewPopupController = STPopupController(rootViewController: viewController)
                self.viewPopupController.containerView.layer.cornerRadius = 4
                self.viewPopupController.present(in: self)

            }
            else if substring == "Privacy Policy" {
                let viewController = PrivacyViewController()
                viewController.disclaimerDelegate = self
                self.viewPopupController = STPopupController(rootViewController: viewController)
                self.viewPopupController.containerView.layer.cornerRadius = 4
                self.viewPopupController.present(in: self)
            }
        }
        
        registerView.termsAndPrivacyLabel.setLinksForSubstrings(["Terms of Use", "Privacy Policy"], withLinkHandler: handler)
    }
    
    func actionTapToOkButton() {
        viewPopupController.dismiss()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let termsHeight: CGFloat = (self.registerView.termsAndPrivacyLabel.attributedText?.height(withConstrainedWidth: view.frame.width - 20))!
        
        let height: CGFloat = 10 + 20 + 10 + 40 + 20 + 40 + 20 + 40 + 20 + 40 + 20 + 40 + 20 + 40 + 20 + 40 + 30 + 45 + 20 + 10 + termsHeight
        
        registerView.containerView.autoSetDimension(.height, toSize: height)
        registerView.scrollView.contentSize = registerView.containerView.bounds.size
    }
    
    func actionTapToNextButton() {
        
        if registerView.firstNameField.text == "" {
            Utils.showAlert(title: "Error", message: "First Name can not be empty!", viewController: self)
            return
        }
        
        if registerView.surNameField.text == "" {
            Utils.showAlert(title: "Error", message: "Surname can not be empty!", viewController: self)
            return
        }
        
        if registerView.trnField.text == "" {
            Utils.showAlert(title: "Error", message: "TRN can not be empty!", viewController: self)
            return
        }
        
        if registerView.emailField.text == "" {
            Utils.showAlert(title: "Error", message: "Email can not be empty!", viewController: self)
            return
        }
        
        if registerView.phoneNumberField.text == "" {
            Utils.showAlert(title: "Error", message: "Phone Number can not be empty!", viewController: self)
            return
        }
        
        if registerView.passwordField.text == "" {
            Utils.showAlert(title: "Error", message: "Password can not be empty!", viewController: self)
            return
        }
        
        if registerView.confirmPasswordField.text == "" {
            Utils.showAlert(title: "Error", message: "Confirm Password can not be empty!", viewController: self)
            return
        }

        if registerView.passwordField.text != registerView.confirmPasswordField.text {
            Utils.showAlert(title: "Error", message: "Confirm Password Mismatch!", viewController: self)
            return
        }

        let user = User()
        user.first_name = registerView.firstNameField.text ?? ""
        user.surname = registerView.surNameField.text ?? ""
        user.trn = registerView.trnField.text ?? ""
        user.email = registerView.emailField.text ?? ""
        user.phone_number = registerView.phoneNumberField.text ?? ""
        user.pass = registerView.passwordField.text ?? ""

        SwiftOverlays.showBlockingWaitOverlay()
        ApiManager.shared.register(user: user) { (user, success, message) in
            SwiftOverlays.removeAllBlockingOverlays()
            if success {
                UserDefaultManager.getInstance().setTRN(value: self.registerView.trnField.text ?? "")
                UserDefaultManager.getInstance().setPass(value: self.registerView.passwordField.text ?? "")

                let viewController = UpdateUserInfoViewController()
                viewController.user = user
                self.navigationController?.pushViewController(viewController, animated: true)
            }
            else {
                Utils.showAlert(title: "Error", message: message ?? "", viewController: self)
            }
        }
    }
    
    func actionTapToCloseButton() {
        dismiss(animated: true, completion: nil)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let newString = NSString(string: textField.text!).replacingCharacters(in: range, with: string)
        _ = checkInput(textField: textField, value: newString)
        
        if (textField == registerView.trnField) {
            return textField.TRNFormat(string: string, range: range)
        }
        else if (textField == registerView.phoneNumberField) {
            return textField.phoneNumberFormat(string: string, range: range)
        }
        else {
            return true
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case registerView.firstNameField:
            if checkInput(textField: textField, value: textField.text) {
                textField.resignFirstResponder()
                registerView.surNameField.becomeFirstResponder()
                return true
            }
        case registerView.surNameField:
            if checkInput(textField: textField, value: textField.text) {
                textField.resignFirstResponder()
                registerView.trnField.becomeFirstResponder()
                return true
            }
        case registerView.trnField:
            if checkInput(textField: textField, value: textField.text) {
                textField.resignFirstResponder()
                registerView.emailField.becomeFirstResponder()
                return true
            }
        case registerView.emailField:
            if checkInput(textField: textField, value: textField.text) {
                textField.resignFirstResponder()
                registerView.phoneNumberField.becomeFirstResponder()
                return true
            }
        case registerView.phoneNumberField:
            if checkInput(textField: textField, value: textField.text) {
                textField.resignFirstResponder()
                registerView.passwordField.becomeFirstResponder()
                return true
            }
        case registerView.passwordField:
            if checkInput(textField: textField, value: textField.text) {
                textField.resignFirstResponder()
                registerView.confirmPasswordField.becomeFirstResponder()
                return true
            }
        default:
            if checkInput(textField: textField, value: textField.text) {
                textField.resignFirstResponder()
                actionTapToNextButton()
                return true
            }
        }
        return false
    }
    
    func checkInput(textField: UITextField, value: String?) -> Bool {
        switch textField {
        case registerView.firstNameField:
            if value != nil && value!.isValidName() {
                registerView.errorLabel.text = nil
                registerView.firstNameBorder.backgroundColor = Global.colorSeparator
                return true
            }
            registerView.errorLabel.text = "Invalid First Name"
            registerView.firstNameBorder.backgroundColor = UIColor.red.withAlphaComponent(0.8)
            
        case registerView.surNameField:
            if value != nil && value!.isValidName() {
                registerView.errorLabel.text = nil
                registerView.surNameBorder.backgroundColor = Global.colorSeparator
                return true
            }
            registerView.errorLabel.text = "Invalid Surname"
            registerView.surNameBorder.backgroundColor = UIColor.red.withAlphaComponent(0.8)
            
        case registerView.trnField:
            if value != nil && value!.isValidTRN() {
                registerView.errorLabel.text = nil
                registerView.trnBorder.backgroundColor = Global.colorSeparator
                return true
            }
            registerView.errorLabel.text = "Invalid TRN"
            registerView.trnBorder.backgroundColor = UIColor.red.withAlphaComponent(0.8)
            
        case registerView.emailField:
            if value != nil && value!.isValidEmail() {
                registerView.errorLabel.text = nil
                registerView.emailBorder.backgroundColor = Global.colorSeparator
                return true
            }
            registerView.errorLabel.text = "Invalid Email"
            registerView.emailBorder.backgroundColor = UIColor.red.withAlphaComponent(0.8)
            
        case registerView.phoneNumberField:
            if value != nil && value!.isValidPhone() {
                registerView.errorLabel.text = nil
                registerView.phoneNumberBorder.backgroundColor = Global.colorSeparator
                return true
            }
            registerView.errorLabel.text = "Invalid Phone Number"
            registerView.phoneNumberBorder.backgroundColor = UIColor.red.withAlphaComponent(0.8)
            
        case registerView.passwordField:
            if value != nil && value!.isValidPassword() {
                registerView.errorLabel.text = nil
                registerView.passwordBorder.backgroundColor = Global.colorSeparator
                return true
            }
            registerView.errorLabel.text = "Invalid Password"
            registerView.passwordBorder.backgroundColor = UIColor.red.withAlphaComponent(0.8)
            
        default:
            if value != nil && registerView.passwordField.text != nil && value! == registerView.passwordField.text! {
                registerView.errorLabel.text = nil
                registerView.confirmPasswordBorder.backgroundColor = Global.colorSeparator
                return true
            }
            registerView.errorLabel.text = "Confirm Password Mismatch"
            registerView.confirmPasswordBorder.backgroundColor = UIColor.red.withAlphaComponent(0.8)
        }
        return false
    }
}
