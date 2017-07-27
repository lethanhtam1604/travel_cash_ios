//
//  ActiveLoanDetailViewController.swift
//  TravelCash
//
//  Created by Thanh-Tam Le on 6/21/17.
//  Copyright © 2017 Tam. All rights reserved.
//

import UIKit

class ActiveLoanDetailViewController: UIViewController {
    
    let activeLoanDetailView = ActiveLoanDetailView()
    var activeLoan = ActiveLoan()

    var statements = [Statement]()

    override func loadView() {
        view = activeLoanDetailView
        view.setNeedsUpdateConstraints()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //enable swipe back when it changed leftBarButtonItem
        navigationController?.interactivePopGestureRecognizer?.delegate = nil
        
        title = "LOAN #" + activeLoan.LoanId
        
        let backBarButton = UIBarButtonItem(image: UIImage(named: "i_nav_back"), style: .done, target: self, action: #selector(actionTapToBackButton))
        backBarButton.tintColor = UIColor.white
        self.navigationItem.leftBarButtonItem = backBarButton
        
        activeLoanDetailView.tableView.delegate = self
        activeLoanDetailView.tableView.dataSource = self
        
        loadData()
    }
    
    func loadData() {

        activeLoanDetailView.indicator.startAnimating()
        ApiManager.shared.getLoanMiniStatement(loanId: activeLoan.LoanId) { (statements, status, message) in
            if let statementList = statements {
                self.statements = statementList
                self.activeLoanDetailView.tableView.reloadData()
            }
            self.activeLoanDetailView.indicator.stopAnimating()
        }
    }
    
    func actionTapToBackButton() {
        navigationController?.popViewController(animated: true)
    }
}

extension ActiveLoanDetailViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {

        let rectTitle = NSString(string: "Mini Statement").boundingRect(with: CGSize(width: view.frame.width - 20, height: 1000), options: NSStringDrawingOptions.usesFontLeading.union(NSStringDrawingOptions.usesLineFragmentOrigin), attributes: [NSFontAttributeName: UIFont(name: "OpenSans-bold", size: 20)!], context: nil)

        let rectTransAmount = NSString(string: "Trans. Amount").boundingRect(with: CGSize(width: (view.frame.size.width - 10 - 20)/3, height: 1000), options: NSStringDrawingOptions.usesFontLeading.union(NSStringDrawingOptions.usesLineFragmentOrigin), attributes: [NSFontAttributeName: UIFont(name: "OpenSans-bold", size: 16)!], context: nil)

        return 20 + rectTitle.height + 10 + 20 + 5 + 20 + 5 + 2 + 5 + rectTransAmount.height + 10
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: "header") as! ActiveLoanDetailHeaderView

        cell.bindingData(activeLoan: activeLoan)

        cell.layoutIfNeeded()
        cell.setNeedsLayout()

        return cell.contentView
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return statements.count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ItemPaymentTableViewCell
        cell.layoutMargins = UIEdgeInsets.zero
        cell.preservesSuperviewLayoutMargins = false
        cell.separatorInset = UIEdgeInsets.zero
        cell.selectionStyle = .none

        cell.bindingData(statement: statements[indexPath.row])

        return cell
    }
}

extension ActiveLoanDetailViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

    }
}
