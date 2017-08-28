//
//  SceneCoordinator.swift
//  RedditTop50Viewer
//
//  Created by Daniel Springer on 8/28/17.
//  Copyright © 2017 Daniel Springer. All rights reserved.
//

import UIKit

class SceneCoordinator: SceneCoordinatorType {

    fileprivate var window: UIWindow
    fileprivate var currentViewController: UIViewController
    
    required init(window: UIWindow) { //If we pass in this window we can get it's root VC
        self.window = window
        currentViewController = window.rootViewController!
    }
    
    //Gets the VC instead of the Navigation VC
    static func actualViewController(for viewController: UIViewController) -> UIViewController {
        if let navigationController = viewController as? UINavigationController {
            return navigationController.viewControllers.first!
        } else {
            return viewController
        }
    }
    
    func transition(to scene: Scene, type: SceneTransitionType) {
        let viewController = scene.viewController() //Get our VC whatever its type
        switch type { //Switch on the type of transition we want
        case .root:
            currentViewController = SceneCoordinator.actualViewController(for: viewController) //before transition
            window.rootViewController = viewController
            
        case .push:
            guard let navigationController = currentViewController.navigationController else {
                fatalError("Can't push a view controller without a current navigation controller")
            }
            navigationController.pushViewController(viewController, animated: true)
            currentViewController = SceneCoordinator.actualViewController(for: viewController)
            
        case .modal:
            currentViewController.present(viewController, animated: true) {
            }
            currentViewController = SceneCoordinator.actualViewController(for: viewController)
        }

    }
    
    func pop(animated: Bool) {
        if let presenter = currentViewController.presentingViewController {
            // dismiss a modal controller
            currentViewController.dismiss(animated: animated) {
                self.currentViewController = SceneCoordinator.actualViewController(for: presenter)
                
            }
        } else if let navigationController = currentViewController.navigationController {
            
            guard navigationController.popViewController(animated: animated) != nil else {
                fatalError("can't navigate back from \(currentViewController)")
            }
            currentViewController = SceneCoordinator.actualViewController(for: navigationController.viewControllers.last!)
        } else {
            fatalError("Not a modal, no navigation controller: can't navigate back from \(currentViewController)")
        }
    }    
}
