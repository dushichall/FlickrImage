//
//  HTMLTextView.swift
//  FlickrImage
//
//  Created by Dushyanth Challagundla on 7/10/24.
//

import SwiftUI
import UIKit

struct HTMLTextView: View {
    let htmlString: String
    
    var body: some View {
        Text(parseHTML())
            .font(.subheadline)
            .padding(.horizontal)
            .multilineTextAlignment(.center)
            .navigationBarTitleDisplayMode(.inline)

    }
    
    private func parseHTML() -> String {
        do {
            let data = htmlString.data(using: .utf8)!
            let attributedString = try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil)
            return attributedString.string
        } catch {
            print("Error parsing HTML: \(error.localizedDescription)")
            return ""
        }
    }
}
