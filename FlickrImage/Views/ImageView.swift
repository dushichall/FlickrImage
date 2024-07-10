//
//  ImageView.swift
//  FlickrImage
//
//  Created by Dushyanth Challagundla on 7/10/24.
//

import SwiftUI

struct ImageView: View {
    let url: String
    
    var body: some View {
        AsyncImage(url: URL(string: url)) { phase in
            switch phase {
            case .empty:
                ProgressView()
            case .success(let image):
                image.resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipped()
                    .cornerRadius(AppConstants.viewCornerRadius)
            case .failure:
                Image(systemName: "photo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.gray)
                    .cornerRadius(AppConstants.viewCornerRadius)
            @unknown default:
                EmptyView()
            }
        }
    }
}
