//
//  HomeScreenProtocols.swift
//  MapApp
//
//  Created by Safak Can Bas on 1.07.2020.
//  Copyright (c) 2020 canbas. All rights reserved.

import UIKit
import GooglePlaces
import GoogleMaps

protocol HomeScreenViewControllerProtocol: BaseViewControllerProtocol {
    func showSelectedLocationObject(response: [LocationModel])
}

protocol HomeScreenPresenterViewProtocol: BasePresenterViewProtocol {
    func getSelectedLocation(place: GMSPlace)
}

protocol HomeScreenInteractorProtocol: BaseInteractorProtocol {
    func requestSelectedLocation(place: GMSPlace)
}

protocol HomeScreenPresenterInteractorProtocol: BaseInteractorProtocol {
    func passSelectedLocationObject(response: [LocationModel])
}
