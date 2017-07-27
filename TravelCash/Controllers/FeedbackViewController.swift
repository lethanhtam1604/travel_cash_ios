//
//  FeedbackViewController.swift
//  TravelCash
//
//  Created by Thanh-Tam Le on 6/22/17.
//  Copyright © 2017 Tam. All rights reserved.
//

import UIKit
import STPopup
import SwiftOverlays

protocol FeedbackDelegate: class {
    func actionTapToSendButton()
    func actionTapToCancelButton()
}

class FeedbackViewController: UIViewController, UITextFieldDelegate {

    let feedbackView = FeedbackView()

    open weak var feedbackDelegate: FeedbackDelegate?

    override func loadView() {
        view = feedbackView
        view.setNeedsUpdateConstraints()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "FEEDBACK"

        var portraitSize: CGSize!
        var landscapeSize: CGSize!

        portraitSize = CGSize(width: Global.SCREEN_WIDTH - 50, height: Global.SCREEN_HEIGHT - 250)
        landscapeSize = CGSize(width: Global.SCREEN_HEIGHT - 200, height: Global.SCREEN_WIDTH - 100)

        self.contentSizeInPopup = portraitSize
        self.landscapeContentSizeInPopup = landscapeSize

        feedbackView.firstNameField.delegate = self
        feedbackView.surnameField.delegate = self
        feedbackView.phoneNumberField.delegate = self

        feedbackView.sendBtn.addTarget(self, action: #selector(actionTapToSendButton), for: .touchUpInside)
        feedbackView.cancelBtn.addTarget(self, action: #selector(actionTapToCancelButton), for: .touchUpInside)

        if let user = Global.currentUser {
            feedbackView.firstNameField.text = user.first_name
            feedbackView.surnameField.text = user.surname
            feedbackView.phoneNumberField.text = user.phone_number
        }
    }

    func actionTapToSendButton() {

        if feedbackView.firstNameField.text == "" {
            Utils.showAlert(title: "Error", message: "First Name can not be empty!", viewController: self)
            return
        }

        if feedbackView.surnameField.text == "" {
            Utils.showAlert(title: "Error", message: "Surname can not be empty!", viewController: self)
            return
        }

        if feedbackView.phoneNumberField.text == "" {
            Utils.showAlert(title: "Error", message: "Phone Number can not be empty!", viewController: self)
            return
        }

        if feedbackView.complaintTV.text == "" {
            Utils.showAlert(title: "Error", message: "Complaint/Suggestion can not be empty!", viewController: self)
            return
        }

        SwiftOverlays.showBlockingWaitOverlay()

        let feedback = Feedback()
        feedback.firstName = feedbackView.firstNameField.text ?? ""
        feedback.surname = feedbackView.surnameField.text ?? ""
        feedback.phoneNumber = feedbackView.phoneNumberField.text ?? ""
        feedback.feedback = feedbackView.complaintTV.text

        ApiManager.shared.sendFeedback(feedback: feedback) { (status, message) in
            SwiftOverlays.removeAllBlockingOverlays()
            Utils.showAlert(title: "Travel Cash", message: message ?? "", viewController: self)
        }
    }

    func actionTapToCancelButton() {
        feedbackDelegate?.actionTapToCancelButton()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        let rectComplaint = NSString(string: "Complaint/Suggestion").boundingRect(with: CGSize(width: view.frame.width - 20, height: 1000), options: NSStringDrawingOptions.usesFontLeading.union(NSStringDrawingOptions.usesLineFragmentOrigin), attributes: [NSFontAttributeName: UIFont(name: "OpenSans", size: 14)!], context: nil)

        let height: CGFloat = 20 + 40 + 20 + 40 + 20 + 40 + 20 + rectComplaint.height + 100 + 2

        feedbackView.containerView.autoSetDimension(.height, toSize: height)
        feedbackView.scrollView.contentSize = feedbackView.containerView.bounds.size
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case feedbackView.firstNameField:
            textField.resignFirstResponder()
            feedbackView.surnameField.becomeFirstResponder()
            return true

        case feedbackView.surnameField:
            textField.resignFirstResponder()
            feedbackView.phoneNumberField.becomeFirstResponder()
            return true

        case feedbackView.phoneNumberField:
            textField.resignFirstResponder()
            feedbackView.complaintTV.becomeFirstResponder()
            return true

        default:
            textField.resignFirstResponder()
            return true
        }
    }
}
