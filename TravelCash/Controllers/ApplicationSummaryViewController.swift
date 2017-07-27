//
//  ApplicationSummaryViewController.swift
//  TravelCash
//
//  Created by Thanh-Tam Le on 6/19/17.
//  Copyright © 2017 Tam. All rights reserved.
//

import UIKit
import SwiftOverlays

class ApplicationSummaryViewController: UIViewController{
    
    let applicationSummaryView = ApplicationSummaryView()
    
    override func loadView() {
        view = applicationSummaryView
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
        
        let nextBarButton = UIBarButtonItem(title: "FINISH", style: .done, target: self, action: #selector(actionTapToNextButton))
        nextBarButton.setTitleTextAttributes([NSFontAttributeName: UIFont(name: "OpenSans-semibold", size: 15)!], for: UIControlState.normal)
        self.navigationItem.rightBarButtonItem = nextBarButton

        loadData()
    }

    func loadData() {

        applicationSummaryView.fullNameContentLabel.text = Global.newLoanApp.personalInfo.first_name + " " + Global.newLoanApp.personalInfo.surname
        applicationSummaryView.addressContentLabel.text = Global.newLoanApp.personalInfo.address_1
        applicationSummaryView.trnContentLabel.text = Global.newLoanApp.personalInfo.trn
        applicationSummaryView.idContentLabel.text = Global.newLoanApp.personalInfo.idNumber
        applicationSummaryView.employerContentLabel.text = Global.newLoanApp.workingInfo.employer
        applicationSummaryView.occupationContentLabel.text = Global.newLoanApp.workingInfo.employerOccupation
        applicationSummaryView.netIncomeContentLabel.text = Global.newLoanApp.workingInfo.employerNetIncome
        applicationSummaryView.referenceContentLabel.text = Global.newLoanApp.referenceInfo.refFullName
        applicationSummaryView.nextOfSkinContentLabel.text = Global.newLoanApp.skin.skinFullName
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let height: CGFloat = 10 + 10 + 20 + 80 + 50 + 20 + 20 + 20 + 20 + 20 + 20 + 20 + 20 + 20
        
        applicationSummaryView.containerView.autoSetDimension(.height, toSize: height)
        applicationSummaryView.scrollView.contentSize = applicationSummaryView.containerView.bounds.size
    }
    
    func actionTapToBackButton() {
        navigationController?.popViewController(animated: true)
    }
        
    func actionTapToNextButton() {

        SwiftOverlays.showBlockingWaitOverlay()
        ApiManager.shared.submitLoanApplication(newLoanApp: Global.newLoanApp) { (loanRequestResponse, status, message) in
            SwiftOverlays.removeAllBlockingOverlays()
            if status {
                for index in 0..<Global.newLoanApp.attachment.documents.count {
                    if let document = Global.newLoanApp.attachment.documents[index] {
                        ApiManager.shared.uploadImage(loanRequestId: loanRequestResponse?.loanRequestId ?? "0", trn: Global.newLoanApp.personalInfo.trn, document: document)
                    }
                }
                let viewControllers: [UIViewController] = self.navigationController!.viewControllers as [UIViewController]
                self.navigationController!.popToViewController(viewControllers[viewControllers.count - 8], animated: true)
                Utils.showAlert(title: "Travel Cash", message: "Submit new loan successfully!", viewController: self)
            }
            else {
                Utils.showAlert(title: "Travel Cash", message: message ?? "", viewController: self)
            }
        }
    }
}
