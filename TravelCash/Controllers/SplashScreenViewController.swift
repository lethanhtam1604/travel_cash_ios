//
//  SplashScreenViewController.swift
//  TravelCash
//
//  Created by Thanh-Tam Le on 6/28/17.
//  Copyright © 2017 Tam. All rights reserved.
//

import UIKit

class SplashScreenViewController: UIViewController, SWRevealViewControllerDelegate {

    let splashScreenView = SplashScreenView()

    override func loadView() {
        view = splashScreenView
        view.setNeedsUpdateConstraints()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        if !UserDefaultManager.getInstance().is_Login() {
            nagivateToHomePage()
        }
        else {
            let trn = UserDefaultManager.getInstance().getTRN()
            let pass = UserDefaultManager.getInstance().getPass()

            ApiManager.shared.login(trn: trn ?? "", password: pass ?? "") { (user, success, message) in
                if success {
                    Global.currentUser = user
                    self.navigateToDashboardPage()
                }
                else {
                    self.nagivateToHomePage()
                }
            }
        }
    }

    func nagivateToHomePage() {
        let nav = UINavigationController(rootViewController: HomeViewController())
        let appDelegate  = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = nav
    }

    func navigateToDashboardPage() {
        let menuViewController = MenuViewController()

        let dashboardViewController = DashboardViewController()
        let dashboardNavigationController = UINavigationController(rootViewController: dashboardViewController)

        let revealViewController = SWRevealViewController(rearViewController: menuViewController, frontViewController: dashboardNavigationController)
        revealViewController?.delegate = self
        revealViewController?.frontViewShadowOpacity = 0.5
        revealViewController?.frontViewShadowRadius = 1

        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController?.present(revealViewController!, animated: true, completion: nil)
    }
}
