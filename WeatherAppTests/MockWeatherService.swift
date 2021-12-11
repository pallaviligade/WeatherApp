//
//  MockWeatherService.swift
//  VestiaireCollectionTestTests
//
//  Created by Pallavi on 28/11/21.
//

import Foundation
@testable import VestiaireCollectionTest
final class MockWeatherService : WeatherConditionManagerProtocol {
    
    func createRequestForWeatherapi(handler: @escaping (Result<WeatherMapModel, Error>) -> Void) {
        handler(.success(createWeatherMapModel()))
    }
}

private func createWeatherMapModel() -> WeatherMapModel{
    (WeatherMapModel(city: City(id: 1, name: "Paris", coord: Coord(lon: 2.3, lat: 48.0), country: "FR", population: 10000, timezone: 3600), cod: "200", message: 9.66, cnt: 16, list: [List(dt: 1638097200, sunrise: 1638083940, sunset: 1638115116, temp: nil, feelsLike: FeelsLike(day: 0.4, night: 0.9, eve: 0.12, morn: -0.16), pressure: 1002, humidity: 76, weather: [Weather(id: 501, main: "Rain", weatherDescription: "rain disc", icon: "020")], speed: 12.3, deg: 11, gust: 11, clouds: 1, pop: 12, rain: 12)]))
}
