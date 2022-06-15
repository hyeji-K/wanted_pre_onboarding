//
//  WeatherCell.swift
//  WeatherApp
//
//  Created by heyji on 2022/06/14.
//

import UIKit

class WeatherCell: UICollectionViewCell {
    
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var currentTempLabel: UILabel!
    @IBOutlet weak var currentHumidLabel: UILabel!
    
    let cityKo: [String: String] = ["Gongju": "공주", "Gwangju": "광주", "Gumi": "구미", "Gunsan": "군산", "Daegu": "대구", "Daejeon": "대전", "Mokpo": "목포", "Busan": "부산", "Seosan City": "서산", "Seoul": "서울", "Sokcho": "속초", "Suwon-si": "수원", "Suncheon": "순천", "Ulsan": "울산", "Iksan": "익산", "Jeonju": "전주", "Jeju City": "제주시", "Cheonan": "천안", "Cheongju-si": "청주", "Chuncheon": "춘천"]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.layer.cornerRadius = 10
        contentView.backgroundColor = .systemGray5
    }
    
    func configure(_ weatherInfo: WeatherInfo) {
        
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
        
        let cityName = weatherInfo.name
        cityNameLabel.text = cityKo[cityName]
        
        currentTempLabel.text = "\(Int(weatherInfo.main.temp))°"
        currentHumidLabel.text = "습도: \(weatherInfo.main.humidity)%"
    }
}
