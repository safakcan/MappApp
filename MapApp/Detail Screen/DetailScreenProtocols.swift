//
//  DetailScreenProtocols.swift
//  MapApp
//
//  Created by Safak Can Bas on 3.07.2020.
//  Copyright (c) 2020 canbas. All rights reserved.

import UIKit

protocol DetailScreenViewControllerProtocol: BaseViewControllerProtocol {
    func configureSelectedLocation(selectedLocation: [LocationModel])
}

protocol DetailScreenPresenterViewProtocol: BasePresenterViewProtocol {
    func getLocationDetail()
}

protocol DetailScreenInteractorProtocol: BaseInteractorProtocol {
}

protocol DetailScreenPresenterInteractorProtocol: BaseInteractorProtocol {
}
