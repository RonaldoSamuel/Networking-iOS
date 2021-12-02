//
//  ListClient.swift
//  NetworkingRxSwift
//
//  Created by Ronaldo Filho on 02/12/21.
//

import Foundation

class ListClient: APIClient {
    static func getList() -> Observable<ListCodable> {
        return request(ListRouter.list)
    }
}
