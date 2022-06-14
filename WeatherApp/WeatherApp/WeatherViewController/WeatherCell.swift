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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.layer.cornerRadius = 10
        contentView.backgroundColor = .gray
    }
    
//    func configure(_ weatherInfo: WeatherInfo) {
//
//    }
}
