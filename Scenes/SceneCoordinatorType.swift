//
//  SceneCoordinatorType.swift
//  RedditTop50Viewer
//
//  Created by Daniel Springer on 8/28/17.
//  Copyright © 2017 Daniel Springer. All rights reserved.
//

import UIKit
protocol SceneCoordinatorType {
    init(window: UIWindow)
    func transition(to scene: Scene, type: SceneTransitionType)
    func pop(animated: Bool) -> Void
}

extension SceneCoordinatorType {
    func pop() -> Void {
        return pop(animated: true)
    }
}
