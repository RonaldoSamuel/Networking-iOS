//
//  ListCodable.swift
//  NetworkingRxSwift
//
//  Created by Ronaldo Filho on 02/12/21.
//

import Foundation

class ListCodableElement: Codable {
    let categoryID, name: String

    enum CodingKeys: String, CodingKey {
        case categoryID = "category_id"
        case name
    }

    init(categoryID: String, name: String) {
        self.categoryID = categoryID
        self.name = name
    }
}

typealias ListCodable = [ListCodableElement]
