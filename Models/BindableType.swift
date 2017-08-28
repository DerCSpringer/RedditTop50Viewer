//
//  BindableType.swift
//  RedditTop50Viewer
//
//  Created by Daniel Springer on 8/28/17.
//  Copyright © 2017 Daniel Springer. All rights reserved.
//

import UIKit

protocol BindableType { //All view models must abide by this protocol.  It allows for a binding between VC-VM
    associatedtype ViewModelType
    
    var viewModel: ViewModelType! { get set }
    
    func bindViewModel()
}

extension BindableType where Self: UIViewController {
    mutating func bindViewModel(to model: Self.ViewModelType) { //This function in the VCs to VMs
        //We don't use ViewDidLoad, becuase our viewmodel must be assigned before viewDidLoad
        viewModel = model
        loadViewIfNeeded()
        bindViewModel()
    }
}
