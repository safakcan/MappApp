//
//  HomeScreenPresenter.swift
//  MapApp
//
//  Created by Safak Can Bas on 1.07.2020.
//  Copyright (c) 2020 canbas. All rights reserved.
//

import UIKit
import GooglePlaces
import GoogleMaps

class HomeScreenPresenter: BasePresenter {
    
    // MARK: - Private properties -
    fileprivate weak var viewController: HomeScreenViewControllerProtocol!
    fileprivate var interactor: HomeScreenInteractorProtocol!
    
    // MARK: - Lifecycle -
    init(viewController: HomeScreenViewControllerProtocol, interactor: HomeScreenInteractorProtocol, extras: Any?) {
        self.viewController = viewController
        self.interactor = interactor
    }
}
extension HomeScreenPresenter: HomeScreenPresenterViewProtocol {
    func getSelectedLocation(place: GMSPlace) {
        interactor.requestSelectedLocation(place: place)
    }
    
}

extension HomeScreenPresenter: HomeScreenPresenterInteractorProtocol {
    func passSelectedLocationObject(response: [LocationModel]) {
        viewController.showSelectedLocationObject(response: response)
    }
    
}
