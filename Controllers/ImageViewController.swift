//
//  ImageViewController.swift
//  RedditTop50Viewer
//
//  Created by Daniel Springer on 8/28/17.
//  Copyright © 2017 Daniel Springer. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController, BindableType {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageViewTrailingConstraint: NSLayoutConstraint!
    @IBOutlet weak var imageViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var imageViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var imageViewLeadingConstraint: NSLayoutConstraint!
    
    @IBAction func goBack(_ sender: UIBarButtonItem) {
        viewModel.didTouchBackButton()
    }
    var viewModel: ImageViewModel!
    func bindViewModel() {
        
        viewModel.fetchImage()
        viewModel.didFetchImage = {
            DispatchQueue.main.async {
                guard let data = self.viewModel.imageData, let image = UIImage(data: data) else {
                    self.imageView.image = UIImage(named: "default-thumbnail.jpg")
                    return
                }
                self.imageView.image = image
            }
        }
        
    }
}
