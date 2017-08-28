//
//  PostsViewController.swift
//  RedditTop50Viewer
//
//  Created by Daniel Springer on 8/24/17.
//  Copyright © 2017 Daniel Springer. All rights reserved.
//

import Foundation
import UIKit

class PostsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, BindableType {
    var viewModel: PostsViewModel!
    
    @IBOutlet weak var tableView: UITableView!
    
    func bindViewModel() {
        self.viewModel.didUpdate = {
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        self.viewModel.didUpdateModelObjectAtIndex = { (index) -> Void in
            let indexPath = IndexPath.init(row: index, section: 0)
            DispatchQueue.main.async {
                self.tableView.reloadRows(at: [indexPath], with: .automatic)
            }
        }
        
    }
    
    override func viewDidLoad() {
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 140
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if (indexPath.row == viewModel.postList.count - 5) {
            viewModel.fetchMorePosts()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.postList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostsCell") as! PostsCell
        cell.configureWith(entry: self.viewModel.postList[indexPath.row])
        return cell
    }
}
