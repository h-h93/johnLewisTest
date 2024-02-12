//
//  JohnLewisUITests.swift
//  JohnLewisUITests
//
//  Created by hanif hussain on 12/02/2024.
//

import XCTest

final class JohnLewisUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        XCUIApplication().activate()
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = true

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    

    func testMainViewCollection() {
        let collectionViewsQuery = XCUIApplication().collectionViews
        collectionViewsQuery.children(matching: .cell).element(boundBy: 1).children(matching: .other).element.swipeDown()
    }
    
    // test basic main view controller
    func testMainViewSelection() {
        
        let app = XCUIApplication()
        app.collectionViews.children(matching: .cell).element(boundBy: 0).children(matching: .other).element.tap()
        app.navigationBars["Dishwashers (24)"].buttons["Dishwashers (24)"].tap()
        
        let collectionViewsQuery = XCUIApplication().collectionViews
        
        collectionViewsQuery.children(matching: .cell).element(boundBy: 1).children(matching: .other).element.swipeUp()
        collectionViewsQuery.children(matching: .cell).element(boundBy: 2).children(matching: .other).element.tap()
        app.navigationBars["Dishwashers (24)"].buttons["Dishwashers (24)"].tap()
                
        collectionViewsQuery.children(matching: .cell).element(boundBy: 0).children(matching: .other).element.swipeUp()
        collectionViewsQuery.children(matching: .cell).element(boundBy: 2).children(matching: .other).element.tap()
        app.navigationBars["Dishwashers (24)"].buttons["Dishwashers (24)"].tap()
        
                
    }
    
    // test basic ui responses and laoding for the product details view
    func testProductDetailView() {
        
        let app = XCUIApplication()
        let collectionViewsQuery = app.collectionViews
        collectionViewsQuery.children(matching: .cell).element(boundBy: 0).children(matching: .other).element.tap()
        app.textViews.textViews["This useful feature makes sure your detergent is completely dissolved for a more effective wash by releasing it into a special tray on top of the basket and mixing it into the cycle."].swipeUp()
        app.windows.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.tap()
        
        let dishwashers24Button = app.navigationBars["Dishwashers (24)"].buttons["Dishwashers (24)"]
        dishwashers24Button.tap()
        
        let textViewsQuery = collectionViewsQuery/*@START_MENU_TOKEN@*/.textViews/*[[".cells.textViews",".textViews"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        textViewsQuery.staticTexts["Bosch Serie 2 SMS24AW01G Freestanding Dishwasher, White"].swipeUp()
        collectionViewsQuery.children(matching: .cell).element(boundBy: 3).children(matching: .other).element.tap()
        dishwashers24Button.tap()
        textViewsQuery.staticTexts["Hoover HDI1LO38BS-80 Fully Integrated Dishwasher"].swipeUp()
        collectionViewsQuery.children(matching: .cell).element(boundBy: 2).children(matching: .other).element.tap()
        dishwashers24Button.tap()
        
    }
    
    // test basic ui responses and laoding for the featureView
    func testFeatureView() {
        let app = XCUIApplication()
        let collectionViewsQuery = app.collectionViews
        collectionViewsQuery.children(matching: .cell).element(boundBy: 0).children(matching: .other).element.tap()
        
        let moreinfolabelButton = app/*@START_MENU_TOKEN@*/.buttons["moreInfoLabel"]/*[[".buttons[\"moreInfo\"]",".buttons[\"moreInfoLabel\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        moreinfolabelButton.tap()
        
        let dishwashers24NavigationBar = app.navigationBars["Dishwashers (24)"]
        let backButton = dishwashers24NavigationBar.buttons["Back"]
        backButton.tap()
        
        let dishwashers24Button = dishwashers24NavigationBar.buttons["Dishwashers (24)"]
        dishwashers24Button.tap()
        collectionViewsQuery/*@START_MENU_TOKEN@*/.textViews.containing(.staticText, identifier:"Bosch Serie 2 SMS24AW01G Freestanding Dishwasher, White").element.swipeRight()/*[[".cells",".textViews.containing(.staticText, identifier:\"£329.00\").element",".swipeUp()",".swipeRight()",".textViews.containing(.staticText, identifier:\"Bosch Serie 2 SMS24AW01G Freestanding Dishwasher, White\").element"],[[[-1,4,2],[-1,1,2],[-1,0,1]],[[-1,4,2],[-1,1,2]],[[-1,3],[-1,2]]],[0,0]]@END_MENU_TOKEN@*/
        collectionViewsQuery.children(matching: .cell).element(boundBy: 2).children(matching: .other).element.tap()
        moreinfolabelButton.tap()
        backButton.tap()
        dishwashers24Button.tap()
        
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
