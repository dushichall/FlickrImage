//
//  ImageViewDetail.swift
//  FlickrImage
//
//  Created by Dushyanth Challagundla on 7/10/24.
//

import SwiftUI

struct ImageViewDetail: View {
    let flickrItem: FlickrItem
    @State private var isAnimating = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            ImageView(url: (flickrItem.media?.m) ?? "")
                .frame(maxWidth: .infinity)
                .padding(16)
                .scaleEffect(isAnimating ? 1.0 : 0.5)
                .onAppear {
                    withAnimation(.spring(response: 0.5, dampingFraction: 0.8, blendDuration: 0)){
                        self.isAnimating = true
                    }
                }
            //                .accessibilityLabel(Text(flickrItem.title ?? "Image"))
            //                .accessibilityHint(Text("Double tap to view full image"))
            
            Text(flickrItem.title ?? "")
                .font(.headline)
                .padding(.horizontal)
            
            if let description = flickrItem.description {
                HTMLTextView(htmlString: description)
                
            }
            
            Text("\(AppConstants.author) \(flickrItem.author ?? "")")
                .font(.subheadline)
                .padding(.horizontal)
            
            Text("\(AppConstants.publishedDate) \(flickrItem.published?.formattedPublishedDate ?? "")")
                .font(.subheadline)
                .padding(.horizontal)
            
            Spacer()
        }
        .navigationBarTitle(AppConstants.imageDetailPageTitle, displayMode: .inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    shareImage()
                }) {
                    Image(systemName: "square.and.arrow.up") // Share icon
                }
            }
        }
    }
    private func shareImage() {
            let items = [
                flickrItem.title,
                flickrItem.description,
                "Image URL: \(flickrItem.media?.m ?? "")",
                "Author: \(flickrItem.author ?? "")",
                "Published Date: \(flickrItem.published?.formattedPublishedDate ?? "")"
            ]
            
            let activityVC = UIActivityViewController(activityItems: items.compactMap { $0 }, applicationActivities: nil)
            
            // Get the current window scene
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                windowScene.windows.first?.rootViewController?.present(activityVC, animated: true, completion: nil)
            }
        }
}
