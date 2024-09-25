//
//  ContentView.swift
//  FlickrImage
//
//  Created by Dushyanth Challagundla on 7/10/24.
//

import SwiftUI

struct FlickrSearchView: View {
    @StateObject private var viewModel = FlickrViewModel()
    @State private var selectedItem: FlickrItem? = nil

    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                SearchBar(text: $viewModel.searchText)
                    .padding(10)
                    .fixedSize(horizontal: false, vertical: true)  // Ensure fixed vertical size

                switch viewModel.apiState {
                    case .idle:
                    Text(AppConstants.idleMessage)
                            .foregroundColor(.gray)
                            .font(.headline)
                            .padding()
                    case .loading:
                        ProgressView()
                            .scaleEffect(2)
                            .padding(.top, 20) 

                    case .success:
                        ScrollView {
                            LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]) {
                                ForEach(viewModel.items) { item in
                                    NavigationLink(
                                        destination: ImageViewDetail(flickrItem: item),
                                        tag: item,
                                        selection: $selectedItem
                                    ) {
                                        ImageView(url: item.media?.m ?? "")
                                            .frame(width: 100, height: 100)
                                            .onTapGesture {
                                                self.selectedItem = item
                                            }
                                    }
                                }
                            }
                        }
                    case .empty:
                    Text(AppConstants.noResultsFound)
                            .foregroundColor(.gray)
                            .font(.headline)
                            .padding()
                    case .error(let message):
                    Text("\(AppConstants.error) \(message)")
                            .foregroundColor(.red)
                            .font(.headline)
                            .padding()
                }
                Spacer()
            }
            .navigationBarTitle(AppConstants.flickrSearchPageTitle, displayMode: .inline)
            
        }
    }
}

#Preview {
    FlickrSearchView()
}
