//
//  DashboardView.swift
//  TravelCash
//
//  Created by Thanh-Tam Le on 6/20/17.
//  Copyright © 2017 Tam. All rights reserved.
//

import UIKit

class DashboardView: UIView {
    
    var constraintsAdded = false
    
    let pageControl = UIPageControl()
    
    let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: PromotionCollectionViewFlowLayout())
    let tableView = UITableView(frame: .zero, style: .grouped)
    let indicator = UIActivityIndicatorView(activityIndicatorStyle: .gray)

    convenience init() {
        self.init(frame: .zero)
        
        backgroundColor = UIColor.white
        tintColor = Global.colorMain
        addTapToDismiss()
        
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = UIColor.gray.withAlphaComponent(0.5)
        pageControl.currentPageIndicatorTintColor = UIColor.white
        
        let p: CGFloat = 0
        
        collectionView.backgroundColor = Global.colorBg
        collectionView.register(PromotionCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.indicatorStyle = .white
        collectionView.contentInset = UIEdgeInsetsMake(p, 0, p, p)
        collectionView.showsHorizontalScrollIndicator = false
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsetsMake(p, 0, p, p)
        layout.minimumLineSpacing = p
        
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: 220)

        tableView.backgroundColor = UIColor.clear
        tableView.separatorColor = UIColor.black.withAlphaComponent(0.5)
        tableView.register(ActiveLoanHeaderView.self, forCellReuseIdentifier: "header")
        tableView.register(ActiveLoanTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.tableFooterView = UIView()
        tableView.contentInset = UIEdgeInsetsMake(-36, 0, 0, 0)

        indicator.hidesWhenStopped = true
        indicator.backgroundColor = Global.colorBg

        addSubview(collectionView)
        addSubview(pageControl)
        addSubview(tableView)
        addSubview(indicator)
        setNeedsUpdateConstraints()
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        if !constraintsAdded {
            constraintsAdded = true
            
            collectionView.autoPinEdge(toSuperviewEdge: .top, withInset: 0)
            collectionView.autoPinEdge(toSuperviewEdge: .left, withInset: 0)
            collectionView.autoPinEdge(toSuperviewEdge: .right, withInset: 0)
            collectionView.autoSetDimension(.height, toSize: 220)
            
            pageControl.autoPinEdge(toSuperviewEdge: .top, withInset: 200)
            pageControl.autoPinEdge(toSuperviewEdge: .left, withInset: 0)
            pageControl.autoPinEdge(toSuperviewEdge: .right, withInset: 0)
            pageControl.autoSetDimension(.height, toSize: 20)
            
            tableView.autoPinEdge(.top, to: .bottom, of: collectionView, withOffset: 0)
            tableView.autoPinEdge(toSuperviewEdge: .left, withInset: 0)
            tableView.autoPinEdge(toSuperviewEdge: .right, withInset: 0)
            tableView.autoPinEdge(toSuperviewEdge: .bottom, withInset: 0)

            indicator.autoPinEdge(.top, to: .bottom, of: collectionView, withOffset: 0)
            indicator.autoPinEdge(toSuperviewEdge: .left, withInset: 0)
            indicator.autoPinEdge(toSuperviewEdge: .right, withInset: 0)
            indicator.autoPinEdge(toSuperviewEdge: .bottom, withInset: 0)
        }
    }
}
