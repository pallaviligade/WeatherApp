//
//  WeatherMapModel.swift
//  VestiaireCollectionTest
//
//  Created by Pallavi on 24/11/21.
//

import Foundation
// MARK: - WeatherMapModel
struct WeatherMapModel: Codable {
    let city: City
    let cod: String
    let message: Double
    let cnt: Int
    let list: [List]?
}

// MARK: - City
struct City: Codable {
    let id: Int
    let name: String
    let coord: Coord
    let country: String
    let population, timezone: Int
}
// MARK: - Coord
struct Coord: Codable {
    let lon, lat: Double
}
// MARK: - List
struct List: Codable {
    let dt, sunrise, sunset: Int
    let temp: Temp?
    let feelsLike: FeelsLike
    let pressure, humidity: Int
    let weather: [Weather]?
    let speed: Double
    let deg: Int
    let gust: Double
    let clouds: Int
    let pop: Double
    let rain: Double?

    enum CodingKeys: String, CodingKey {
        case dt, sunrise, sunset, temp
        case feelsLike = "feels_like"
        case pressure, humidity, weather, speed, deg, gust, clouds, pop, rain
    }
}
// MARK: - FeelsLike
struct FeelsLike: Codable {
    let day, night, eve, morn: Double
}

// MARK: - Temp
struct Temp: Codable {
    let day, min, max, night: Double
    let eve, morn: Double
}

// MARK: - Weather
struct Weather: Codable {
    let id: Int
    let main: String
    let weatherDescription: String
    let icon: String

    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription = "description"
        case icon
    }
}
enum Icon: String, Codable {
    case the02D = "02d"
    case the04D = "04d"
    case the10D = "10d"
}

enum Main: String, Codable {
    case clouds = "Clouds"
    case rain = "Rain"
}

