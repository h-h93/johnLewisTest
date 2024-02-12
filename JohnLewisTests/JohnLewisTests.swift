//
//  JohnLewisTests.swift
//  JohnLewisTests
//
//  Created by hanif hussain on 12/02/2024.
//

import XCTest
@testable import JohnLewis

final class JohnLewisTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testJSONMapping() throws {
        let networkCall = NetworkCalls()
        let defaultImage = UIImage(named: "Default_pfp.svg")
        networkCall.getDishwashers { product in
            XCTAssertEqual(product.first?.title, "Bosch Serie 2 SMV40C30GB Fully Integrated Dishwasher", "product title does not match")
            XCTAssertEqual(product.first?.productID, "1955287", "product id not matching, check netowrking calls, or JSON parsing")
            
            networkCall.downloadDishwasherImages {
                let image = networkCall.imageCache.object(forKey: product.first?.productID as AnyObject) as? UIImage
                if image == defaultImage {
                    XCTFail("Image is stock image")
                } else if image != defaultImage {
                    XCTAssert((image != nil), "image not downloaded")
                }
            }
        }
        
        networkCall.getDishwasherDesc {
            // test failed have to counter this code
            XCTAssertTrue(networkCall.productInfo.count == networkCall.dishwashers.count, "Arrays have different lengths: \(networkCall.productInfo.count) vs. \(networkCall.dishwashers.count)")
        }
    }
    
    
    func testPerformanceExample() throws {
        let networkCall = NetworkCalls()
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
            _ = ViewController()
            // measure our network calls
            networkCall.getDishwashers { _ in
            }
            networkCall.getDishwasherDesc {
            }
            networkCall.downloadDishwasherImages {
            }
            

        }
    }
    
}
