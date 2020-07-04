//
//  HomeScreenWireframe.swift
//  MapApp
//
//  Created by Safak Can Bas on 1.07.2020.
//  Copyright (c) 2020 canbas. All rights reserved.
//

import UIKit

final class HomeScreenWireframe: BaseWireframe {
    
    func show(transationType: WireframeTransitionType, extras: Any? = nil) {
        let viewController: HomeScreenViewController = UIStoryboard.mainStoryBoard.instantiateViewController()
        
        let interactor = HomeScreenInteractor(networkService: NetworkService.sharedInstance)
        let presenter = HomeScreenPresenter(viewController: viewController, interactor: interactor, extras: extras)
        
        viewController.presenter = presenter
        interactor.presenter = presenter
        
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.navigationBar.isHidden = false
        
        changeView(transationType: transationType, viewController: navigationController)
    }
}
