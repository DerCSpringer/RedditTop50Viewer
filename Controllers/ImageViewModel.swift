//
//  ImageViewModel.swift
//  RedditTop50Viewer
//
//  Created by Daniel Springer on 8/28/17.
//  Copyright © 2017 Daniel Springer. All rights reserved.
//

import Foundation

class ImageViewModel {
    
    private let fetchingService: FetchingServiceType
    private let sceneCoordinator: SceneCoordinatorType
    private(set)var imageURL: URL
    var imageData: Data?
    var didFetchImage: (() -> Void)?
    
    init(fetchingService: FetchingServiceType, sceneCoordinator:SceneCoordinatorType, imageURL: URL) {
        self.fetchingService = fetchingService
        self.sceneCoordinator = sceneCoordinator
        self.imageURL = imageURL
        var componenets = URLComponents.init(url: imageURL, resolvingAgainstBaseURL: true)
        componenets?.scheme = "https"
        
        if var newURL = componenets?.url {
            if newURL.pathExtension == "" {
                newURL.appendPathExtension("jpg")
            }
            self.imageURL = newURL
        }
    }
    
    func fetchImage() {
        self.fetchingService.getImage(url: self.imageURL) {[weak self] (data, error) in
            //handle errors
            self?.imageData = data
            self?.didFetchImage?()
        }
    }
    
    func didTouchBackButton() {
        self.sceneCoordinator.pop()
    }

}
