//
//  ResponseHandler.swift
//  NetworkLayerSample
//
//  Created by Ibrahim on 7/1/23.
//

import Foundation

// MARK: - Response Handler

protocol ResponseHandler {
    func model<T: Decodable>(type: T.Type, data: Data) async -> Result<T, NetworkError>
}

final class ResponseHandlerImp: ResponseHandler {
    func model<T>(type: T.Type, data: Data) async -> Result<T, NetworkError> where T : Decodable {
        do {
            let decoder = JSONDecoder()
            
            let weather = try! decoder.decode(Forecast.self, from: data)
            let decodedData = try decoder.decode(type.self, from: data)
            dump(weather)
            return .success(decodedData)
        } catch {
            return .failure(.cityNotFound)
        }
    }
}

