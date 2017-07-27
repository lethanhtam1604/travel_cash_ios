//
//  SettingsView.swift
//  TravelCash
//
//  Created by Thanh-Tam Le on 6/21/17.
//  Copyright © 2017 Tam. All rights reserved.
//

import UIKit

class SettingsView: UIView {

    var constraintsAdded = false
    
    let tableView = UITableView()
    
    convenience init() {
        self.init(frame: .zero)
        
        backgroundColor = UIColor.white
        
        tableView.backgroundColor = UIColor.clear
        tableView.separatorColor = UIColor.gray.withAlphaComponent(0.5)
        tableView.register(ItemSettingTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.tableFooterView = UIView()
        
        addSubview(tableView)
        setNeedsUpdateConstraints()
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        if !constraintsAdded {
            constraintsAdded = true
            
            tableView.autoPinEdgesToSuperviewEdges()
        }
    }
}
