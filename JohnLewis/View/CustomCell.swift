//
//  CustomCell.swift
//  JohnLewis
//
//  Created by hanif hussain on 12/02/2024.
//

import UIKit

class CustomCell: UICollectionViewCell {
    @IBOutlet var imageView: UIImageView!
    
    @IBOutlet var productDetails: UITextView!
    
    func setup() {
        productDetails.font = UIFont.preferredFont(forTextStyle: .body)
        productDetails.adjustsFontForContentSizeCategory = true
    }
}
