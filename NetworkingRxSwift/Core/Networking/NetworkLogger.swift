//
//  NetworkLogger.swift
//  NetworkingRxSwift
//
//  Created by Ronaldo Filho on 02/12/21.
//

import Foundation
import Alamofire

class NetworkLogger: EventMonitor {
    let queue = DispatchQueue(label: "br.com.estudo.ronaldo.NetworkingRxSwift")
    
    func requestDidFinish(_ request: Request) {
        print(request.description)
    }
    
    func request<Value>(_ request: DataRequest, didParseReponse response: DataResponse<Value, AFError>) {
        guard let data = response.data else { return }
        
        if let json = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) {
            print(json)
        }
    }
}
