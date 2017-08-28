//
//  PostCell.swift
//  RedditTop50Viewer
//
//  Created by Daniel Springer on 8/28/17.
//  Copyright © 2017 Daniel Springer. All rights reserved.
//

import UIKit
class PostsCell: UITableViewCell {
    @IBOutlet weak var postTitle: UILabel!
    @IBOutlet weak var numOfComments: UILabel!
    @IBOutlet weak var author: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var thumbnail: UIImageView!
    var didTouchThumbnail: (() -> Void)?
    
    func configureWith(post:Post?) {
        if let post = post {
            self.author.text = "by \(post.author)"
            self.numOfComments.text = "\(String(post.numberOfComments)) comments"
            self.date.text = "posted \(post.datePosted.timeFromNow())"
            self.postTitle.text = post.title
            if post.thumbnail != nil {
                if let image = post.imageData {
                    thumbnail.image = UIImage(data: image)
                    self.thumbnail.isUserInteractionEnabled = true
                    setupGestureForThumbnail()
                }
            } else {
                self.thumbnail.isUserInteractionEnabled = false
                thumbnail.image = UIImage(named: "default-thumbnail.jpg")
                //maybe do something here
                //reuse might be causing issues
                // I need to check that cells are being resued properly
            }
        }
    }
    
    func setupGestureForThumbnail() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTouch(gesture:)))
        self.thumbnail.addGestureRecognizer(tapGesture)
    }
    
    func didTouch(gesture: UIGestureRecognizer) {
        self.didTouchThumbnail!()
    }
}
