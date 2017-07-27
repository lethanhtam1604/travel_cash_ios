//
//  DisclaimerViewController.swift
//  TravelCash
//
//  Created by Thanh-Tam Le on 6/21/17.
//  Copyright © 2017 Tam. All rights reserved.
//

import UIKit
import STPopup

protocol DisclaimerDelegate: class {
    func actionTapToOkButton()
}

class DisclaimerViewController: UIViewController {
    
    let disclaimerView = DisclaimerView()
    
    open weak var disclaimerDelegate: DisclaimerDelegate?
    
    override func loadView() {
        view = disclaimerView
        view.setNeedsUpdateConstraints()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "DISCLAIMER"
        
        var portraitSize: CGSize!
        var landscapeSize: CGSize!
        
        portraitSize = CGSize(width: Global.SCREEN_WIDTH - 50, height: Global.SCREEN_HEIGHT - 200)
        landscapeSize = CGSize(width: Global.SCREEN_HEIGHT - 200, height: Global.SCREEN_WIDTH - 100)
        
        self.contentSizeInPopup = portraitSize
        self.landscapeContentSizeInPopup = landscapeSize
        
        disclaimerView.cancelBtn.addTarget(self, action: #selector(actionTapToOkButton), for: .touchUpInside)
        if let resourceURL = Bundle.main.url(forResource: "Disclaimer", withExtension: "rtf") {
            disclaimerView.bindingData(content: try! NSAttributedString(fileURL: resourceURL, options: [:], documentAttributes: nil).string)
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let rectTitle = NSString(string: disclaimerView.titleLabel.text ?? "").boundingRect(with: CGSize(width: view.frame.width - 20, height: 1000), options: NSStringDrawingOptions.usesFontLeading.union(NSStringDrawingOptions.usesLineFragmentOrigin), attributes: [NSFontAttributeName: UIFont(name: "OpenSans", size: 15)!], context: nil)
        
        let height: CGFloat = 10 + rectTitle.height
        
        disclaimerView.containerView.autoSetDimension(.height, toSize: height)
        disclaimerView.scrollView.contentSize = disclaimerView.containerView.bounds.size
    }
    
    func actionTapToOkButton() {
        disclaimerDelegate?.actionTapToOkButton()
    }
}
