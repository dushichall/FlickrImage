//
//  DateAdditions.swift
//  FlickrImage
//
//  Created by Dushyanth Challagundla on 7/10/24.
//

import Foundation


extension String {
    var formattedPublishedDate:String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        if let date = formatter.date(from: self) {
            formatter.dateStyle = .medium
            formatter.timeStyle = .short
            return formatter.string(from: date)
        }
        return ""
    }
}
