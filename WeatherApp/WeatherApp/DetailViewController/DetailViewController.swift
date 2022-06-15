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
    @IBOutlet weak var feelTempLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    var weatherInfo: WeatherInfo?
    var cityName: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.largeTitleDisplayMode = .never
        
        tableView.dataSource = self
//        tableView.delegate = self
        tableView.backgroundColor = .systemGray6
        view.backgroundColor = .systemGray6
        weatherImageView.backgroundColor = .systemGray6
        
        APIManager.shared.getWeatherData(cityName) { weatherInfo in
            self.weatherInfo = weatherInfo
            guard let data = self.weatherInfo else { return }

            DispatchQueue.main.async {
                self.cityNameLabel.text = data.name
                self.descriptionLabel.text = data.weather[0].main
                self.currentTempLabel.text = "\(Int(data.main.temp))°"
                self.feelTempLabel.text = "체감 온도: \(Int(data.main.feelsLike))°"
            }
        }
    }
}

extension DetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailCell", for: indexPath)
        
        
        return cell
    }
    
    
}


