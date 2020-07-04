//
//  DetailScreenWireframe.swift
//  MapApp
//
//  Created by Safak Can Bas on 3.07.2020.
//  Copyright (c) 2020 canbas. All rights reserved.
//

import UIKit

final class DetailScreenWireframe: BaseWireframe {
    
    func show(transationType: WireframeTransitionType, extras: Any? = nil) {
        let viewController: DetailScreenViewController = UIStoryboard.mainStoryBoard.instantiateViewController()
        
        let interactor = DetailScreenInteractor(networkService: NetworkService.sharedInstance)
        let presenter = DetailScreenPresenter(viewController: viewController, interactor: interactor, extras: extras)
        
        viewController.presenter = presenter
        interactor.presenter = presenter
        
        changeView(transationType: transationType, viewController: viewController)
    }
}
