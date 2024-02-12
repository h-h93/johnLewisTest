//
//  FeaturesViewController.swift
//  JohnLewis
//
//  Created by hanif hussain on 12/02/2024.
//

import UIKit

class FeaturesViewController: UITableViewController {
    var product: Product!

    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        if cell == nil {
            cell = UITableViewCell(style: .value1, reuseIdentifier: "Cell")
        }
        // apply accessibility to text
        cell?.textLabel?.font = UIFont.preferredFont(forTextStyle: .body)
        cell?.textLabel?.adjustsFontForContentSizeCategory = true
        cell?.detailTextLabel?.font = UIFont.preferredFont(forTextStyle: .body)
        cell?.detailTextLabel?.adjustsFontForContentSizeCategory = true
        
        if product != nil {
            // we are pulling out the attribute or feature info from product struct to populate tableview
            // need to resolve this because the data from json/ dynamicAttributes doesn't return readable strings
            // convert dictionary in to array
            let key = Array(product.dynamicAttributes.keys)[indexPath.row]
            let value = product.dynamicAttributes[key]
            cell?.textLabel?.text = key
            cell?.detailTextLabel?.text = value
        } else {
            cell?.textLabel?.text = "Unable to load features, Please try again later or let us know"
        }

        return cell!
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if product != nil {
            return product.dynamicAttributes.count
        } else {
            return 1
        }
    }

}
