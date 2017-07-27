
//
//  AttachmentViewController.swift
//  TravelCash
//
//  Created by Thanh-Tam Le on 6/19/17.
//  Copyright © 2017 Tam. All rights reserved.
//

import UIKit

class AttachmentViewController: UIViewController, CameraDelegate, UIDocumentPickerDelegate  {

    let attachmentView = AttachmentView()

    override func loadView() {
        view = attachmentView
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

        attachmentView.documentFirstView.addGestureRecognizer(UITapGestureRecognizer(target: self, action:  #selector(actionTapToDocumentFirst)))
        attachmentView.documentSecondView.addGestureRecognizer(UITapGestureRecognizer(target: self, action:  #selector(actionTapToDocumentSecond)))
        attachmentView.documentThirdView.addGestureRecognizer(UITapGestureRecognizer(target: self, action:  #selector(actionTapToDocumentThird)))
        attachmentView.documentFourthView.addGestureRecognizer(UITapGestureRecognizer(target: self, action:  #selector(actionTapToDocumentFourth)))
        attachmentView.documentFifthView.addGestureRecognizer(UITapGestureRecognizer(target: self, action:  #selector(actionTapToDocumentFifth)))

        Global.newLoanApp.attachment = Attachment()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        let rectTitle = NSString(string: attachmentView.titleLabel.text ?? "").boundingRect(with: CGSize(width: view.frame.width - 20, height: 1000), options: NSStringDrawingOptions.usesFontLeading.union(NSStringDrawingOptions.usesLineFragmentOrigin), attributes: [NSFontAttributeName: UIFont(name: "OpenSans", size: 16)!], context: nil)

        let height: CGFloat = 10 + rectTitle.height + 10 + 20 + 10 + 40 + 20 + 40 + 20 + 40 + 20 + 40 + 20 + 40 + 20 + 40 + 20 + 40 + 20 + 40 + 50

        attachmentView.containerView.autoSetDimension(.height, toSize: height)
        attachmentView.scrollView.contentSize = attachmentView.containerView.bounds.size
    }

    func actionTapToDocumentFirst() {
        attachmentView.documentFirstField.tag = 0
        showOptionCheckout(textField: attachmentView.documentFirstField)
    }

    func actionTapToDocumentSecond() {
        attachmentView.documentSecondField.tag = 1
        showOptionCheckout(textField: attachmentView.documentSecondField)
    }

    func actionTapToDocumentThird() {
        attachmentView.documentThirdField.tag = 2
        showOptionCheckout(textField: attachmentView.documentThirdField)
    }

    func actionTapToDocumentFourth() {
        attachmentView.documentFourthField.tag = 3
        showOptionCheckout(textField: attachmentView.documentFourthField)
    }

    func actionTapToDocumentFifth() {
        attachmentView.documentFifthField.tag = 4
        showOptionCheckout(textField: attachmentView.documentFifthField)
    }

    func showOptionCheckout(textField: UITextField) {
        attachmentView.currentDocument = textField

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

                attachmentView.currentDocument.text = url.lastPathComponent
                let fileName: NSString = url.lastPathComponent as NSString
                let document = Document(name: fileName.deletingPathExtension, fileName: attachmentView.currentDocument.text ?? "", mimeType: url.mimeType(), data: data as Data)
                Global.newLoanApp.attachment.documents[attachmentView.currentDocument.tag] = document

            }
        }
    }

    func tookPicture(url: String, image: UIImage) {
        if let data = UIImagePNGRepresentation(image) as NSData? {
            if data.length > 2000000 {
                Utils.showAlert(title: "Error", message: "It's size must be less than 2MB", viewController: self)
                return
            }

            attachmentView.currentDocument.text = "Image_" + Utils.getRandomName() + ".jpg"
            let document = Document(name: "Image_" + Utils.getRandomName(), fileName: "Image_" + Utils.getRandomName() + ".jpg", mimeType: "image/jpeg", data: data as Data)
            Global.newLoanApp.attachment.documents[attachmentView.currentDocument.tag] = document
        }
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
        
        if isSaving {
            return
        }
        
        isSaving = true
        
        let viewController = ApplicationSummaryViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
}
