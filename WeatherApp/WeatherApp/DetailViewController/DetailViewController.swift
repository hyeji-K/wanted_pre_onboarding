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
    
    let cityKo: [String: String] = ["Gongju": "공주", "Gwangju": "광주", "Gumi": "구미", "Gunsan": "군산", "Daegu": "대구", "Daejeon": "대전", "Mokpo": "목포", "Busan": "부산", "Seosan City": "서산", "Seoul": "서울", "Sokcho": "속초", "Suwon-si": "수원", "Suncheon": "순천", "Ulsan": "울산", "Iksan": "익산", "Jeonju": "전주", "Jeju City": "제주시", "Cheonan": "천안", "Cheongju-si": "청주", "Chuncheon": "춘천"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.largeTitleDisplayMode = .never
        
        weatherDetailView.backgroundColor = .systemGray6
        weatherDetailView.layer.cornerRadius = 10
        self.navigationController?.navigationBar.tintColor = .black
        
        updateUI()
    }
    
    func updateUI() {
        APIManager.shared.getWeatherData(cityName) { weatherInfo in
            self.weatherInfo = weatherInfo
            guard let data = self.weatherInfo else { return }
            
            let weatherURL = "http://openweathermap.org/img/w/\(weatherInfo.weather[0].icon).png"
            self.weatherImageView.setImageURL(weatherURL)

            DispatchQueue.main.async {
                self.cityNameLabel.text = self.cityKo[weatherInfo.name]
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
