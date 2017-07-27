//
//  MakeRequestViewController.swift
//  TravelCash
//
//  Created by Thanh-Tam Le on 6/21/17.
//  Copyright © 2017 Tam. All rights reserved.
//

import UIKit
import STPopup
import SwiftOverlays

protocol MakeRequestDelegate: class {
    func actionTapToSendButton()
    func actionTapToCancelButton()
}

class MakeRequestViewController: UIViewController {

    let makeRequestView = MakeRequestView()
    var requestTypes = [RequestType]()
    var requests = [String]()

    open weak var makeRequestDelegate: MakeRequestDelegate?

    override func loadView() {
        view = makeRequestView
        view.setNeedsUpdateConstraints()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "MAKE A REQEST"

        var portraitSize: CGSize!
        var landscapeSize: CGSize!

        portraitSize = CGSize(width: Global.SCREEN_WIDTH - 50, height: Global.SCREEN_HEIGHT - 450)
        landscapeSize = CGSize(width: Global.SCREEN_HEIGHT - 300, height: Global.SCREEN_WIDTH - 150)

        self.contentSizeInPopup = portraitSize
        self.landscapeContentSizeInPopup = landscapeSize

        makeRequestView.requestTypeAbstract.addGestureRecognizer(UITapGestureRecognizer(target: self, action:  #selector(actionTapToRequestTypeView)))
        makeRequestView.sendBtn.addTarget(self, action: #selector(actionTapToSendButton), for: .touchUpInside)
        makeRequestView.cancelBtn.addTarget(self, action: #selector(actionTapToCancelButton), for: .touchUpInside)

        loadData()
    }

    func loadData() {
        ApiManager.shared.getRequestTypes() { (requestTypes, status, messsage) in
            if status {
                if let requestTypes = requestTypes {
                    self.requestTypes = requestTypes

                    for item in requestTypes {
                        self.requests.append(item.name)
                    }
                }
            }
        }

    }

    func actionTapToRequestTypeView() {
        makeRequestView.requestTypeDropDown.dataSource = requests
        makeRequestView.requestTypeDropDown.show()
    }

    func actionTapToSendButton() {

        if makeRequestView.requestTypeField.text == "" {
            Utils.showAlert(title: "Error", message: "Request Type can not be empty!", viewController: self)
            return
        }

        SwiftOverlays.showBlockingWaitOverlay()
        var requestId = ""
        for item in requestTypes {
            if makeRequestView.requestTypeField.text == item.name {
                requestId = item.requestId
                break
            }
        }

        if let user = Global.currentUser {
            ApiManager.shared.addUserRequest(trn: user.trn, requestId: requestId, completion: { (status, message) in
                SwiftOverlays.removeAllBlockingOverlays()
                if status == true {
                    Utils.showAlert(title: "Travel Cash", message: message ?? "", viewController: self)
                    self.makeRequestDelegate?.actionTapToSendButton()
                }
                else {
                    Utils.showAlert(title: "Error", message: "Make request error. Please try again!", viewController: self)
                }
            })
        }
        else {
            SwiftOverlays.removeAllBlockingOverlays()
            Utils.showAlert(title: "Error", message: "Make request error. Please try again!", viewController: self)
        }
    }

    func actionTapToCancelButton() {
        makeRequestDelegate?.actionTapToCancelButton()
    }
}
