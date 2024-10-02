//
//  FlickrImageUITests.swift
//  FlickrImageUITests
//
//  Created by Dushyanth Challagundla on 7/10/24.
//

import XCTest

final class FlickrImageUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
        // Any initial setup required before each test
    }

    override func tearDownWithError() throws {
        // Teardown code after each test
    }

    func testSearchFieldExists() {
        let app = XCUIApplication()
        app.launch()

        let searchField = app.searchFields["Search by tags"]
        XCTAssertTrue(searchField.exists, "The search field should exist.")
    }

    func testSearchFunctionality() {
        let app = XCUIApplication()
        app.launch()

        let searchField = app.searchFields["Search by tags"]
        searchField.tap()
        searchField.typeText("Nature")
        app.keyboards.buttons["Search"].tap()

        // Validate that search results are populated, for simplicity checking a text element
        XCTAssertTrue(app.staticTexts["Nature"].exists, "The search result should display.")
    }

    func testImageDetailNavigation() {
        let app = XCUIApplication()
        app.launch()

        // Simulate tapping on the first image in the search results
        let firstImage = app.images.element(boundBy: 0)
        if firstImage.exists {
            firstImage.tap()
            XCTAssertTrue(app.navigationBars["Image Detail"].exists, "Should navigate to Image Detail view.")
        }
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
