//
//  NewLoanRequestViewController.swift
//  TravelCash
//
//  Created by Thanh-Tam Le on 6/15/17.
//  Copyright © 2017 Tam. All rights reserved.
//

import UIKit
import SwiftOverlays

class NewLoanRequestViewController: UIViewController, UITextFieldDelegate, CameraDelegate, UIDocumentPickerDelegate {

    let newLoanRequestView = NewLoanRequestView()
    var newLoanRequest = NewLoanRequest()

    override func loadView() {
        view = newLoanRequestView
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

        title = "NEW LOAN REQUEST"

        let closeBarButton = UIBarButtonItem(image: UIImage(named: "ic_close_white"), style: .done, target: self, action: #selector(actionTapToCloseButton))
        closeBarButton.tintColor = UIColor.white
        self.navigationItem.rightBarButtonItem = closeBarButton

        newLoanRequestView.firstNameField.delegate = self
        newLoanRequestView.surNameField.delegate = self
        newLoanRequestView.trnField.delegate = self
        newLoanRequestView.emailField.delegate = self
        newLoanRequestView.phoneNumberField.delegate = self
        newLoanRequestView.addressFirstField.delegate = self
        newLoanRequestView.addressSecondField.delegate = self

        newLoanRequestView.parishAbstract.addGestureRecognizer(UITapGestureRecognizer(target: self, action:  #selector(actionTapToParishView)))
        newLoanRequestView.documentFirstView.addGestureRecognizer(UITapGestureRecognizer(target: self, action:  #selector(actionTapToDocumentFirst)))
        newLoanRequestView.documentSecondView.addGestureRecognizer(UITapGestureRecognizer(target: self, action:  #selector(actionTapToDocumentSecond)))
        newLoanRequestView.documentThirdView.addGestureRecognizer(UITapGestureRecognizer(target: self, action:  #selector(actionTapToDocumentThird)))
        newLoanRequestView.documentFourthView.addGestureRecognizer(UITapGestureRecognizer(target: self, action:  #selector(actionTapToDocumentFourth)))
        newLoanRequestView.documentFifthView.addGestureRecognizer(UITapGestureRecognizer(target: self, action:  #selector(actionTapToDocumentFifth)))
        newLoanRequestView.submitButton.addTarget(self, action: #selector(actionTapToSubmitRequestButton), for: .touchUpInside)

        loadData()
    }

    func loadData() {

        if let user = Global.currentUser {
            newLoanRequestView.firstNameField.text = user.first_name
            newLoanRequestView.surNameField.text = user.surname
            newLoanRequestView.trnField.text = user.trn
            newLoanRequestView.phoneNumberField.text = user.phone_number
            newLoanRequestView.emailField.text = user.email
            newLoanRequestView.addressFirstField.text = user.address_1
            newLoanRequestView.addressSecondField.text = user.address_2
            newLoanRequestView.parishField.text = user.parish

            _ = newLoanRequestView.phoneNumberField.phoneNumberFormat(string: "", range: NSRange(location: user.phone_number.length(), length: 0))
        }
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        let rectTitle = NSString(string: newLoanRequestView.titleLabel.text ?? "").boundingRect(with: CGSize(width: view.frame.width - 20, height: 1000), options: NSStringDrawingOptions.usesFontLeading.union(NSStringDrawingOptions.usesLineFragmentOrigin), attributes: [NSFontAttributeName: UIFont(name: "OpenSans", size: 16)!], context: nil)

        let height: CGFloat = 10 + rectTitle.height + 10 + 20 + 10 + 40 + 20 + 40 + 20 + 40 + 20 + 40 + 20 + 40 + 20 + 40 + 20 + 40 + 20 + 40 + 20 + 40 + 20 + 40 + 20 + 40 + 20 + 40 + 20 + 40 + 20 + 40 + 30 + 45 + 20

        newLoanRequestView.containerView.autoSetDimension(.height, toSize: height)
        newLoanRequestView.scrollView.contentSize = newLoanRequestView.containerView.bounds.size
    }

    func hideAllKeyboard() {
        newLoanRequestView.firstNameField.resignFirstResponder()
        newLoanRequestView.surNameField.resignFirstResponder()
        newLoanRequestView.emailField.resignFirstResponder()
        newLoanRequestView.phoneNumberField.resignFirstResponder()
        newLoanRequestView.addressFirstField.resignFirstResponder()
        newLoanRequestView.addressSecondField.resignFirstResponder()
        newLoanRequestView.loanRequestAmountField.resignFirstResponder()
        newLoanRequestView.trnField.resignFirstResponder()
    }

    func actionTapToParishView() {
        hideAllKeyboard()
        newLoanRequestView.parishDropDown.dataSource = ["Kingston", "St. Andrew", "St. Catherine", "Clarendon", "Manchester", "St. Elizabeth", "Westmoreland", "Hanover", "St. James", "Trelawny", "St. Ann", "St. Mary", "Portland", "St. Thomas"]
        newLoanRequestView.parishDropDown.show()
    }

    func actionTapToDocumentFirst() {
        hideAllKeyboard()
        newLoanRequestView.documentFirstField.tag = 0
        showOptionCheckout(textField: newLoanRequestView.documentFirstField)
    }

    func actionTapToDocumentSecond() {
        hideAllKeyboard()
        newLoanRequestView.documentSecondField.tag = 1
        showOptionCheckout(textField: newLoanRequestView.documentSecondField)
    }

    func actionTapToDocumentThird() {
        hideAllKeyboard()
        newLoanRequestView.documentThirdField.tag = 2
        showOptionCheckout(textField: newLoanRequestView.documentThirdField)
    }

    func actionTapToDocumentFourth() {
        hideAllKeyboard()
        newLoanRequestView.documentFourthField.tag = 3
        showOptionCheckout(textField: newLoanRequestView.documentFourthField)
    }

    func actionTapToDocumentFifth() {
        hideAllKeyboard()
        newLoanRequestView.documentFifthField.tag = 4
        showOptionCheckout(textField: newLoanRequestView.documentFifthField)
    }

    func showOptionCheckout(textField: UITextField) {
        newLoanRequestView.currentDocument = textField

        let optionMenu = UIAlertController(title: "Choose File", message: "", preferredStyle: .actionSheet)
        optionMenu.view.tintColor = Global.colorMain

        let takePhotoAction = UIAlertAction(title: "Take photo", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            let cameraViewController = CameraViewController()
            cameraViewController.cameraDelegate = self
            self.present(cameraViewController, animated: false, completion: nil)
        })

        let imageAction = UIAlertAction(title: "Image", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            let cameraViewController = CameraViewController()
            cameraViewController.cameraDelegate = self
            cameraViewController.pickImage = 1
            self.present(cameraViewController, animated: false, completion: nil)
        })

        let documentAction = UIAlertAction(title: "Document", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in

            let documentPicker: UIDocumentPickerViewController = UIDocumentPickerViewController(documentTypes: ["public.text", "public.data","public.pdf", "public.doc"], in: UIDocumentPickerMode.import)
            documentPicker.delegate = self
            documentPicker.modalPresentationStyle = UIModalPresentationStyle.fullScreen
            self.present(documentPicker, animated: true, completion: nil)

        })

        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: {
            (alert: UIAlertAction!) -> Void in

        })

        optionMenu.addAction(takePhotoAction)
        optionMenu.addAction(imageAction)
        optionMenu.addAction(documentAction)
        optionMenu.addAction(cancelAction)

        self.present(optionMenu, animated: true, completion: nil)
    }

    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentAt url: URL) {
        if controller.documentPickerMode == UIDocumentPickerMode.import {
            if let data = NSData(contentsOf: url) {
                if data.length > 2000000 {
                    Utils.showAlert(title: "Error", message: "It's size must be less than 2MB", viewController: self)
                    return
                }
                
                newLoanRequestView.currentDocument.text = url.lastPathComponent
                let fileName: NSString = url.lastPathComponent as NSString
                let document = Document(name: fileName.deletingPathExtension, fileName: newLoanRequestView.currentDocument.text ?? "", mimeType: url.mimeType(), data: data as Data)
                newLoanRequest.attachment.documents[newLoanRequestView.currentDocument.tag] = document
            }
        }
    }

    func tookPicture(url: String, image: UIImage) {
        if let data = UIImagePNGRepresentation(image) as NSData? {
            if data.length > 2000000 {
                Utils.showAlert(title: "Error", message: "It's size must be less than 2MB", viewController: self)
                return
            }

            newLoanRequestView.currentDocument.text = "Image_" + Utils.getRandomName() + ".jpg"
            let document = Document(name: "Image_" + Utils.getRandomName(), fileName: "Image_" + Utils.getRandomName() + ".jpg", mimeType: "image/jpeg", data: data as Data)
            newLoanRequest.attachment.documents[newLoanRequestView.currentDocument.tag] = document
        }
    }

    func actionTapToSubmitRequestButton() {
        hideAllKeyboard()

        if newLoanRequestView.firstNameField.text == "" {
            Utils.showAlert(title: "Error", message: "First Name can not be empty!", viewController: self)
            return
        }

        if newLoanRequestView.surNameField.text == "" {
            Utils.showAlert(title: "Error", message: "Surname can not be empty!", viewController: self)
            return
        }

        if newLoanRequestView.trnField.text == "" {
            Utils.showAlert(title: "Error", message: "TRN can not be empty!", viewController: self)
            return
        }

        if newLoanRequestView.phoneNumberField.text == "" {
            Utils.showAlert(title: "Error", message: "Phone Number can not be empty!", viewController: self)
            return
        }

        if newLoanRequestView.emailField.text == "" {
            Utils.showAlert(title: "Error", message: "Email can not be empty!", viewController: self)
            return
        }

        if newLoanRequestView.addressFirstField.text == "" {
            Utils.showAlert(title: "Error", message: "Address 1 can not be empty!", viewController: self)
            return
        }

        if newLoanRequestView.parishField.text == "" {
            Utils.showAlert(title: "Error", message: "Parish can not be empty!", viewController: self)
            return
        }

        if newLoanRequestView.loanRequestAmountField.text == "" {
            Utils.showAlert(title: "Error", message: "Loan Request Amount can not be empty!", viewController: self)
            return
        }

        SwiftOverlays.showBlockingWaitOverlay()

        newLoanRequest.first_name = newLoanRequestView.firstNameField.text ?? ""
        newLoanRequest.surname = newLoanRequestView.surNameField.text ?? ""
        newLoanRequest.trn = newLoanRequestView.trnField.text ?? ""
        newLoanRequest.phone_number = newLoanRequestView.phoneNumberField.text ?? ""
        newLoanRequest.email = newLoanRequestView.emailField.text ?? ""
        newLoanRequest.address_1 = newLoanRequestView.addressFirstField.text ?? ""
        newLoanRequest.address_2 = newLoanRequestView.addressSecondField.text ?? ""
        newLoanRequest.parish = newLoanRequestView.parishField.text ?? ""
        newLoanRequest.requestAmount = Int(newLoanRequestView.loanRequestAmountField.text ?? "0") ?? 0

        ApiManager.shared.newLoanRequest(newLoanRequest: newLoanRequest) { (loanRequestResponse, status, message) in
            SwiftOverlays.removeAllBlockingOverlays()
            if loanRequestResponse != nil {
                for index in 0..<self.newLoanRequest.attachment.documents.count {
                    if let document = self.newLoanRequest.attachment.documents[index] {
                        ApiManager.shared.uploadImage(loanRequestId: loanRequestResponse?.loanRequestId ?? "0", trn: self.newLoanRequest.trn, document: document)
                    }
                }
                Utils.showAlert(title: "Successfully", message: "Create New Loan Request successfully!", viewController: self)
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

        if (textField == newLoanRequestView.trnField) {
            return textField.TRNFormat(string: string, range: range)
        }
        else if (textField == newLoanRequestView.phoneNumberField) {
            return textField.phoneNumberFormat(string: string, range: range)
        }
        else {
            return true
        }
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case newLoanRequestView.firstNameField:
            if checkInput(textField: textField, value: textField.text) {
                textField.resignFirstResponder()
                newLoanRequestView.surNameField.becomeFirstResponder()
                return true
            }
        case newLoanRequestView.surNameField:
            if checkInput(textField: textField, value: textField.text) {
                textField.resignFirstResponder()
                newLoanRequestView.trnField.becomeFirstResponder()
                return true
            }
        case newLoanRequestView.trnField:
            if checkInput(textField: textField, value: textField.text) {
                textField.resignFirstResponder()
                newLoanRequestView.phoneNumberField.becomeFirstResponder()
                return true
            }
        case newLoanRequestView.phoneNumberField:
            if checkInput(textField: textField, value: textField.text) {
                textField.resignFirstResponder()
                newLoanRequestView.emailField.becomeFirstResponder()
                return true
            }
        case newLoanRequestView.emailField:
            if checkInput(textField: textField, value: textField.text) {
                textField.resignFirstResponder()
                newLoanRequestView.addressFirstField.becomeFirstResponder()
                return true
            }
        case newLoanRequestView.addressFirstField:
            if checkInput(textField: textField, value: textField.text) {
                textField.resignFirstResponder()
                newLoanRequestView.addressSecondField.becomeFirstResponder()
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

    func checkInput(textField: UITextField, value: String?) -> Bool {
        switch textField {
        case newLoanRequestView.firstNameField:
            if value != nil && value!.isValidName() {
                newLoanRequestView.errorLabel.text = nil
                newLoanRequestView.firstNameBorder.backgroundColor = Global.colorSeparator
                return true
            }
            newLoanRequestView.errorLabel.text = "Invalid First Name"
            newLoanRequestView.firstNameBorder.backgroundColor = UIColor.red.withAlphaComponent(0.8)

        case newLoanRequestView.surNameField:
            if value != nil && value!.isValidName() {
                newLoanRequestView.errorLabel.text = nil
                newLoanRequestView.surNameBorder.backgroundColor = Global.colorSeparator
                return true
            }
            newLoanRequestView.errorLabel.text = "Invalid Surname"
            newLoanRequestView.surNameBorder.backgroundColor = UIColor.red.withAlphaComponent(0.8)

        case newLoanRequestView.trnField:
            if value != nil && value!.isValidTRN() {
                newLoanRequestView.errorLabel.text = nil
                newLoanRequestView.trnBorder.backgroundColor = Global.colorSeparator
                return true
            }
            newLoanRequestView.errorLabel.text = "Invalid TRN"
            newLoanRequestView.trnBorder.backgroundColor = UIColor.red.withAlphaComponent(0.8)

        case newLoanRequestView.phoneNumberField:
            if value != nil && value!.isValidPhone() {
                newLoanRequestView.errorLabel.text = nil
                newLoanRequestView.phoneNumberBorder.backgroundColor = Global.colorSeparator
                return true
            }
            newLoanRequestView.errorLabel.text = "Invalid Phone Number"
            newLoanRequestView.phoneNumberBorder.backgroundColor = UIColor.red.withAlphaComponent(0.8)

        case newLoanRequestView.emailField:
            if value != nil && value!.isValidEmail() {
                newLoanRequestView.errorLabel.text = nil
                newLoanRequestView.emailBorder.backgroundColor = Global.colorSeparator
                return true
            }
            newLoanRequestView.errorLabel.text = "Invalid Email"
            newLoanRequestView.emailBorder.backgroundColor = UIColor.red.withAlphaComponent(0.8)

        case newLoanRequestView.addressFirstField:
            if value != nil && value!.isValidName() {
                newLoanRequestView.errorLabel.text = nil
                newLoanRequestView.addressFirstBorder.backgroundColor = Global.colorSeparator
                return true
            }
            newLoanRequestView.errorLabel.text = "Invalid Address 1"
            newLoanRequestView.addressFirstBorder.backgroundColor = UIColor.red.withAlphaComponent(0.8)

        case newLoanRequestView.addressSecondField:
            if value != nil && value!.isValidName() {
                newLoanRequestView.errorLabel.text = nil
                newLoanRequestView.addressSecondBorder.backgroundColor = Global.colorSeparator
                return true
            }
            newLoanRequestView.errorLabel.text = "Invalid Address 2"
            newLoanRequestView.addressSecondBorder.backgroundColor = UIColor.red.withAlphaComponent(0.8)

        case newLoanRequestView.parishField:
            if value != nil && value!.isValidName() {
                newLoanRequestView.errorLabel.text = nil
                newLoanRequestView.parishBorder.backgroundColor = Global.colorSeparator
                return true
            }
            newLoanRequestView.errorLabel.text = "Invalid Parish"
            newLoanRequestView.parishBorder.backgroundColor = UIColor.red.withAlphaComponent(0.8)

        case newLoanRequestView.loanRequestAmountField:
            if value != nil && value!.isValidName() {
                newLoanRequestView.errorLabel.text = nil
                newLoanRequestView.loanRequestAmountBorder.backgroundColor = Global.colorSeparator
                return true
            }
            newLoanRequestView.errorLabel.text = "Invalid Loan Request Amount"
            newLoanRequestView.loanRequestAmountBorder.backgroundColor = UIColor.red.withAlphaComponent(0.8)
            
        default:
            return true
        }
        return false
    }
}
