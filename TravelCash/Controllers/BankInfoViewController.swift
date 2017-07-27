//
//  BankInfoViewController.swift
//  TravelCash
//
//  Created by Thanh-Tam Le on 6/18/17.
//  Copyright © 2017 Tam. All rights reserved.
//

import UIKit

class BankInfoViewController: UIViewController {

    let bankInfoView = BankInfoView()

    override func loadView() {
        view = bankInfoView
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

        bankInfoView.bankNameField.delegate = self
        bankInfoView.branchField.delegate = self


        bankInfoView.accountTypeAbstract.addGestureRecognizer(UITapGestureRecognizer(target: self, action:  #selector(actionTapToAccountTypeView)))
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        let rectTitle = NSString(string: bankInfoView.titleLabel.text ?? "").boundingRect(with: CGSize(width: view.frame.width - 20, height: 1000), options: NSStringDrawingOptions.usesFontLeading.union(NSStringDrawingOptions.usesLineFragmentOrigin), attributes: [NSFontAttributeName: UIFont(name: "OpenSans", size: 16)!], context: nil)

        let height: CGFloat = 10 + rectTitle.height + 20 + 20 + 10 + 20 + 10 + 40 + 20 + 40 + 20 + 40 + 20 + 40 + 50

        bankInfoView.containerView.autoSetDimension(.height, toSize: height)
        bankInfoView.scrollView.contentSize = bankInfoView.containerView.bounds.size
    }

    func hideAllKeyboard() {
        bankInfoView.bankNameField.resignFirstResponder()
        bankInfoView.branchField.resignFirstResponder()
    }

    func actionTapToAccountTypeView() {
        hideAllKeyboard()
        bankInfoView.accountTypeDropDown.dataSource = ["Saving", "Chequing"]
        bankInfoView.accountTypeDropDown.show()
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

        if !bankInfoView.checkBox.on {
            if bankInfoView.bankNameField.text == "" {
                Utils.showAlert(title: "Error", message: "Bank Name can not be empty!", viewController: self)
                return
            }

            if bankInfoView.branchField.text == ""  {
                Utils.showAlert(title: "Error", message: "Branch can not be empty!", viewController: self)
                return
            }

            if bankInfoView.accountTypeField.text == "" {
                Utils.showAlert(title: "Error", message: "Account Type can not be empty!", viewController: self)
                return
            }
        }

        isSaving = true

        Global.newLoanApp.bankingInfo.bankName = bankInfoView.bankNameField.text ?? ""
        Global.newLoanApp.bankingInfo.branch = bankInfoView.branchField.text ?? ""
        Global.newLoanApp.bankingInfo.accountType = bankInfoView.accountTypeField.text ?? ""

        let viewController = WorkingInfoViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }

    func checkInput(textField: UITextField, value: String?) -> Bool {
        switch textField {
        case bankInfoView.bankNameField:
            if value != nil && value!.isValidName() {
                bankInfoView.errorLabel.text = nil
                bankInfoView.bankNameBorder.backgroundColor = Global.colorSeparator
                return true
            }
            bankInfoView.errorLabel.text = "Invalid Bank Name"
            bankInfoView.bankNameBorder.backgroundColor = UIColor.red.withAlphaComponent(0.8)

        case bankInfoView.branchField:
            if value != nil && value!.isValidName() {
                bankInfoView.errorLabel.text = nil
                bankInfoView.branchBorder.backgroundColor = Global.colorSeparator
                return true
            }
            bankInfoView.errorLabel.text = "Invalid Branch"
            bankInfoView.branchBorder.backgroundColor = UIColor.red.withAlphaComponent(0.8)

        default:
            return true
        }
        return false
    }
}

extension BankInfoViewController: UITextFieldDelegate {

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let newString = NSString(string: textField.text!).replacingCharacters(in: range, with: string)
        _ = checkInput(textField: textField, value: newString)

        return true
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case bankInfoView.bankNameField:
            if checkInput(textField: textField, value: textField.text) {
                textField.resignFirstResponder()
                bankInfoView.branchField.becomeFirstResponder()
                return true
            }
        case bankInfoView.branchField:
            if checkInput(textField: textField, value: textField.text) {
                textField.resignFirstResponder()
                actionTapToAccountTypeView()
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
