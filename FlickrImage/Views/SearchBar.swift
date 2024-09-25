//
//  SearchBar.swift
//  FlickrImage
//
//  Created by Dushyanth Challagundla on 7/10/24.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    
    var body: some View {
        HStack {
            TextField("Search by name...", text: $text)
                .padding(6)
                .cornerRadius(AppConstants.viewCornerRadius)
                .padding(.leading,AppConstants.viewCornerRadius)
            if !text.isEmpty {
                Button(action: {
                    self.text = ""
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.gray)
                        .padding(.trailing, AppConstants.viewCornerRadius)
                }
            }
        }
        .padding(4)
        .background(Color(.systemGray6))
        .cornerRadius(AppConstants.viewCornerRadius)
        .padding(.horizontal)
    }
}
