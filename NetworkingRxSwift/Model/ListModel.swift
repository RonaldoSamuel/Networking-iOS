//
//  ListModel.swift
//  NetworkingRxSwift
//
//  Created by Ronaldo Filho on 02/12/21.
//

import Foundation

struct ListModelElement {
    var categoryId: String
    var name: String
    
    init(codable: ListCodableElement) {
        self.categoryId = codable.categoryID
        self.name = codable.name
    }
    
    init(name: String, categoryId: String) {
        self.categoryId = categoryId
        self.name = name
    }
    
    init() {
        self.categoryId = ""
        self.name = ""
    }
    
}

typealias ListModel = [ListModelElement]
