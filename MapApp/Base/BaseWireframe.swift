//
//  BaseWireframe.swift
//  MapApp
//
//  Created by Safak Can Bas on 1.07.2020.
//  Copyright (c) 2020 canbas. All rights reserved.
//

import UIKit


enum WireframeTransitionType {
    case root
    case presentFullScreen(fromViewController: UIViewController)
    case push(navigationController: UINavigationController)
}

class BaseWireframe {
    
    internal func changeView(transationType: WireframeTransitionType, viewController: UIViewController) {
        switch transationType {
        case .root:
            let appDelegate = UIApplication.shared.delegate as? AppDelegate
                viewController.modalTransitionStyle = .crossDissolve
                appDelegate!.window?.rootViewController = viewController
        case .presentFullScreen(let fromViewController):
            viewController.modalPresentationStyle = .fullScreen
            fromViewController.present(viewController, animated: true, completion: nil)
        case .push(let navigationController):
            viewController.hidesBottomBarWhenPushed = true
            navigationController.pushViewController(viewController, animated: true)
      
        }
    }
}
