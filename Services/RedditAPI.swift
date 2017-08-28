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
    
    func getPostsAfter(_ postID: String, withCount count: Int, completion: @escaping ([jsonType]?, FetchingServiceError?) -> ()) {
        self.redditTopPostsStartingAt(postID, withCount: count, completion: completion)
    }
    
    func getImage(url: URL, completion: @escaping (Data?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            //propagate error
            completion(data, nil)
            }.resume()
    }
    
    private func redditTopPostsStartingAt(_ loc: String, withCount count:Int, completion: @escaping RedditDataCompletion) {
        
        var request = URLRequest(url: baseURL!)
        let postLocation = URLQueryItem(name: "after", value: loc)
        let postCount: URLQueryItem
        if loc == "" {
            postCount = URLQueryItem(name: "limit", value: String(count))
        } else {
            postCount = URLQueryItem(name: "count", value: String(count))
        }
        
        let urlComponents = NSURLComponents(url: baseURL!, resolvingAgainstBaseURL: true)!
        urlComponents.queryItems = [postLocation, postCount]
        request.url = urlComponents.url!
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            self.didFetchRedditUsers(data: data, response: response, error: error, completion: completion)
            }.resume()
    }
    
    private func didFetchRedditUsers(data: Data?, response: URLResponse?, error: Error?, completion: RedditDataCompletion) {
        if let _ = error {
            completion(nil, .FailedRequest)
            
        } else if let data = data, let response = response as? HTTPURLResponse {
            if response.statusCode == 200 {
                processRedditData(data: data, completion: completion)
            } else {
                completion(nil, .FailedRequest)
            }
        } else {
            completion(nil, .Unknown)
        }
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
