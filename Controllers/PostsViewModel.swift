//
//  PostsViewModel.swift
//  RedditTop50Viewer
//
//  Created by Daniel Springer on 8/28/17.
//  Copyright © 2017 Daniel Springer. All rights reserved.
//

import Foundation

class PostsViewModel {
    
    var postList = [Post?]()
    
    private let sceneCoordinator: SceneCoordinatorType
    private let fetchingService: FetchingServiceType
    
    init(fetchingService: FetchingServiceType, sceneCoordinator: SceneCoordinatorType) {
        self.sceneCoordinator = sceneCoordinator
        self.fetchingService = fetchingService
    }
}
