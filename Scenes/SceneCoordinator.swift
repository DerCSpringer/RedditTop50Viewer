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
        
    }
    
    func pop(animated: Bool) {
        
    }
    
    

}
