//
//  NetworkError.swift
//  NetworkLayerSample
//
//  Created by Ibrahim on 7/1/23.
//

import Foundation

enum NetworkError: Error, CaseIterable {
    case cityNotFound
    case timeOut
    case mappingError
}

