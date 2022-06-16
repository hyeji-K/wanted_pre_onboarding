//
//  APIManager.swift
//  WeatherApp
//
//  Created by heyji on 2022/06/15.
//

import Foundation

public class APIManager {
    
    public static let shared = APIManager()
    
    private let appid = Bundle.main.apiKey
    private let baseURL = "https://api.openweathermap.org/data/2.5/weather?"
    
    private init() { }
    
    func getWeatherData(_ cityName: String, completion: @escaping (WeatherInfo) -> Void) {
        let strURL = "\(baseURL)appid=\(appid)&q=\(cityName)&units=metric"
        
        DispatchQueue.global(qos: .userInitiated).async {
            guard let url = URL(string: strURL) else { return }
            let request = URLRequest(url: url)
            
            URLSession.shared.dataTask(with: request) { data, response, error in
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
            }.resume()
        }
    }
}
