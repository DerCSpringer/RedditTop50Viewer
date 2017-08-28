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
    var didUpdate: (() -> Void)?
    var didUpdateModelObjectAtIndex: ((Int) -> Void)?
    
    private let sceneCoordinator: SceneCoordinatorType
    private let fetchingService: FetchingServiceType
    
    init(fetchingService: FetchingServiceType, sceneCoordinator: SceneCoordinatorType) {
        self.sceneCoordinator = sceneCoordinator
        self.fetchingService = fetchingService
    }
    
    private func getPosts(after: String) {
        self.fetchingService.getPostsAfter(after, withCount: 10) { [weak self] (posts, error) in
            if error != nil {
                switch error! {
                case .Unknown:
                    print("An unknown error has occured")
                case .FailedRequest:
                    print("Failed request has occured")
                case .InvalidResponse:
                    print("Invalid resposes")
                }
            } else {
                if let postsModel = posts?.map({ json -> Post? in
                    if let json = json["data"] as? jsonType {
                        return Post.init(JSON: json)!
                    }
                    return nil
                })
                {
                    self?.postList.append(contentsOf: postsModel)
                    
                    for (index, element) in (self?.postList.enumerated())! {
                        guard let url = element?.thumbnail else { continue }
                        if self?.postList[index]?.imageData == nil {
                            self?.fetchingService.getImage(url: url, completion: { (data, error) in
                                self?.postList[index]!.imageData = data
                                self?.didUpdateModelObjectAtIndex?(index)
                            })
                        }
                        
                    }
                }
            }
            self?.didUpdate?()
        }
    }

}
