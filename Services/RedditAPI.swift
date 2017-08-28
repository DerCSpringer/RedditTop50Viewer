//
//  RedditAPI.swift
//  RedditTop50Viewer
//
//  Created by Daniel Springer on 8/28/17.
//  Copyright © 2017 Daniel Springer. All rights reserved.
//

import Foundation

final class RedditAPI: FetchingServiceType {
    typealias RedditDataCompletion = ([jsonType]?, FetchingServiceError?) -> ()
    
    private let baseURL = URL(string: "https://www.reddit.com/top/.json?")
    
    func getPostsAfter(_ after: String, withCount count: Int, completion: @escaping ([jsonType]?, FetchingServiceError?) -> ()) {
    }
    
    func getImage(url: URL, completion: @escaping (Data?, Error?) -> ()) {
        
    }
    
}
