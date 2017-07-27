//
//  NotificationViewController.swift
//  TravelCash
//
//  Created by Thanh-Tam Le on 6/21/17.
//  Copyright © 2017 Tam. All rights reserved.
//

import UIKit
import DZNEmptyDataSet
import SwiftOverlays

class NotificationViewController: UIViewController {

    let notificationView = NotificationView()

    var notifications = [Notification]()

    override func loadView() {
        view = notificationView
        view.setNeedsUpdateConstraints()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        //enable swipe back when it changed leftBarButtonItem
        navigationController?.interactivePopGestureRecognizer?.delegate = nil

        title = "NOTIFICATION"

        let backBarButton = UIBarButtonItem(image: UIImage(named: "i_nav_back"), style: .done, target: self, action: #selector(actionTapToBackButton))
        backBarButton.tintColor = UIColor.white
        self.navigationItem.leftBarButtonItem = backBarButton


        notificationView.tableView.delegate = self
        notificationView.tableView.dataSource = self
        notificationView.tableView.emptyDataSetSource = self

        loadData()
    }

    func actionTapToBackButton() {
        navigationController?.popViewController(animated: true)
    }

    func loadData() {
        notificationView.tableView.reloadData()
    }
}

extension NotificationViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notifications.count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        let notification = notifications[indexPath.row]

        let rectTitle = NSString(string: notification.type).boundingRect(with: CGSize(width: view.frame.width - 20, height: 1000), options: NSStringDrawingOptions.usesFontLeading.union(NSStringDrawingOptions.usesLineFragmentOrigin), attributes: [NSFontAttributeName: UIFont(name: "OpenSans", size: 15)!], context: nil)

        let rectContent = NSString(string: notification.message).boundingRect(with: CGSize(width: view.frame.width - 20, height: 1000), options: NSStringDrawingOptions.usesFontLeading.union(NSStringDrawingOptions.usesLineFragmentOrigin), attributes: [NSFontAttributeName: UIFont(name: "OpenSans", size: 14)!], context: nil)

        return 10 + rectTitle.height + 2 + rectContent.height + 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NotificationTableViewCell
        cell.layoutMargins = UIEdgeInsets.zero
        cell.preservesSuperviewLayoutMargins = false
        cell.separatorInset = UIEdgeInsets.zero

        cell.bindingData(notification: notifications[indexPath.row])
        return cell
    }
}

extension NotificationViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let cell = tableView.cellForRow(at: NSIndexPath(item: indexPath.row, section: 0) as IndexPath) as! NotificationTableViewCell

        let notification = notifications[indexPath.row]

        if notification.read_stamp == "" {
            SwiftOverlays.showBlockingWaitOverlay()
            ApiManager.shared.updateNotificationReadByTrn(notificaitonId: String(notification.id), completion: { (status, message) in
                cell.backgroundColor = UIColor.white
                SwiftOverlays.removeAllBlockingOverlays()
            })
        }
    }
}

extension NotificationViewController: DZNEmptyDataSetSource {

    func title(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! {
        let text = "No notification list found"
        let attrs = [NSFontAttributeName: UIFont.preferredFont(forTextStyle: UIFontTextStyle.headline),
                     NSForegroundColorAttributeName: Global.colorSelected]
        return NSAttributedString(string: text, attributes: attrs)
    }
}
