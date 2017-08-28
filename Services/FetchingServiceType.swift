//
//  FetchingServiceType.swift
//  RedditTop50Viewer
//
//  Created by Daniel Springer on 8/28/17.
//  Copyright © 2017 Daniel Springer. All rights reserved.
//

import Foundation

typealias jsonType = [String: Any]

enum FetchingServiceError: Error {
    case Unknown
    case FailedRequest
    case InvalidResponse
}

protocol FetchingServiceType {
    func getPostsAfter(_ postID: String, withCount:Int, completion: @escaping ([jsonType]?, FetchingServiceError?) ->())
    func getImage(url:URL, completion: @escaping(Data?, Error?) ->())
}
