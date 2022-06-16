//
//  DetailViewController.swift
//  WeatherApp
//
//  Created by heyji on 2022/06/14.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var currentTempLabel: UILabel!
    @IBOutlet weak var weatherDetailView: UIView!
    @IBOutlet weak var feelTempLabel: UILabel!
    @IBOutlet weak var lowTempLabel: UILabel!
    @IBOutlet weak var highTempLabel: UILabel!
    @IBOutlet weak var humidtyLabel: UILabel!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var windSpeedLabel: UILabel!
    
    var weatherInfo: WeatherInfo?
    var cityName: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.largeTitleDisplayMode = .never
        
        weatherDetailView.backgroundColor = .systemGray6
        weatherDetailView.layer.cornerRadius = 10
        
        APIManager.shared.getWeatherData(cityName) { weatherInfo in
            self.weatherInfo = weatherInfo
            guard let data = self.weatherInfo else { return }
            
            let serialQueue = DispatchQueue(label: "Decode queue")
            serialQueue.async {
                let weatherURL = "http://openweathermap.org/img/w/\(weatherInfo.weather[0].icon).png"
                guard let imageURL = URL(string: weatherURL),
                      let imageData = try? Data(contentsOf: imageURL)
                else { return }
                
                DispatchQueue.main.async {
                    self.weatherImageView.image = UIImage(data: imageData)
                }
            }

            DispatchQueue.main.async {
                self.cityNameLabel.text = data.name
                self.descriptionLabel.text = data.weather[0].main
                self.currentTempLabel.text = "\(Int(data.main.temp))°"
                self.feelTempLabel.text = "\(Int(data.main.feelsLike))°"
                self.lowTempLabel.text = "\(Int(data.main.tempMin))°"
                self.highTempLabel.text = "\(Int(data.main.tempMax))°"
                self.humidtyLabel.text = "\(data.main.humidity) %"
                self.pressureLabel.text = "\(data.main.pressure) hPa"
                self.windSpeedLabel.text = "\(data.wind.speed) m/s"
            }
        }
    }
}
