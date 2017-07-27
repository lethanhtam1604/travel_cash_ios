//
//  MenuViewController.swift
//  TravelCash
//
//  Created by Thanh-Tam Le on 6/13/17.
//  Copyright © 2017 Tam. All rights reserved.
//

import UIKit
import STPopup

class MenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, AlertDelegate, FeedbackDelegate {
    
    let menuView = MenuView()
    
    var menus = [Menu]()

    override func loadView() {
        view = menuView
        view.setNeedsUpdateConstraints()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuView.tableView.delegate = self
        menuView.tableView.dataSource = self
        
        loadData()
    }
    
    func loadData() {
        
        var menu = Menu()
        menu.id = 0
        menu.title = "Contact Us"
        menu.icon = UIImage(named: "ic_location_on")
        menus.append(menu)
        
        menu = Menu()
        menu.id = 1
        menu.title = "Our Promotions"
        menu.icon = UIImage(named: "ic_star_border")
        menus.append(menu)
        
        menu = Menu()
        menu.id = 2
        menu.title = "Feedback"
        menu.icon = UIImage(named: "ic_feedback")
        menus.append(menu)
        
        menu = Menu()
        menu.id = 3
        menu.title = "Settings"
        menu.icon = UIImage(named: "ic_settings")
        menus.append(menu)
        
        menu = Menu()
        menu.id = 4
        menu.title = "Logout"
        menu.icon = UIImage(named: "ic_exit_to_app")
        menus.append(menu)
        
        menuView.tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: "header") as! MenuHeaderView
        
        cell.contentView.backgroundColor = Global.colorMain

        if let user = Global.currentUser {
            cell.bindingData(user: user)
        }

        cell.layoutIfNeeded()
        cell.setNeedsLayout()
        
        return cell.contentView
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menus.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MenuTableViewCell
        cell.bindingData(menu: menus[indexPath.row])
        return cell
    }
    
    var viewPopupController: STPopupController!
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        self.revealViewController().rightRevealToggle(animated: true)
        
        if menus[indexPath.row].id == 0 {
            let viewController = OurLocationViewController()
            let nav = UINavigationController(rootViewController: viewController)
            present(nav, animated: true, completion: nil)
        }
        else if menus[indexPath.row].id == 1 {
            let viewController = OurPromotionViewController()
            let nav = UINavigationController(rootViewController: viewController)
            present(nav, animated: true, completion: nil)
            
        }
        else if menus[indexPath.row].id == 2 {
            let viewController = FeedbackViewController()
            viewController.feedbackDelegate = self
            viewPopupController = STPopupController(rootViewController: viewController)
            viewPopupController.containerView.layer.cornerRadius = 4
            viewPopupController.present(in: self)
        }
        else if menus[indexPath.row].id == 3 {
            let viewController = SettingsViewController()
            let nav = UINavigationController(rootViewController: viewController)
            present(nav, animated: true, completion: nil)
        }
        else {
            Utils.showAlertAction(title: "Logout", message: "Are you sure want to logout?", viewController: self, alertDelegate: self)
        }
    }
    
    func okAlertActionClicked() {
        UserDefaultManager.getInstance().setLogin(value: false)
        Global.currentUser = nil
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let nav = UINavigationController(rootViewController: HomeViewController())
        appDelegate.window?.rootViewController = nav
    }
    
    func actionTapToSendButton() {
        viewPopupController.dismiss()
    }
    
    func actionTapToCancelButton() {
        viewPopupController.dismiss()
    }
}
