//
//  WeatherApp++Bundle.swift
//  WeatherApp
//
//  Created by heyji on 2022/06/16.
//

import Foundation

extension Bundle {
    var apiKey: String {
        guard let file = self.path(forResource: "APIInfo", ofType: "plist") else { return "" }
        guard let resource = NSDictionary(contentsOfFile: file) else { return "" }
        guard let key = resource["API_KEY"] as? String else { fatalError("APIInfo.plist에 API_KEY 설정을 해주세요.")}
        return key
    }
}
