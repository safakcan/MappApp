//
//  DetailScreenPresenter.swift
//  MapApp
//
//  Created by Safak Can Bas on 3.07.2020.
//  Copyright (c) 2020 canbas. All rights reserved.
//

import UIKit

class DetailScreenPresenter: BasePresenter {
    
    // MARK: - Private properties -
    fileprivate weak var viewController: DetailScreenViewControllerProtocol!
    fileprivate var interactor: DetailScreenInteractorProtocol!
    var selectedLocationData: [LocationModel]?
    // MARK: - Lifecycle -
    init(viewController: DetailScreenViewControllerProtocol, interactor: DetailScreenInteractorProtocol, extras: Any?) {
        self.viewController = viewController
        self.interactor = interactor
        self.selectedLocationData = extras as? [LocationModel]
    }
}
extension DetailScreenPresenter: DetailScreenPresenterViewProtocol {
    func getLocationDetail() {
        guard let selected = self.selectedLocationData else {return}
        viewController.configureSelectedLocation(selectedLocation: selected)
    }
    
}

extension DetailScreenPresenter: DetailScreenPresenterInteractorProtocol {
}
