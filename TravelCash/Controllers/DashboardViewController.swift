//
//  DashboardViewController.swift
//  TravelCash
//
//  Created by Thanh-Tam Le on 6/13/17.
//  Copyright © 2017 Tam. All rights reserved.
//

import UIKit
import STPopup
import DZNEmptyDataSet

class DashboardViewController: UIViewController {
    
    let dashboardView = DashboardView()
    var notificationBarButton: UIBarButtonItem?

    var activeLoans = [ActiveLoan]()
    var promotions = [Promotion]()
    var notifications = [Notification]()
    var currentSlide:Int = 0

    override func loadView() {
        view = dashboardView
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
        
        title = "HOME"
        
        let revealController = revealViewController()
        let menuBarButton = UIBarButtonItem(image: UIImage(named: "menu"), style: .done, target: revealViewController, action: #selector(revealController?.revealToggle))
        menuBarButton.tintColor = UIColor.white
        self.navigationItem.leftBarButtonItem = menuBarButton
        
        notificationBarButton = UIBarButtonItem(image: UIImage(named: "ic_notifications_none"), style: .done, target: self, action: #selector(actionTapToNotificationButton))
        notificationBarButton?.tintColor = UIColor.white
        self.navigationItem.rightBarButtonItem = notificationBarButton
        
        view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())

        dashboardView.tableView.delegate = self
        dashboardView.tableView.dataSource = self

        dashboardView.collectionView.delegate = self
        dashboardView.collectionView.dataSource = self

        loadData()
    }
    
    func loadData() {

        dashboardView.indicator.startAnimating()
        if let user = Global.currentUser {
            ApiManager.shared.getNotificationList(trn: user.trn) { (notifcationList, status, messsage) in
                if status {
                    if let notifications = notifcationList {
                        self.notifications = notifications
                        var count = 0
                        for item in notifications {
                            if item.read_stamp == "" {
                                count += 1
                            }
                        }

                        if count != 0 {
                            self.notificationBarButton?.addBadge(number: count, withOffset: CGPoint(x: 8, y: -3), andColor: UIColor.red, andFilled: true)
                        }
                    }
                }
            }
        }

        if let user = Global.currentUser {
            ApiManager.shared.getUserLoan(trn: user.trn) { (activeLoans, status, message) in
                if let activeLoanList = activeLoans {
                    self.activeLoans = activeLoanList
                    self.dashboardView.tableView.reloadData()
                }
                self.dashboardView.indicator.stopAnimating()
            }
        }


        if let user = Global.currentUser {
            ApiManager.shared.getPromotions(user_id: user.user_id) { (promotions, status, message) in
                if let promotionList = promotions {
                    self.promotions = promotionList
                    self.dashboardView.collectionView.reloadData()
                    self.dashboardView.pageControl.numberOfPages = self.promotions.count
                }
            }
        }
        
        Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(runSliderInLoop), userInfo: nil, repeats: true)
    }
    
    func runSliderInLoop() {
        if promotions.count != 0 {
            if currentSlide == promotions.count - 1 {
                currentSlide = 0
            } else {
                currentSlide += 1
            }
        
            dashboardView.collectionView.scrollToItem(at: IndexPath(row: currentSlide, section: 0), at: UICollectionViewScrollPosition.centeredHorizontally, animated: true)
            dashboardView.pageControl.currentPage = Int(currentSlide)
        }
    }
    
    func actionTapToNewLoanRequestButton() {
        let viewController = NewLoanRequestViewController()
        let nav = UINavigationController(rootViewController: viewController)
        present(nav, animated: true, completion: nil)
    }
    
    func actionTapToApplyForLoanButton() {
        let viewController = PersonalInfoViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    var viewPopupController: STPopupController!
    
    func actionTapToMakeRequestButton() {
        let viewController = MakeRequestViewController()
        viewController.makeRequestDelegate = self
        viewPopupController = STPopupController(rootViewController: viewController)
        viewPopupController.containerView.layer.cornerRadius = 4
        viewPopupController.present(in: self)
    }
    
    func actionTapToNotificationButton() {
        let viewController = NotificationViewController()
        viewController.notifications = notifications
        navigationController?.pushViewController(viewController, animated: true)
    }
}

extension DashboardViewController: MakeRequestDelegate {

    func actionTapToSendButton() {
        viewPopupController.dismiss()
    }

    func actionTapToCancelButton() {
        viewPopupController.dismiss()
    }
}

extension DashboardViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10 + 45 + 10 + 45 + 10 + 45 + 10 + 35 + 2
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: "header") as! ActiveLoanHeaderView

        cell.layoutIfNeeded()
        cell.setNeedsLayout()

        cell.newLoanRequestButton.addTarget(self, action: #selector(actionTapToNewLoanRequestButton), for: .touchUpInside)
        cell.applyForLoanButton.addTarget(self, action: #selector(actionTapToApplyForLoanButton), for: .touchUpInside)
        cell.makeRequest.addTarget(self, action: #selector(actionTapToMakeRequestButton), for: .touchUpInside)

        return cell.contentView
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return activeLoans.count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        let activeLoan = activeLoans[indexPath.row]

        let arrears = Double(activeLoan.Arrears) ?? 0

        if arrears >= 0 {
            return 10 + 6 + 80
        }
        else {
            return 10 + 6 + 60
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ActiveLoanTableViewCell
        cell.layoutMargins = UIEdgeInsets.zero
        cell.preservesSuperviewLayoutMargins = false
        cell.separatorInset = UIEdgeInsets.zero

        cell.bindingData(activeLoan: activeLoans[indexPath.row])

        return cell
    }
}

extension DashboardViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let viewController = ActiveLoanDetailViewController()
        viewController.activeLoan = activeLoans[indexPath.row]
        navigationController?.pushViewController(viewController, animated: true)
    }
}

extension DashboardViewController: UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return promotions.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PromotionCollectionViewCell

        cell.bindingData(promotion: promotions[indexPath.row])
        return cell
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {

        let pageNumber = round(dashboardView.collectionView.contentOffset.x / dashboardView.collectionView.frame.size.width)
        dashboardView.pageControl.currentPage = Int(pageNumber)
        currentSlide = Int(pageNumber)
    }
}

extension DashboardViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

    }
}
