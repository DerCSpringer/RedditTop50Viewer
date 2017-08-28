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
    
    func setupGestureForThumbnail() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTouch(gesture:)))
        self.thumbnail.addGestureRecognizer(tapGesture)
    }
    
    func didTouch(gesture: UIGestureRecognizer) {
        self.didTouchThumbnail!()
    }
}
