//
//  ListViewModel.swift
//  VestiaireCollectionTest
//
//  Created by Pallavi on 24/11/21.
//

import UIKit

class ListViewModel: NSObject {
    var headertitle:String?
    var bindViewModelToViewController : (() -> () ) = {}
    private(set) var weatherMapModel:WeatherMapModel? {
        didSet {
            self.bindViewModelToViewController()
        }
    }
    private var apiManager:WeatherConditionManagerProtocol
    
     init(apiManager:WeatherConditionManagerProtocol = WeatherConditionManager()) {
        self.apiManager = apiManager
        super.init()
        makeApiCall()
    }

    func makeApiCall()  {

        apiManager.createRequestForWeatherapi { [weak self] result in
            switch result
            {
                case .success(let model):
                    let list:List = model.list![0]
                    self?.headertitle = list.weather![0].main
                    self?.weatherMapModel = model
                    break
                case .failure(let error):
                    print(error)
                    break
            }
        }
    }
}
