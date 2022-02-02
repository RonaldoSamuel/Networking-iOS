//
//  NetworkingRxSwiftTests.swift
//  NetworkingRxSwiftTests
//
//  Created by Ronaldo Filho on 02/12/21.
//

import XCTest
@testable import NetworkingRxSwift
 
class NetworkingRxSwiftTests: XCTestCase {
    var listModel: ListModelElement?
    
    func testIfdataIsfillingUpCorrectilly() {
        listModel = ListModelElement(name: "Test", categoryId: "Test")
        XCTAssertTrue(listModel?.name != nil && listModel?.categoryId != nil)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
