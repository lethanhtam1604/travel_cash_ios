//
//  OurLocationViewController.swift
//  TravelCash
//
//  Created by Thanh-Tam Le on 6/20/17.
//  Copyright © 2017 Tam. All rights reserved.
//

import UIKit
import MapKit
import DZNEmptyDataSet
import FRHyperLabel

class OurLocationViewController: UIViewController {

    let ourLocationView = OurLocationView()
    var locations = [Location]()

    override func loadView() {
        view = ourLocationView
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

        title = "OUR LOCATIONS"

        let closeBarButton = UIBarButtonItem(image: UIImage(named: "ic_close_white"), style: .done, target: self, action: #selector(actionTapToCloseButton))
        closeBarButton.tintColor = UIColor.white
        self.navigationItem.rightBarButtonItem = closeBarButton

        ourLocationView.tableView.delegate = self
        ourLocationView.tableView.dataSource = self
        ourLocationView.tableView.emptyDataSetSource = self
        ourLocationView.tableView.dataSource = self



        loadData()
    }

    func loadData() {
        ourLocationView.indicator.startAnimating()
        ApiManager.shared.getBranches() { (locationList, status, messsage) in
            if status {
                if let locations = locationList {
                    self.locations = locations
                    self.ourLocationView.tableView.reloadData()
                }
            }
            self.ourLocationView.indicator.stopAnimating()
            self.ourLocationView.mapView.delegate = self
            self.ourLocationView.locationManager.delegate = self
            self.ourLocationView.locationManager.requestWhenInUseAuthorization()
        }
    }

    func actionTapToCloseButton() {
        dismiss(animated: true, completion: nil)
    }
}

extension OurLocationViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locations.count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        let location = locations[indexPath.row]

        let rectName = NSString(string: location.Community).boundingRect(with: CGSize(width: view.frame.width - 20, height: 1000), options: NSStringDrawingOptions.usesFontLeading.union(NSStringDrawingOptions.usesLineFragmentOrigin), attributes: [NSFontAttributeName: UIFont(name: "OpenSans-bold", size: 16)!], context: nil)

        let rectAddress = NSString(string: location.Location).boundingRect(with: CGSize(width: view.frame.width - 20, height: 1000), options: NSStringDrawingOptions.usesFontLeading.union(NSStringDrawingOptions.usesLineFragmentOrigin), attributes: [NSFontAttributeName: UIFont(name: "OpenSans", size: 15)!], context: nil)

        let phoneNumberHeight: CGFloat = CGFloat(25 * (location.phones.count + location.faxes.count))

        return rectName.height + rectAddress.height + 10 + 5 + 10 + 10 + phoneNumberHeight
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! OurLocationTableViewCell
        cell.selectionStyle = .none
        let location = locations[indexPath.row]
        cell.bindingData(location: location)

        return cell
    }
}

extension OurLocationViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let location = locations[indexPath.row]

        var mapRegion = MKCoordinateRegion()
        let coordinate = CLLocationCoordinate2D(latitude: Double(location.Latitude) ?? 0, longitude: Double(location.Langitude) ?? 0)
        ourLocationView.anotation.coordinate = coordinate
        mapRegion.center = coordinate
        mapRegion.span.latitudeDelta = 0.002
        mapRegion.span.longitudeDelta = 0.002
        ourLocationView.mapView.setRegion(mapRegion, animated: true)
    }
}

extension OurLocationViewController: DZNEmptyDataSetSource {

    func title(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! {
        let text = "No Our Locations found"
        let attrs = [NSFontAttributeName: UIFont.preferredFont(forTextStyle: UIFontTextStyle.headline),
                     NSForegroundColorAttributeName: Global.colorSelected]
        return NSAttributedString(string: text, attributes: attrs)
    }
}

extension OurLocationViewController: MKMapViewDelegate {

    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        var location: Location?
        if locations.count > 0 {
            location = locations[0]
        }

        if let newLocation = location {
            var mapRegion = MKCoordinateRegion()
            let coordinate = CLLocationCoordinate2D(latitude: Double(newLocation.Latitude) ?? 0, longitude: Double(newLocation.Langitude) ?? 0)
            ourLocationView.anotation.coordinate = coordinate
            mapRegion.center = coordinate
            mapRegion.span.latitudeDelta = 0.002
            mapRegion.span.longitudeDelta = 0.002
            mapView.setRegion(mapRegion, animated: true)
        }
    }
}

extension OurLocationViewController: CLLocationManagerDelegate {

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status != .authorizedAlways && status != .authorizedWhenInUse {
            ourLocationView.locationManager.requestWhenInUseAuthorization()
        }
        else {
            ourLocationView.locationManager.startUpdatingLocation()
        }
    }
}
