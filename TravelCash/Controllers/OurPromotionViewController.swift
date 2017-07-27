//
//  OurPromotionViewController.swift
//  TravelCash
//
//  Created by Thanh-Tam Le on 6/21/17.
//  Copyright © 2017 Tam. All rights reserved.
//

import UIKit
import DZNEmptyDataSet
import SwiftOverlays

class OurPromotionViewController: UIViewController {

    let ourPromotionView = OurPromotionView()

    var promotions = [Promotion]()

    override func loadView() {
        view = ourPromotionView
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

        title = "OUR PROMOTIONS"

        let closeBarButton = UIBarButtonItem(image: UIImage(named: "ic_close_white"), style: .done, target: self, action: #selector(actionTapToCloseButton))
        closeBarButton.tintColor = UIColor.white
        self.navigationItem.rightBarButtonItem = closeBarButton

        ourPromotionView.tableView.delegate = self
        ourPromotionView.tableView.dataSource = self
        ourPromotionView.tableView.emptyDataSetSource = self

        loadData()
    }

    func actionTapToCloseButton() {
        dismiss(animated: true, completion: nil)
    }

    func loadData() {
        ourPromotionView.indicator.startAnimating()
        if let user = Global.currentUser {
            ApiManager.shared.getPromotions(user_id: user.user_id) { (promotions, status, message) in
                if let promotionList = promotions {
                    self.promotions = promotionList
                    self.ourPromotionView.tableView.reloadData()
                }
                self.ourPromotionView.indicator.stopAnimating()
            }
        }
        else {
            self.ourPromotionView.indicator.stopAnimating()
        }
    }

    func actionTapToLikeButton(_ sender: UIButton!) {

        let promotion = promotions[sender.tag]
        var type = ""

        if promotion.liked == "" {
            type = "UNLIKE"
        }
        else {
            type = "LIKE"
        }

        if let user = Global.currentUser {
            SwiftOverlays.showBlockingWaitOverlay()
            ApiManager.shared.setPromotionView(type: type, promotionId: promotion.id, userId: user.user_id, completion: { (status, message) in
                SwiftOverlays.removeAllBlockingOverlays()
                if status {
                    if promotion.liked == "" {
                        promotion.liked = "1"
                        sender.setTitle("UNLIKE", for: .normal)
                    }
                    else {
                        promotion.liked = ""
                        sender.setTitle("LIKE", for: .normal)
                    }
                }
                else {
                    Utils.showAlert(title: "Travel Cash", message: message ?? "", viewController: self)
                }
            })
        }
        else {
            Utils.showAlert(title: "Travel Cash", message: "Could not connect to server. Please try again!", viewController: self)
        }
    }

    func actionTapToShareButton(_ sender: UIButton!) {
        let promotion = promotions[sender.tag]

        let image = Global.imageUrl + promotion.banner_large
        let objectsToShare = [promotion.name, image] as [Any]
        let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
        if let wPPC = activityVC.popoverPresentationController {
            wPPC.sourceView = sender
        }
        self.present(activityVC, animated: true, completion: nil)
    }
}

extension OurPromotionViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return promotions.count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        let rectTitle = NSString(string: "Christmas Song 1").boundingRect(with: CGSize(width: view.frame.width - 20, height: 1000), options: NSStringDrawingOptions.usesFontLeading.union(NSStringDrawingOptions.usesLineFragmentOrigin), attributes: [NSFontAttributeName: UIFont(name: "OpenSans", size: 15)!], context: nil)

        return 250 + 10 + rectTitle.height + 20 + 10 + 10 + 30
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! OurPromotionTableViewCell
        cell.layoutMargins = UIEdgeInsets.zero
        cell.preservesSuperviewLayoutMargins = false
        cell.separatorInset = UIEdgeInsets.zero
        cell.backgroundColor = UIColor.clear
        cell.selectionStyle = .none

        cell.bindingData(promotion: promotions[indexPath.row])

        cell.likeBtn.tag = indexPath.row
        cell.shareBtn.tag = indexPath.row

        cell.likeBtn.addTarget(self, action: #selector(actionTapToLikeButton), for: .touchUpInside)
        cell.shareBtn.addTarget(self, action: #selector(actionTapToShareButton), for: .touchUpInside)

        return cell
    }
}

extension OurPromotionViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

    }
}

extension OurPromotionViewController: DZNEmptyDataSetSource {

    func title(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! {
        let text = "No promotion list found"
        let attrs = [NSFontAttributeName: UIFont.preferredFont(forTextStyle: UIFontTextStyle.headline),
                     NSForegroundColorAttributeName: Global.colorSelected]
        return NSAttributedString(string: text, attributes: attrs)
    }
}
