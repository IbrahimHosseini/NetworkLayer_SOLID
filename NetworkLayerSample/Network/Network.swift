//
//  Network.swift
//  NetworkLayerSample
//
//  Created by Ibrahim on 5/31/23.
//

import Foundation

protocol Network {
    func get<T: Decodable>(type: T.Type, url: URL) async -> Result<T, NetworkError>
}

class NetworkImp: Network {
    
    let apiHandler: APIHandler
    let responseHandler: ResponseHandler
    
    init(apiHandler: APIHandler = APIHandlerImp(),
         responseHandler: ResponseHandler = ResponseHandlerImp()) {
        self.apiHandler = apiHandler
        self.responseHandler = responseHandler
    }
}

extension NetworkImp {
    
    func get<T: Decodable>(type: T.Type, url: URL) async -> Result<T, NetworkError> {
        
        let method = "GET"
        
        var request = URLRequest(url: url)
        request.httpMethod = method
        
        do {
            let data = try await apiHandler.data(type: type.self, url: request)
            let model = await responseHandler.model(type: type.self, data: data)
            switch model {
            case .success(let success):
                return .success(success)
            case .failure(let failure):
                return .failure(failure)
            }
        } catch let error {
            return .failure(error as! NetworkError)
        }
    }
}

