//
//  ActiveLoanDetailView.swift
//  TravelCash
//
//  Created by Thanh-Tam Le on 6/21/17.
//  Copyright © 2017 Tam. All rights reserved.
//

import UIKit

class ActiveLoanDetailView: UIView {

    var constraintsAdded = false
    
    let tableView = UITableView(frame: .zero, style: .grouped)
    let indicator = UIActivityIndicatorView(activityIndicatorStyle: .gray)

    convenience init() {
        self.init(frame: .zero)
        
        backgroundColor = UIColor.white
        tintColor = Global.colorMain
        addTapToDismiss()
        
        tableView.backgroundColor = UIColor.clear
        tableView.separatorColor = UIColor.black.withAlphaComponent(0.5)
        tableView.register(ActiveLoanDetailHeaderView.self, forCellReuseIdentifier: "header")
        tableView.register(ItemPaymentTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.tableFooterView = UIView()
        tableView.contentInset = UIEdgeInsetsMake(-36, 0, 0, 0)

        indicator.hidesWhenStopped = true
        indicator.backgroundColor = Global.colorBg

        addSubview(tableView)
        addSubview(indicator)
        setNeedsUpdateConstraints()
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        if !constraintsAdded {
            constraintsAdded = true
            
            tableView.autoPinEdge(toSuperviewEdge: .top, withInset: 0)
            tableView.autoPinEdge(toSuperviewEdge: .left, withInset: 0)
            tableView.autoPinEdge(toSuperviewEdge: .right, withInset: 0)
            tableView.autoPinEdge(toSuperviewEdge: .bottom, withInset: 0)

            indicator.autoPinEdgesToSuperviewEdges()
        }
    }
}
