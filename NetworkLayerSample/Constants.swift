//
//  Constants.swift
//  NetworkLayerSample
//
//  Created by Ibrahim on 7/1/23.
//

import Foundation

enum API_KEY {
    case weather
    
    var value: String {
        switch self {
        case .weather: return "71b25e50c4cd08490bce149947b556f9"
        }
    }
}
