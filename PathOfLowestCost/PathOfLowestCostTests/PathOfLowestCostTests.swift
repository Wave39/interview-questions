//
//  PathOfLowestCostTests.swift
//  PathOfLowestCostTests
//
//  Created by Brian Prescott on 7/15/16.
//  Copyright © 2016 Wave 39 LLC. All rights reserved.
//

import XCTest
@testable import PathOfLowestCost

class PathOfLowestCostTests: XCTestCase {
    
    var s1, s2, s3: String?
    
    override func setUp() {
        super.setUp()
        
        s1 = "3 4 1 2 8 6|6 1 8 2 7 4|5 9 3 9 9 5|8 4 1 3 2 6|3 7 2 8 6 4"
        s2 = "3 4 1 2 8 6|6 1 8 2 7 4|5 9 3 9 9 5|8 4 1 3 2 6|3 7 2 1 2 3"
        s3 = "19 10 19 10 19|21 23 20 19 12|20 12 20 11 10"
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testGridInit() {
        let g1 = Grid(withString: s1!)
        XCTAssert(g1.cellArray[0][0] == 3)
        XCTAssert(g1.cellArray[2][1] == 9)
        XCTAssert(g1.cellArray[4][3] == 8)

        let g2 = Grid(withString: s2!)
        XCTAssert(g2.cellArray[0][0] == 3)
        XCTAssert(g2.cellArray[2][1] == 9)
        XCTAssert(g2.cellArray[4][3] == 1)

        let g3 = Grid(withString: s3!)
        XCTAssert(g3.cellArray[0][0] == 19)
        XCTAssert(g3.cellArray[1][1] == 23)
        XCTAssert(g3.cellArray[2][3] == 11)
    }
    
    func testWalkGrid() {
        let g1 = Grid(withString: s1!)
        let (message1, cost1, sequence1) = g1.walkGrid()
        XCTAssert(message1 == "Yes")
        XCTAssert(cost1 == 16)
        XCTAssert(sequence1 == "1 2 3 4 4 5")
        
        let g2 = Grid(withString: s2!)
        let (message2, cost2, sequence2) = g2.walkGrid()
        XCTAssert(message2 == "Yes")
        XCTAssert(cost2 == 11)
        XCTAssert(sequence2 == "1 2 1 5 4 5")
        
        let g3 = Grid(withString: s3!)
        let (message3, cost3, sequence3) = g3.walkGrid()
        XCTAssert(message3 == "No")
        XCTAssert(cost3 == 48)
        XCTAssert(sequence3 == "1 2 3 4 4 5")
    }
    
}
