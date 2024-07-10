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
                .animation(.spring(response: 0.5, dampingFraction: 0.8, blendDuration: 0))
                .onAppear {
                    self.isAnimating = true
                }

            
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
            Button(action: {
                            // Implement share functionality here
                            shareImage()
                        }) {
                            Text("Share")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }
                        .padding()
        }
        .navigationBarTitle(AppConstants.imageDetailPageTitle, displayMode: .inline)
    }
    private func shareImage() {
        // Implement image sharing logic here
        // You can use UIActivityViewController or any other method as per app's requirements
    }
}
