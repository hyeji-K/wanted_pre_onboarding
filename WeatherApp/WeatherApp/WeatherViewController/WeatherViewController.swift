//
//  WeatherViewController.swift
//  WeatherApp
//
//  Created by heyji on 2022/06/14.
//

import UIKit

class WeatherViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let city: [String] = ["gongju", "gwangju", "gumi", "gunsan", "daegu", "daejeon", "mokpo", "busan", "seosan", "seoul", "sokcho", "suwon", "suncheon", "ulsan", "iksan", "jeonju", "jeju", "cheonan", "cheongju", "chuncheon"]
    
    var weatherInfo: WeatherInfo?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.dataSource = self
        collectionView.delegate = self
    }
}

extension WeatherViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return city.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WeatherCell", for: indexPath) as? WeatherCell else {
            return UICollectionViewCell()
        }
        
        let cityName = city[indexPath.item]
        
        APIManager.shared.getWeatherData(cityName) { weatherInfo in
            self.weatherInfo = weatherInfo
            guard let data = self.weatherInfo else { return }

            DispatchQueue.main.async {
                cell.configure(data)
            }
        }
        
        return cell
    }
}

extension WeatherViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let margin: CGFloat = 10
        let width = collectionView.bounds.width
        let availableWidth = width - (margin * 2)
        
        return CGSize(width: availableWidth, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}

extension WeatherViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cityName = city[indexPath.item]
        
        let storyboard = UIStoryboard(name: "DetailWeather", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        
        vc.cityName = cityName
        navigationController?.pushViewController(vc, animated: true)
    }
}
