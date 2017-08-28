//
//  Scene+ViewController.swift
//  RedditTop50Viewer
//
//  Created by Daniel Springer on 8/28/17.
//  Copyright © 2017 Daniel Springer. All rights reserved.
//

import Foundation

import UIKit

extension Scene {
    func viewController() -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        switch self { //Switch on the type of scene we want to display
        case .postList(let viewModel):
            let nc = storyboard.instantiateViewController(withIdentifier: "PostsList") as! UINavigationController
            var vc = nc.viewControllers.first as! PostsViewController
            //We call this bind after the view is loaded and outlets are loaded
            vc.bindViewModel(to: viewModel)
            return nc
            
        }
    }
    
    
}
