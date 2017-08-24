//
//  Post.swift
//  RedditTop50Viewer
//
//  Created by Daniel Springer on 8/24/17.
//  Copyright © 2017 Daniel Springer. All rights reserved.
//

import Foundation

struct Post {
    let title: String
    let author: String
    let datePosted: Date
    let thumbnail: URL?
    let numberOfComments: Double
    let imageURL: URL?
    var imageData: Data?
    let nameID: String
}
