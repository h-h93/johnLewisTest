//
//  ProductViewController.swift
//  JohnLewis
//
//  Created by hanif hussain on 12/02/2024.
//

import UIKit

class ProductViewController: UIViewController {

    @IBOutlet var descriptionTextView: UITextView!
    @IBOutlet var featuresLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    
    var productDescription = String()
    var price = String()
    var image = UIImage()
    var product: Product!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = image
        descriptionTextView.text = productDescription
        priceLabel.text = price
        
        descriptionTextView.font = UIFont.preferredFont(forTextStyle: .body)
        descriptionTextView.adjustsFontForContentSizeCategory = true
        
        priceLabel.font = UIFont.preferredFont(forTextStyle: .body)
        priceLabel.adjustsFontForContentSizeCategory = true
        
        featuresLabel.font = UIFont.preferredFont(forTextStyle: .body)
        featuresLabel.adjustsFontForContentSizeCategory = true
        
        featuresLabel.textColor = .blue
        
        // implement tap for label to navigate us to features view controller
        setupFeaturesLabel()
    }
    
    func setupFeaturesLabel() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(featureTapped))
        featuresLabel.addGestureRecognizer(gesture)
    }
    
    @objc func featureTapped() {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "FeaturesView") as? FeaturesViewController {
            vc.product = product
            navigationController?.pushViewController(vc, animated: true)
        }
    }

}
