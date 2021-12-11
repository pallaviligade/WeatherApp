//
//  ListViewModelSpec.swift
//  VestiaireCollectionTestTests
//
//  Created by Pallavi on 28/11/21.
//

import XCTest
@testable import VestiaireCollectionTest

class ListViewModelSpec: XCTestCase {

    var viewModel: ListViewModel!
    var mockService:MockWeatherService!
    
    override  func setUp() {
        mockService = MockWeatherService()
        viewModel = .init(apiManager: mockService) // Inject mock service and controller the beharious
    }
    
    func test_apiCallWeatherIsSucessIsTrue(){
        let title =  viewModel.headertitle
        XCTAssertTrue((viewModel.weatherMapModel != nil))
        XCTAssertEqual("Rain", title)
        
    }

}
