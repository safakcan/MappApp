//
//  HomeScreenViewController.swift
//  MapApp
//
//  Created by Safak Can Bas on 1.07.2020.
//  Copyright (c) 2020 canbas. All rights reserved.

import UIKit
import GooglePlaces
import GoogleMaps

class HomeScreenViewController: BaseViewController {
    
    var presenter: HomeScreenPresenterViewProtocol!
    var resultsViewController: GMSAutocompleteResultsViewController?
    var searchController: UISearchController?
    var resultView: UITextView?
    let locationManager = CLLocationManager()
    var selectedLocationData: [LocationModel]?
    @IBOutlet weak var mapView: GMSMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationCoinfigs()
        mapViewConfigs()
        searchControllerConfigs()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
}

extension HomeScreenViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
    }
}

extension HomeScreenViewController: GMSAutocompleteResultsViewControllerDelegate {
    func resultsController(_ resultsController: GMSAutocompleteResultsViewController,
                           didAutocompleteWith place: GMSPlace) {
        searchController?.isActive = false
        presenter.getSelectedLocation(place: place)
        markerConfigs(place: place)
    }
    
    func resultsController(_ resultsController: GMSAutocompleteResultsViewController,
                           didFailAutocompleteWithError error: Error){
        // TODO: handle the error.
        print("Error: ", error.localizedDescription)
    }
    
}
extension HomeScreenViewController: GMSMapViewDelegate {
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        if let navigationController = navigationController {
            DetailScreenWireframe().show(transationType: .push(navigationController: navigationController),extras: self.selectedLocationData)
        }
        return true
    }
}

extension HomeScreenViewController: HomeScreenViewControllerProtocol {
    func showSelectedLocationObject(response: [LocationModel]) {
        self.selectedLocationData = response
    }
    func searchControllerConfigs() {
        resultsViewController = GMSAutocompleteResultsViewController()
        resultsViewController?.delegate = self
        
        searchController = UISearchController(searchResultsController: resultsViewController)
        searchController?.searchResultsUpdater = resultsViewController
        
        searchController?.searchBar.sizeToFit()
        navigationItem.titleView = searchController?.searchBar
        
        definesPresentationContext = true
        searchController?.hidesNavigationBarDuringPresentation = false
    }
    func mapViewConfigs() {
        mapView.delegate = self
        mapView.settings.compassButton = true
        mapView.isMyLocationEnabled = true
        mapView.settings.myLocationButton = true
        if let location = locationManager.location {
            mapView.camera = GMSCameraPosition.camera(withTarget: location.coordinate, zoom: 10.0)
        }
        self.view.addSubview(mapView)
    }
    func locationCoinfigs() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager.requestAlwaysAuthorization()
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyKilometer
            locationManager.startUpdatingLocation()
        }
    }
    func markerConfigs(place: GMSPlace) {
        let position = CLLocationCoordinate2D(latitude: place.coordinate.latitude, longitude: place.coordinate.longitude)
        
        mapView.camera = GMSCameraPosition.camera(withTarget: place.coordinate, zoom: 10.0)
        let marker = GMSMarker(position: position)
        mapView.clear()
        marker.title = place.name
        marker.map = mapView
    }
    
}

