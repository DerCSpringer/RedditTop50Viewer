//
//  ImageViewModel.swift
//  RedditTop50Viewer
//
//  Created by Daniel Springer on 8/28/17.
//  Copyright © 2017 Daniel Springer. All rights reserved.
//

import Foundation

class ImageViewModel {
    
    let fetchingService: FetchingServiceType
    let sceneCoordinator:SceneCoordinatorType
    let imageURL: URL
    var imageData: Data?
    var didFetchImage: (() -> Void)?
    
    init(fetchingService: FetchingServiceType, sceneCoordinator:SceneCoordinatorType, imageURL: URL) {
        self.fetchingService = fetchingService
        self.sceneCoordinator = sceneCoordinator
        self.imageURL = imageURL
        var componenets = URLComponents.init(url: imageURL, resolvingAgainstBaseURL: true)
        componenets?.scheme = "https"
        let newURL = componenets?.url
        
    }
    
    
}
