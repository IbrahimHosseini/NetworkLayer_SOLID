//
//  APIHandler.swift
//  NetworkLayerSample
//
//  Created by Ibrahim on 7/1/23.
//

import Foundation

// MARK: - API Handler

protocol APIHandler {
    func data<T: Decodable>(type: T.Type, url: URLRequest) async throws -> Data
}

final class APIHandlerImp: APIHandler {
    func data<T>(type: T.Type, url: URLRequest) async throws -> Data where T : Decodable {
        let (data, _) = try await URLSession.shared.data(for: url)
        return data
    }
}
