//
//  APIManager.swift
//  WeatherApp
//
//  Created by heyji on 2022/06/15.
//

import Foundation

public class APIManager {
    
    public static let shared = APIManager()
    
    private let appid = "65a2d8a2e9a70e771a5b17bd7a123c60"
    private let baseURL = "https://api.openweathermap.org/data/2.5/weather?"
    
    func getWeatherData(_ cityName: String, completion: @escaping (WeatherInfo) -> Void) {
        let strURL = "\(baseURL)appid=\(appid)&q=\(cityName)&units=metric"
        
        guard let url = URL(string: strURL) else { return }
        let request = URLRequest(url: url)
        
        let session = URLSession.shared
        let task = session.dataTask(with: request) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
            }

            do {
                guard let data = data else { return }
                let decoder = JSONDecoder()
                let weatherInfo = try decoder.decode(WeatherInfo.self, from: data)
                completion(weatherInfo)
                
            } catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
}
