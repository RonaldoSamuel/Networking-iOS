//
//  APIClient.swift
//  NetworkingRxSwift
//
//  Created by Ronaldo Filho on 02/12/21.
//

import Foundation
import Alamofire

class APIClient {
    
    static let sessionManagerAuthenticated: Session = {
        let configuration = URLSessionConfiguration.af.default
        configuration.timeoutIntervalForRequest = 30
        configuration.waitsForConnectivity = true
        let networkLogger = NetworkLogger()
        let interceptor = NetworkInterceptor()
        return Session(configuration: configuration, interceptor: interceptor, eventMonitors: [networkLogger])
    }()
    
    static let sessionManagerWithoutAuthentication: Session = {
        let configuration = URLSessionConfiguration.af.default
        configuration.timeoutIntervalForRequest = 30
        configuration.waitsForConnectivity = true
        let networkLogger = NetworkLogger()
        return Session(configuration: configuration, eventMonitors: [networkLogger])
    }()
    
    static func authenticate<T: Codable> (_ urlConvertible: URLRequestConvertible) -> Observable<T> {
        return Observable<T>.create { observer in
            
            sessionManagerAuthenticated.request(urlConvertible).responseDecodable { (response: AFDataResponse<T>) in
                
                switch response.result {
                case .success(let value):
                    observer.onNext(value)
                    observer.onCompleted()
                case .failure(let error):
                    switch response.response?.statusCode {
                    case 200:
                        observer.onError(APIError.noDecoded)
                    case 204:
                        observer.onError(APIError.noContent)
                    case 400:
                        observer.onError(APIError.badRequest)
                    case 401:
                        observer.onError(APIError.unauthorized)
                    case 403:
                        observer.onError(APIError.forbidden)
                    case 404:
                        observer.onError(APIError.notFound)
                    case 405:
                        observer.onError(APIError.noAllowed)
                    case 409:
                        observer.onError(APIError.conflict)
                    case 500:
                        observer.onError(APIError.internalServerError)
                    default:
                        observer.onError(error)
                    }
                }
            }
            
            return Disposables.create {}
        }
    }
    
    // MARK: - Executador de requests
    static func request<T: Codable> (_ urlConvertible: URLRequestConvertible) -> Observable<T> {
        return Observable<T>.create { observer in
            
            sessionManagerWithoutAuthentication.request(urlConvertible).responseDecodable { (response: AFDataResponse<T>) in
                
                switch response.result {
                case .success(let value):
                    
                    observer.onNext(value)
                    observer.onCompleted()
                case .failure(let error):
                    print(error)
                    switch response.response?.statusCode {
                    case 200:
                        observer.onError(APIError.noDecoded)
                    case 204:
                        observer.onError(APIError.noContent)
                    case 400:
                        observer.onError(APIError.badRequest)
                    case 401:
                        observer.onError(APIError.unauthorized)
                    case 403:
                        observer.onError(APIError.forbidden)
                    case 404:
                        observer.onError(APIError.notFound)
                    case 405:
                        observer.onError(APIError.noAllowed)
                    case 409:
                        observer.onError(APIError.conflict)
                    case 500:
                        observer.onError(APIError.internalServerError)
                    default:
                        observer.onError(error)
                    }
                }
            }
            
            return Disposables.create {}
        }
    }
    
}
