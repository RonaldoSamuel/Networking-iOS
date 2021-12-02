//
//  ListRouter.swift
//  NetworkingRxSwift
//
//  Created by Ronaldo Filho on 02/12/21.
//

import Foundation
import Alamofire

enum ListRouter: APIConfiguration {
    
case list
    
    var method: HTTPMethod {
        switch self {
        default:
            return .get
        }
    }
    var parameters: RequestParams {
        switch self {
        default:
            return .url([:])
        }
    }
    
    var path: String {
        switch self {
        case .list:
            return "v3/coins/categories/list"
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = try Constants.API.ProductionServer.baseURL.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        urlRequest.httpMethod = method.rawValue
        
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        
        
        let components = URLComponents(string: url.appendingPathComponent(path).absoluteString)
        urlRequest.url = components?.url
        
        return urlRequest
    }
}
