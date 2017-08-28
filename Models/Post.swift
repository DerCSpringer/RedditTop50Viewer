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
    let numberOfComments: Int
    let imageURL: URL?
    var imageData: Data?
    let nameID: String
}

extension Post {
    
    init?(JSON: Any) {
        guard let JSON = JSON as? [String: AnyObject] else { return nil }
        
        guard let title = JSON["title"] as? String else { return nil }
        guard let author = JSON["author"] as? String else { return nil }
        guard let datePosted = JSON["created"] as? Double else { return nil }
        guard let thumbnail = JSON["thumbnail"] as? String else { return nil }
        guard let numberOfComments = JSON["num_comments"] as? Int else { return nil }
        guard let imageURL = JSON["url"] as? String else { return nil }
        guard let nameID = JSON["name"] as? String else { return nil }
        
        self.title = title
        self.author = author
        self.datePosted = Date(timeIntervalSince1970: datePosted)
        self.thumbnail = URL(string: thumbnail)
        self.numberOfComments = numberOfComments
        self.imageURL = URL(string: imageURL)
        self.nameID = nameID
        self.imageData = nil
    }
    
}
