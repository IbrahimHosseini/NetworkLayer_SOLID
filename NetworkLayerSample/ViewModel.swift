//
//  ViewModel.swift
//  NetworkLayerSample
//
//  Created by Ibrahim on 5/31/23.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var weather: String = ""
    @Published var error: String = ""
    
    private let service: WeatherService
    
    init(service: WeatherService = WeatherServiceImp()) {
        self.service = service
        
        Task {
            await fetchWeather()
        }
    }
    
    @MainActor
    private func fetchWeather() async {
        let weather = try! await service.fetch()
        switch weather {
        case .success(let forecast):
            self.weather = forecast.weather.first!.description
        case .failure(let error):
            switch error {
            case .cityNotFound:
                self.error = "City Not Found"
            case .timeOut:
                self.error = "Time Out"
            case .mappingError:
                self.error = "Mapping process occurred error"
            }
        }
    }
}

