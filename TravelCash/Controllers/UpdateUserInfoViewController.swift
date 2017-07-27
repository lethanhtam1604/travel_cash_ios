//
//  UpdateUserInfoViewController.swift
//  TravelCash
//
//  Created by Thanh-Tam Le on 6/15/17.
//  Copyright © 2017 Tam. All rights reserved.
//

import UIKit
import SwiftOverlays

class UpdateUserInfoViewController: UIViewController, UITextFieldDelegate, SWRevealViewControllerDelegate {
    
    let updateUserInfoView = UpdateUserInfoView()
    var user: User?

    override func loadView() {
        view = updateUserInfoView
        view.setNeedsUpdateConstraints()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //enable swipe back when it changed leftBarButtonItem
        navigationController?.interactivePopGestureRecognizer?.delegate = nil
        
        title = "UPDATE USER INFO"
        
        let backBarButton = UIBarButtonItem(image: UIImage(named: "i_nav_back"), style: .done, target: self, action: #selector(actionTapToBackButton))
        backBarButton.tintColor = UIColor.white
        self.navigationItem.leftBarButtonItem = backBarButton
        
        updateUserInfoView.addressFirstField.delegate = self
        updateUserInfoView.addressSecondField.delegate = self
        
        updateUserInfoView.parishAbstract.addGestureRecognizer(UITapGestureRecognizer(target: self, action:  #selector (actionTapToParishView)))
        updateUserInfoView.dobAbstract.addGestureRecognizer(UITapGestureRecognizer(target: self, action:  #selector (actionTapToDobView)))
        updateUserInfoView.submitButton.addTarget(self, action: #selector(actionTapToSubmitButton), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let height: CGFloat = 10 + 20 + 10 + 40 + 20 + 40 + 20 + 40 + 20 + 40 + 20 + 40 + 20 + 40 + 20 + 40 + 30 + 45 + 20
        
        updateUserInfoView.containerView.autoSetDimension(.height, toSize: height)
        updateUserInfoView.scrollView.contentSize = updateUserInfoView.containerView.bounds.size
    }
    
    func actionTapToParishView() {
        updateUserInfoView.addressFirstField.resignFirstResponder()
        updateUserInfoView.addressSecondField.resignFirstResponder()
        
        updateUserInfoView.parishDropDown.dataSource = ["Kingston", "St. Andrew", "St. Catherine", "Clarendon", "Manchester", "St. Elizabeth", "Westmoreland", "Hanover", "St. James", "Trelawny", "St. Ann", "St. Mary", "Portland", "St. Thomas"]
        updateUserInfoView.parishDropDown.show()
    }
    
    var fromDate : NSDate? {
        didSet {
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
            dateFormatter.dateFormat = "yyyy-MM-dd"
            
            if fromDate != nil {
                updateUserInfoView.dobField.text = dateFormatter.string(from: fromDate! as Date)
            }
        }
    }

    func actionTapToDobView() {
        updateUserInfoView.addressFirstField.resignFirstResponder()
        updateUserInfoView.addressSecondField.resignFirstResponder()

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
    
    func actionTapToSubmitButton() {
    
        if updateUserInfoView.addressFirstField.text == "" {
            Utils.showAlert(title: "Error", message: "Address 1 can not be empty!", viewController: self)
            return
        }
        
        if updateUserInfoView.addressSecondField.text == "" {
            Utils.showAlert(title: "Error", message: "Address 2 can not be empty!", viewController: self)
            return
        }
        
        if updateUserInfoView.parishField.text == "" {
            Utils.showAlert(title: "Error", message: "Parish can not be empty!", viewController: self)
            return
        }
        
        if updateUserInfoView.dobField.text == "" {
            Utils.showAlert(title: "Error", message: "DOB can not be empty!", viewController: self)
            return
        }

        if let newUser = user {
            newUser.address_1 = updateUserInfoView.addressFirstField.text ?? ""
            newUser.address_2 = updateUserInfoView.addressSecondField.text ?? ""
            newUser.parish = updateUserInfoView.parishField.text ?? ""
            newUser.dob = updateUserInfoView.dobField.text ?? ""

            SwiftOverlays.showBlockingWaitOverlay()
            ApiManager.shared.updateUserProfile(user: newUser) { (user, success, message) in
                SwiftOverlays.removeAllBlockingOverlays()
                if success {
                    UserDefaultManager.getInstance().setLogin(value: true)

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
        else {
            Utils.showAlert(title: "Error", message: "UPDATE USER PROFILE is getting error. Please try again!", viewController: self)
        }
    }
    
    func actionTapToBackButton() {
        navigationController?.popViewController(animated: true)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let newString = NSString(string: textField.text!).replacingCharacters(in: range, with: string)
        _ = checkInput(textField: textField, value: newString)
        
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case updateUserInfoView.addressFirstField:
            if checkInput(textField: textField, value: textField.text) {
                textField.resignFirstResponder()
                updateUserInfoView.addressSecondField.becomeFirstResponder()
                return true
            }
        default:
            if checkInput(textField: textField, value: textField.text) {
                textField.resignFirstResponder()
                actionTapToSubmitButton()
                return true
            }
        }
        return false
    }
    
    func checkInput(textField: UITextField, value: String?) -> Bool {
        switch textField {
        case updateUserInfoView.addressFirstField:
            if value != nil && value!.isValidName() {
                updateUserInfoView.errorLabel.text = nil
                updateUserInfoView.addressFirstBorder.backgroundColor = Global.colorSeparator
                return true
            }
            updateUserInfoView.errorLabel.text = "Invalid Address 1"
            updateUserInfoView.addressFirstBorder.backgroundColor = UIColor.red.withAlphaComponent(0.8)
            
        case updateUserInfoView.addressSecondField:
            if value != nil && value!.isValidName() {
                updateUserInfoView.errorLabel.text = nil
                updateUserInfoView.addressSecondBorder.backgroundColor = Global.colorSeparator
                return true
            }
            updateUserInfoView.errorLabel.text = "Invalid Address 2"
            updateUserInfoView.addressSecondBorder.backgroundColor = UIColor.red.withAlphaComponent(0.8)
            
        case updateUserInfoView.parishField:
            if value != nil && value!.isValidName() {
                updateUserInfoView.errorLabel.text = nil
                updateUserInfoView.parishBorder.backgroundColor = Global.colorSeparator
                return true
            }
            updateUserInfoView.errorLabel.text = "Invalid Parish"
            updateUserInfoView.parishBorder.backgroundColor = UIColor.red.withAlphaComponent(0.8)
            
        default:
            if value != nil && value!.isValidName() {
                updateUserInfoView.errorLabel.text = nil
                updateUserInfoView.dobBorder.backgroundColor = Global.colorSeparator
                return true
            }
            updateUserInfoView.errorLabel.text = "Confirm DOB"
            updateUserInfoView.dobBorder.backgroundColor = UIColor.red.withAlphaComponent(0.8)
        }
        return false
    }
}
