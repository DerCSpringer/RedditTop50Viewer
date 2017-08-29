//
//  AppDelegate.swift
//  RedditTop50Viewer
//
//  Created by Daniel Springer on 8/24/17.
//  Copyright © 2017 Daniel Springer. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let fetchingService = RedditAPI()
        let sceneCoordinator = SceneCoordinator(window:window!)
        let postsViewModel = PostsViewModel(fetchingService: fetchingService, sceneCoordinator: sceneCoordinator)
        let firstScene = Scene.postList(postsViewModel)
        sceneCoordinator.transition(to: firstScene, type: .root)
        return true
    }
}

