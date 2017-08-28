//
//  Date+Extensions.swift
//  RedditTop50Viewer
//
//  Created by Daniel Springer on 8/28/17.
//  Copyright © 2017 Daniel Springer. All rights reserved.
//

import Foundation

extension Date {
    
    public func timeFromNow() -> String {
        var timeFromNowInWords : String = ""
        
        let calendar = Calendar.current
        let currentTime = Date()
        let components = calendar.dateComponents([.second, .minute, .hour, .day, .month, .year], from: self, to: currentTime)
        
        if components.year! > 1 {
            timeFromNowInWords = "\(components.year!) years ago"
        } else if components.year! == 1 {
            timeFromNowInWords = "one year ago"
        } else if components.month! > 1 {
            timeFromNowInWords = "\(components.month!) months ago"
        } else if components.month! == 1 {
            timeFromNowInWords = "one month ago"
        } else if components.day! > 1 {
            timeFromNowInWords = "\(components.day!) days ago"
        } else if components.day! == 1 {
            timeFromNowInWords = "one day ago"
        } else if components.hour! > 1 {
            timeFromNowInWords = "\(components.hour!) hours ago"
        } else if components.hour! == 1 {
            timeFromNowInWords = "one hour ago"
        } else if components.minute! > 1 {
            timeFromNowInWords = "\(components.minute!) minutes ago"
        } else if  components.second! > 5 {
            timeFromNowInWords = "\(components.second!) seconds ago"
        } else {
            timeFromNowInWords = "Just posted"
        }
        
        return timeFromNowInWords
    }
    
}
