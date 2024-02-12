//
//  networkCalls.swift
//  JohnLewis
//
//  Created by hanif hussain on 11/02/2024.
//

import Foundation
import Combine
import SwiftyJSON
import UIKit

enum JsonError: Error {
    case failedRequest
}

class NetworkCalls {
    // specify our url's
    let johnLewisMainURL = "https://gitlab.com/jlp-jobs/jlp-ios-engineer-test/-/raw/main/mockData/data.json?ref_type=heads"
    let johnLewisDescURL = "https://gitlab.com/jlp-jobs/jlp-ios-engineer-test/-/raw/main/mockData/data2.json?ref_type=heads"
    // hold our dishwasher data in a struct
    var dishwashers = [Product]()
    // cache our images to improve efficiency (possibly utilise core data/ swift data down the line to store images and data, and verify if there have been any changes before dl images again
    let imageCache = NSCache<AnyObject, AnyObject>()
    // hold dishwasher description data
    var productInfo = [String]()
    // using combine any cancellable to run our json parsing
    var products = Set<AnyCancellable>()
    
    init() {
        
    }
    
    // using combine here
    func getDishwashers(completion: @escaping ([Product]) -> (Void)) {
        let decoder = JSONDecoder()
        let url = URL(string: johnLewisMainURL)!
        URLSession.shared.dataTaskPublisher(for: url)
        // let's try map the data as Dishwasher struct ( we will escape on failure as something may be wrong with Json
            .tryMap { data, response -> Dishwashers in
                guard
                    let response = response as? HTTPURLResponse,
                    (200..<300).contains(response.statusCode)
                else {
                    throw JsonError.failedRequest
                }
                // Configure JSON Decoder
                decoder.dateDecodingStrategy = .secondsSince1970
                return try decoder.decode(Dishwashers.self, from: data)
            }
            .retry(1) // we will retry in case of failure once more (it's expensive so once will suffice)
        // we will recieve on the main queue as we need to update ui
            .receive(on: DispatchQueue.main)
        // we will now map the error
            .mapError { error -> JsonError in
                error as? JsonError ?? .failedRequest
            }
        // we will now sink the data i.e get back and do what we need to in receive value
            .sink { completion in
                switch completion {
                case.finished:
                    ()
                    // handle our errors
                case .failure(let error):
                    switch error {
                    case .failedRequest:
                        ()
                    }
                    // notify user
                }
                
            } receiveValue: { dishwasher in
                self.dishwashers = dishwasher.products
                // escaping closure to capture dishwashers
                completion(self.dishwashers)
            }
            .store(in: &products)
        
    }
    
    // grab images but let's also cache them as we don't want to keep downloading them
    // To do: convert to combine to make it easy to maintain and read currenntly just caching and dl everytime something to do for next stage
    func downloadDishwasherImages(completion: @escaping () -> (Void)) {
        for dishwasher in dishwashers {
            // json that was provided had missing https: instead started with // for image urls
            let url = URL(string: "https:\(dishwasher.image)")!
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    // handle error here assign a image unavailable sign
                    print("error getting images \(error.localizedDescription)")
                    let imageToCache = UIImage(named: "Default_pfp.svg")
                    self.imageCache.setObject(imageToCache!, forKey: dishwasher.productID as AnyObject)
                } else if let data = data {
                    let imageToCache = UIImage(data: data)
                    self.imageCache.setObject(imageToCache!, forKey: dishwasher.productID as AnyObject)
                    // return from here
                    completion()
                }
                
            }.resume()
        }
    }
    
    // get dishwasher description from the second JSON
    func getDishwasherDesc(completion: @escaping () -> (Void)) {
        let url = URL(string: johnLewisDescURL)!
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                // to do: handle errors
                print("error getting description \(error.localizedDescription)")
            } else if let data = data {
                do {
                    let json = try JSON(data: data)
                    let description = json["detailsData"].arrayValue.map {$0["details"].dictionary}
                    for i in description {
                        self.productInfo.append((i!["productInformation"]?.string)!)
                    }
                    completion()
                } catch {
                    
                }
            }
        }.resume()
        
    }
}
