//
//  CurrencyFormatterTests.swift
//  BankeyUnitTests
//
//  Created by Ana Carolina Barbosa de Souza on 10/05/24.
//

import Foundation
import XCTest

@testable import Bankey

class Test: XCTestCase {
    var formatter: CurrencyFormatter!
//    var vc: UIViewController!

    override func setUp() {
        super.setUp()
        formatter = CurrencyFormatter()
//        vc = ViewController()
//        vc.loadViewIfNeeded()
    }
    
//    func testShouldBeVisible() throws {
//        let isViewLoaded = vc.isViewLoaded
//        XCTAssertTrue(isViewLoaded)
    func testBreakDollarsIntoCents() throws {
        let result = formatter.breakIntoDollarsAndCents(929466.23)
        XCTAssertEqual(result.0, "929466")
//        XCTAssertEqual(result.1, "23")
    }
    
    // Challenge: You write
    func testDollarsFormatted() throws {
        let result = formatter.dollarsFormatted(929466.23)
        XCTAssertEqual(result, "$929,466.23")
    }

    // Challenge: You write
    func testZeroDollarsFormatted() throws {
        let result = formatter.dollarsFormatted(0.00)
        XCTAssertEqual(result, "$0.00")
    }
    func testDollarsFormattedWidthCurrencySymbol() throws {
        let locale = Locale.current
        let currencySymbol = locale.currencySymbol!
        
        let result = formatter.dollarsFormatted(929466.23)
        XCTAssertEqual(result, "\(currencySymbol)929,466.23")
    }
}
