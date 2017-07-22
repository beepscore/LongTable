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
    
    func testPopulatedItems() {
        let items = LongTableViewController.populatedItems()
        XCTAssertEqual(items.count, 10000)
    }

    // MARK: - testNumberOfRowsInSection

    func testNumberOfRowsInSection0() {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)

        let vc = storyboard.instantiateViewController(withIdentifier: "LongTableViewController") as! LongTableViewController

        // calling vc.view triggers a call to loadView, which then triggers call to viewDidLoad
        // Reference iOS: the one weird trick for testing view controllers in swift, by Natasha the Robot
        let _ = vc.view

        XCTAssertEqual(vc.tableView(vc.tableView, numberOfRowsInSection: 0), 200)
    }

    func testNumberOfRowsInSection1() {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let vc = storyboard.instantiateViewController(withIdentifier: "LongTableViewController") as! LongTableViewController

        // simply calling vc.tableView triggers a call to viewDidLoad
        XCTAssertEqual(vc.tableView(vc.tableView, numberOfRowsInSection: 1), 200)
    }

    func testNumberOfRowsInSectionLast() {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let vc = storyboard.instantiateViewController(withIdentifier: "LongTableViewController") as! LongTableViewController

        // simply calling vc.tableView triggers a call to viewDidLoad
        XCTAssertEqual(vc.tableView(vc.tableView, numberOfRowsInSection: vc.numSections - 1), 200)
    }

    // MARK: - testItemIndex

    func testItemIndexItem0Section0() {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let vc = storyboard.instantiateViewController(withIdentifier: "LongTableViewController") as! LongTableViewController

        // use IndexPath(item: section:) instead of IndexPath(row: section:)
        // parameter name "item" is more general than "row", appropriate for table view or collection view
        let indexPath = IndexPath(item: 0, section: 0)
        XCTAssertEqual(vc.itemIndex(indexPath: indexPath), 0)
    }

    func testItemIndexItem3Section0() {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let vc = storyboard.instantiateViewController(withIdentifier: "LongTableViewController") as! LongTableViewController

        let indexPath = IndexPath(item: 3, section: 0)
        XCTAssertEqual(vc.itemIndex(indexPath: indexPath), 3)
    }

    func testItemIndexItem3Section1() {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)

        let vc = storyboard.instantiateViewController(withIdentifier: "LongTableViewController") as! LongTableViewController
        vc.viewDidLoad()

        let indexPath = IndexPath(item: 3, section: 1)
        XCTAssertEqual(vc.itemIndex(indexPath: indexPath), 203)
    }

    func testItemIndexItem12Section5() {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)

        let vc = storyboard.instantiateViewController(withIdentifier: "LongTableViewController") as! LongTableViewController

        let indexPath = IndexPath(item: 12, section: 5)
        XCTAssertEqual(vc.itemIndex(indexPath: indexPath), 1012)
    }

    func testItemIndexItemLastSectionLast() {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)

        let vc = storyboard.instantiateViewController(withIdentifier: "LongTableViewController") as! LongTableViewController

        let indexPath = IndexPath(item: 199, section: vc.numSections - 1)
        XCTAssertEqual(vc.itemIndex(indexPath: indexPath), 9999)
    }

}
