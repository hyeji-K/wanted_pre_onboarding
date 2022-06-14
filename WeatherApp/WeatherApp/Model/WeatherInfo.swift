//
//  WeatherInfo.swift
//  WeatherApp
//
//  Created by heyji on 2022/06/15.
//

import Foundation

struct WeatherInfo: Decodable {
    let coord: Coord
    let weather: [Weather]
    let main: Main
    let wind: Wind
    let clouds: Cloud
    let sys: Sys
    let name: String
}

struct Coord: Decodable {
    let lon: Double
    let lat: Double
}

struct Weather: Decodable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

struct Main: Decodable {
    let temp: Double
    let feelsLike: Double
    let tempMin: Double
    let tempMax: Double
    let pressure: Int
    let humidity: Int
    let seaLevel: Int?
    let grndLevel: Int?
    
    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure
        case humidity
        case seaLevel = "sea_level"
        case grndLevel = "grnd_level"
    }
}

struct Wind: Decodable {
    let speed: Double
    let deg: Int
    let gust: Double?
}

struct Cloud: Decodable {
    let all: Int
}

struct Sys: Decodable {
    let type: Int?
    let id: Int?
    let country: String
    let sunrise: Int
    let sunset: Int
}
