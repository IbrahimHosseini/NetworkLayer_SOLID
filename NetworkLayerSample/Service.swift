//
//  Service.swift
//  NetworkLayerSample
//
//  Created by Ibrahim on 5/31/23.
//

import Foundation

protocol WeatherService {
    func fetch() async throws -> Result<Forecast, NetworkError>
}

class WeatherServiceImp: WeatherService {
    private let network: Network
    private let city: String
    
    init(city: String = "Tehran",
         network: Network = NetworkImp()) {
        self.network = network
        self.city = city
    }
    
    func fetch() async throws -> Result<Forecast, NetworkError> {
        let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(API_KEY.weather.value)")!
        return await network.get(type: Forecast.self, url: url)
    }
}
