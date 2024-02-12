//
//  ViewController.swift
//  JohnLewis
//
//  Created by hanif hussain on 12/02/2024.
//

import UIKit
import Combine // we're going to use combine as it it really simplifies and structures our code
import SwiftyJSON

class ViewController: UICollectionViewController {
    // hold our dishwasher data in a struct
    var dishwashers = [Product]()
    // cache our images to improve efficiency (possibly utilise core data/ swift data down the line to store images and data, and verify if there have been any changes before dl images again
    var imageCache = NSCache<AnyObject, AnyObject>()
    // hold dishwasher description data
    var productInfo = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // instantiate our network calls to grab info
        let networkCall = NetworkCalls()
        networkCall.getDishwashers { product in
            // grab a list of dishwashers and populate collection/ reload
            self.dishwashers = product
            self.collectionView.reloadData()
            self.setTitle() // set the page title
            // grab product descriptions
            networkCall.getDishwasherDesc {
                self.productInfo = networkCall.productInfo
            }
            DispatchQueue.global(qos: .background).async {
                // grab product images on background thread
                networkCall.downloadDishwasherImages {
                    self.imageCache = networkCall.imageCache
                    DispatchQueue.main.async {
                        self.collectionView.reloadData()
                    }
                }
            }
        }
    }
    
    // set the title as number of dishwashers available
    func setTitle() {
        title = "Dishwashers (\(dishwashers.count))"
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? CustomCell else {
            // we failed to get a CustomCell!
            fatalError("Unable to dequeue PersonCell.")
        }
        // apply accessibility features
        cell.setup()
        
        if !dishwashers.isEmpty {
            // O(1) as we have indexpath.item to grab details from our array to populate collection view
            let dishWasher = dishwashers[indexPath.item]
            cell.productDetails.text = ("\(dishWasher.title)\n£\(dishWasher.price.now)")
            // grab image from cache
            if let imageFromCache = imageCache.object(forKey: dishWasher.productID as AnyObject) as? UIImage {
                cell.imageView.image = imageFromCache
            }
        }
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if !dishwashers.isEmpty {
            return dishwashers.count
        } else {
            return 0
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let dishWasher = dishwashers[indexPath.item]
        // instantiate and pass data to next view controller and present
        if let vc = storyboard?.instantiateViewController(withIdentifier: "ProductView") as? ProductViewController {
            vc.product = dishWasher
            if let imageFromCache = imageCache.object(forKey: dishWasher.productID as AnyObject) as? UIImage {
                vc.image = imageFromCache
            }
            let price = ("£\(dishWasher.price.now)")
            vc.productDescription = getProductInfo(index: indexPath.item)
            vc.price = price
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func getProductInfo(index: Int) -> String {
        let dishWasher = dishwashers[index]
        // the second JSON url is missing a lot of product descriptions so have to test and return blank string
        if index >= productInfo.count {
            return ""
        } else {
            var text = ("\(dishWasher.promoMessages.offer) \(productInfo[index])")
            // the following takes order of O(N) but needed as json response for description not formed correctly, should move into function that handles regex and return formatted string
            let modifiedText = text.stripHTML
            return modifiedText
        }
    }
    
}

// remove HTML tags from string
extension String {
    var stripHTML: String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression)
    }
}
