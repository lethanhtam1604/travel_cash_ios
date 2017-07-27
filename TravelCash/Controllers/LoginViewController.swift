//
//  LoginViewController.swift
//  TravelCash
//
//  Created by Thanh-Tam Le on 6/14/17.
//  Copyright © 2017 Tam. All rights reserved.
//

import UIKit
import SwiftOverlays

class LoginViewController: UIViewController, UITextFieldDelegate, SWRevealViewControllerDelegate {
    
    let loginView = LoginView()
    
    override func loadView() {
        view = loginView
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
        
        title = "LOGIN"
        
        let closeBarButton = UIBarButtonItem(image: UIImage(named: "ic_close_white"), style: .done, target: self, action: #selector(actionTapToCloseButton))
        closeBarButton.tintColor = UIColor.white
        self.navigationItem.rightBarButtonItem = closeBarButton
        
        loginView.trnField.delegate = self
        loginView.passwordField.delegate = self
        
        loginView.signInButton.addTarget(self, action: #selector(actionTapToSignInButton), for: .touchUpInside)
        loginView.forgotButton.addTarget(self, action: #selector(actionTapToForgotButton), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let height: CGFloat = 10 + 20 + 10 + 40 + 20 + 40 + 30 + 45 + 30 + 30 + 20
        
        loginView.containerView.autoSetDimension(.height, toSize: height)
        loginView.scrollView.contentSize = loginView.containerView.bounds.size
    }
    
    func actionTapToSignInButton() {
        
        if loginView.trnField.text == "" {
            Utils.showAlert(title: "Error", message: "TRN can not be empty!", viewController: self)
            return
        }
        
        if loginView.passwordField.text == "" {
            Utils.showAlert(title: "Error", message: "Password can not be empty!", viewController: self)
            return
        }

        SwiftOverlays.showBlockingWaitOverlay()
        ApiManager.shared.login(trn: loginView.trnField.text ?? "", password: loginView.passwordField.text ?? "") { (user, success, message) in
            SwiftOverlays.removeAllBlockingOverlays()
            if success {
                UserDefaultManager.getInstance().setLogin(value: true)
                UserDefaultManager.getInstance().setTRN(value: self.loginView.trnField.text ?? "")
                UserDefaultManager.getInstance().setPass(value: self.loginView.passwordField.text ?? "")

                Global.currentUser = user
                let menuViewController = MenuViewController()

                let dashboardViewController = DashboardViewController()
                let dashboardNavigationController = UINavigationController(rootViewController: dashboardViewController)

                let revealViewController = SWRevealViewController(rearViewController: menuViewController, frontViewController: dashboardNavigationController)
                revealViewController?.delegate = self
                revealViewController?.frontViewShadowOpacity = 0.5
                revealViewController?.frontViewShadowRadius = 1
                self.present(revealViewController!, animated: true, completion: nil)
            }
            else {
                Utils.showAlert(title: "Error", message: message ?? "", viewController: self)
            }
        }
    }
    
    func actionTapToForgotButton() {
        
    }
    
    func actionTapToCloseButton() {
        dismiss(animated: true, completion: nil)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let newString = NSString(string: textField.text!).replacingCharacters(in: range, with: string)
        _ = checkInput(textField: textField, value: newString)
        
        if (textField == loginView.trnField) {
            return textField.TRNFormat(string: string, range: range)
        }
        else {
            return true
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case loginView.trnField:
            if checkInput(textField: textField, value: textField.text) {
                textField.resignFirstResponder()
                loginView.passwordField.becomeFirstResponder()
                return true
            }
        default:
            if checkInput(textField: textField, value: textField.text) {
                textField.resignFirstResponder()
                actionTapToSignInButton()
                return true
            }
        }
        return false
    }
    
    func checkInput(textField: UITextField, value: String?) -> Bool {
        switch textField {
        case loginView.trnField:
            if value != nil && value!.isValidTRN() {
                loginView.errorLabel.text = nil
                loginView.trnBorder.backgroundColor = Global.colorSeparator
                return true
            }
            loginView.errorLabel.text = "Invalid TRN"
            loginView.trnBorder.backgroundColor = UIColor.red.withAlphaComponent(0.8)
            
        default:
            if value != nil && value!.isValidPassword() {
                loginView.errorLabel.text = nil
                loginView.passwordBorder.backgroundColor = Global.colorSeparator
                return true
            }
            loginView.errorLabel.text = "Invalid password"
            loginView.passwordBorder.backgroundColor = UIColor.red.withAlphaComponent(0.8)
        }
        return false
    }
}
