//
//  Model.swift
//  NetworkLayerSample
//
//  Created by Ibrahim on 5/31/23.
//

import Foundation

struct Forecast: Decodable {
    let weather: [Weather]
}

struct Weather: Decodable {
    let main : String
    let description : String
}
