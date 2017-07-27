//
//  OurLocationView.swift
//  TravelCash
//
//  Created by Thanh-Tam Le on 6/20/17.
//  Copyright © 2017 Tam. All rights reserved.
//

import UIKit
import MapKit

class OurLocationView: UIView {

    var constraintsAdded = false
    
    let mapView = MKMapView()
    let locationManager = CLLocationManager()
    var anotation = MKPointAnnotation()
    
    let tableView = UITableView()
    let indicator = UIActivityIndicatorView(activityIndicatorStyle: .gray)

    convenience init() {
        self.init(frame: .zero)
        
        backgroundColor = UIColor.white
        tintColor = Global.colorMain
        addTapToDismiss()
        
        mapView.showsUserLocation = true
        mapView.addAnnotation(anotation)
        mapView.backgroundColor = Global.colorBg
        
        tableView.backgroundColor = UIColor.clear
        tableView.separatorColor = UIColor.black.withAlphaComponent(0.5)
        tableView.register(OurLocationTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.tableFooterView = UIView()

        indicator.hidesWhenStopped = true
        indicator.backgroundColor = Global.colorBg

        addSubview(mapView)
        addSubview(tableView)
        addSubview(indicator)
        setNeedsUpdateConstraints()
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        if !constraintsAdded {
            constraintsAdded = true
            
            mapView.autoPinEdge(toSuperviewEdge: .top, withInset: 0)
            mapView.autoPinEdge(toSuperviewEdge: .right, withInset: 0)
            mapView.autoPinEdge(toSuperviewEdge: .left, withInset: 0)
            mapView.autoSetDimension(.height, toSize: 300)
            
            tableView.autoPinEdge(.top, to: .bottom, of: mapView, withOffset: 0)
            tableView.autoPinEdge(toSuperviewEdge: .right, withInset: 0)
            tableView.autoPinEdge(toSuperviewEdge: .left, withInset: 0)
            tableView.autoPinEdge(toSuperviewEdge: .bottom, withInset: 0)

            indicator.autoPinEdge(.top, to: .bottom, of: mapView, withOffset: 0)
            indicator.autoPinEdge(toSuperviewEdge: .right, withInset: 0)
            indicator.autoPinEdge(toSuperviewEdge: .left, withInset: 0)
            indicator.autoPinEdge(toSuperviewEdge: .bottom, withInset: 0)
        }
    }
}
