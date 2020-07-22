//
//  DKButtonTests.swift
//  DKButtonTests
//
//  Created by Dheeraj Kumar on 22/07/20.
//  Copyright © 2020 Conduent. All rights reserved.
//

import XCTest
@testable import DKButton

class DKButtonTests: XCTestCase {

    var math: DKMath!

    override func setUp() {
        math = DKMath()
    }

    func testAdd() {
        XCTAssertEqual(math.add(a: 1, b: 1), 2)
    }
    
    func testSub() {
        XCTAssertEqual(math.sub(a: 2, b: 1), 1)
    }

}
