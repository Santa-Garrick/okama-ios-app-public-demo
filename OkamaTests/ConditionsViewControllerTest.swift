//
//  ConditionsViewControllerTest.swift
//  OkamaTests
//
//  Created by Pro13 on 22.09.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import XCTest

@testable import Okama

class ConditionsViewControllerTest: XCTestCase {
	
	var sut: ConditionsViewController!
	
	override func setUp() {
		super.setUp()
		sut = ConditionsViewController()
	}
	
	override func tearDown() {
		super.tearDown()
		sut = nil
	}
	
	func testExample() throws {
		// This is an example of a functional test case.
		// Use XCTAssert and related functions to verify your tests produce the correct results.
	}
	
	func testPerformanceExample() throws {
		// This is an example of a performance test case.
		self.measure {
			// Put the code you want to measure the time of here.
		}
	}
	
}
