//
//  RedditAPI.swift
//  RedditTop50Viewer
//
//  Created by Daniel Springer on 8/28/17.
//  Copyright © 2017 Daniel Springer. All rights reserved.
//

import Foundation

final class RedditAPI: FetchingServiceType {
    private typealias RedditDataCompletion = ([jsonType]?, FetchingServiceError?) -> ()
    
    private let baseURL = URL(string: "https://www.reddit.com/top/.json?")
    
    func getPostsAfter(_ after: String, withCount count: Int, completion: @escaping ([jsonType]?, FetchingServiceError?) -> ()) {
    }
    
    func getImage(url: URL, completion: @escaping (Data?, Error?) -> ()) {
        
    }
    
    private func processRedditData(data: Data, completion: RedditDataCompletion) {
        if let JSON = try? JSONSerialization.jsonObject(with: data, options: []) as? jsonType {
            if let post = JSON?["data"] as? jsonType, let posts = post["children"] as? [jsonType] {
                completion(posts, nil)
            }
        } else {
            completion(nil, .InvalidResponse)
        }
    }
    

    
}
