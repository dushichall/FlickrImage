//
//  FlickrService.swift
//  FlickrImage
//
//  Created by Dushyanth Challagundla on 7/10/24.
//

import Foundation
import Combine

class FlickrService {
    private let baseURL = "https://api.flickr.com/services/feeds/photos_public.gne?format=json&nojsoncallback=1&tags="
    
    func fetchImages(for tags: String) -> AnyPublisher<FlickrModel, Error> {
        let urlString = baseURL + tags.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        let url = URL(string: urlString)!
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .receive(on: DispatchQueue.main)
            .decode(type: FlickrModel.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}

