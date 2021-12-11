//
//  ListViewControllerTest.swift
//  VestiaireCollectionTestTests
//
//  Created by Pallavi on 27/11/21.
//

import XCTest
@testable import VestiaireCollectionTest
class ListViewControllerTest: XCTestCase {
    
    func test_canInit() throws
    {
         _  = try makeSUT()
    }
    func  test_configuareTableView() throws {
        let sut = try makeSUT()
        
        sut.loadViewIfNeeded()
        
        XCTAssertNotNil(sut.table.delegate,"delegate")
        XCTAssertNotNil(sut.table.dataSource, "data source")
    }
    
    func test_initialState() throws {
        let sut = try makeSUT()
        
        sut.loadViewIfNeeded()
        
        XCTAssertEqual(sut.table.numberOfRows(inSection: 0),0)
    }
  
    func test_render() throws {
        let sut = try makeSUT()        
        sut.loadViewIfNeeded()
        
        XCTAssertEqual(sut.table.numberOfRows(inSection: 0),0)
    }
   
    private func makeSUT() throws -> ListViewController
    {
        let bundle = Bundle(for: ListViewController.self)
        let sb = UIStoryboard(name: "Main", bundle: bundle)
        let initalVC = sb.instantiateInitialViewController()
        let navigation = try XCTUnwrap(initalVC as? UINavigationController)
        let sut = try XCTUnwrap(navigation.topViewController as? ListViewController)
        return sut
    }
    
    func  tableCell(atRow row:Int) throws -> ListTableViewCell {
        let sut = try makeSUT()
        let ds = sut.table.dataSource
        
        let indexPath = IndexPath(row: row, section: 0)
        return ds?.tableView(sut.table, cellForRowAt: indexPath) as? ListTableViewCell ?? ListTableViewCell()
    }

    func day(atRow row:Int) throws -> String? {
       try tableCell(atRow: row).day.text
    }
    
}


