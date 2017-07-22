//
//  LongTableViewControllerTests.swift
//  LongTableTests
//
//  Created by Steve Baker on 7/22/17.
//  Copyright © 2017 Beepscore LLC. All rights reserved.
//

import XCTest
@testable import LongTable

class LongTableViewControllerTests: XCTestCase {
    
    func testPopulateItems() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        let vc = storyboard.instantiateViewController(withIdentifier: "LongTableViewController") as! LongTableViewController
        vc.populateItems()

        XCTAssertEqual(vc.items.count, 10000)
    }
        
}
