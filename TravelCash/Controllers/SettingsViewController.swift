//
//  SettingsViewController.swift
//  TravelCash
//
//  Created by Thanh-Tam Le on 6/21/17.
//  Copyright © 2017 Tam. All rights reserved.
//

import UIKit
import STPopup
class SettingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, DisclaimerDelegate {

    let settingsView = SettingsView()
    
    var settings = [Setting]()

    override func loadView() {
        view = settingsView
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
        
        title = "SETTINGS"
        
        let closeBarButton = UIBarButtonItem(image: UIImage(named: "ic_close_white"), style: .done, target: self, action: #selector(actionTapToCloseButton))
        closeBarButton.tintColor = UIColor.white
        self.navigationItem.rightBarButtonItem = closeBarButton
        
        settingsView.tableView.delegate = self
        settingsView.tableView.dataSource = self
        
        loadData()
    }
    
    func actionTapToCloseButton() {
        dismiss(animated: true, completion: nil)
    }
    
    func loadData() {
        
        var setting = Setting()
        setting.id = 0
        setting.isNotification = true
        setting.title = "Enable Notificaitons"
        setting.content = "Popup notifications on your loan accounts, requests, and our promotions"
        settings.append(setting)
        
        setting = Setting()
        setting.id = 1
        setting.title = "View Disclaimer"
        settings.append(setting)
        
        settingsView.tableView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settings.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let setting = settings[indexPath.row]
        
        let rectTitle = NSString(string: setting.title ?? "").boundingRect(with: CGSize(width: view.frame.width - 20, height: 1000), options: NSStringDrawingOptions.usesFontLeading.union(NSStringDrawingOptions.usesLineFragmentOrigin), attributes: [NSFontAttributeName: UIFont(name: "OpenSans", size: 16)!], context: nil)

        var contentHeight: CGFloat = 0
        
        if let content = setting.content {
            let rectContent = NSString(string: content).boundingRect(with: CGSize(width: view.frame.width - 20, height: 1000), options: NSStringDrawingOptions.usesFontLeading.union(NSStringDrawingOptions.usesLineFragmentOrigin), attributes: [NSFontAttributeName: UIFont(name: "OpenSans", size:14)!], context: nil)
            contentHeight = rectContent.height
        }

        return 10 + rectTitle.height + 2 + contentHeight + 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ItemSettingTableViewCell
        cell.layoutMargins = UIEdgeInsets.zero
        cell.preservesSuperviewLayoutMargins = false
        cell.separatorInset = UIEdgeInsets.zero
        
        cell.bindingData(setting: settings[indexPath.row])
        return cell
    }
    
    var viewPopupController: STPopupController!
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if settings[indexPath.row].id == 0 {

        }
        else if settings[indexPath.row].id == 1 {
            let viewController = DisclaimerViewController()
            viewController.disclaimerDelegate = self
            viewPopupController = STPopupController(rootViewController: viewController)
            viewPopupController.containerView.layer.cornerRadius = 4
            viewPopupController.present(in: self)
        }
    }
    
    func actionTapToOkButton() {
        viewPopupController.dismiss()
    }
}
