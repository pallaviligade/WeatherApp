//
//  WeatherConditionManager.swift
//  VestiaireCollectionTest
//
//  Created by Pallavi on 24/11/21.
//

import UIKit

protocol WeatherConditionManagerProtocol {
    func createRequestForWeatherapi(handler:@escaping(Result<WeatherMapModel,Error>) -> Void)
}

class WeatherConditionManager: WeatherConditionManagerProtocol {
    let session = URLSession(configuration: .default)
    func buildURL() -> String {
        return "https://api.openweathermap.org/data/2.5/forecast/daily?q=Paris&mode=json&units=metric&cnt=16&APPID=648a3aac37935e5b45e09727df728ac2"
    }
    
    func createRequestForWeatherapi(handler:@escaping(Result<WeatherMapModel,Error>) -> Void)
    {
        //1. URL
        guard let apiURL = URL(string:buildURL()) else {
            return
        }
        // 2. Session with Header request
        APIManager.shared.createRequest(with: apiURL, type: .GET) { baseRequest in
            let task = self.session.dataTask(with: baseRequest) { data, response, error in
                if let error = error{
                    handler(.failure(error)) // 3. Handle error
                }
                guard let data = data , error == nil else { // 4. Handle data
                    return
                }
                do{ // 5. Handle decoding
                    let json = try JSONDecoder().decode(WeatherMapModel.self, from: data)
                    handler(.success(json))
                }catch{
                    handler(.failure(error)) // 6. handle error on decoder 
                }
            }
            task.resume()
        }
    }
    
 
}
