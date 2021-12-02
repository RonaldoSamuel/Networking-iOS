//
//  ViewModel.swift
//  NetworkingRxSwift
//
//  Created by Ronaldo Filho on 02/12/21.
//

import UIKit

class ViewModel {
    
    var dataSouce: BehaviorRelay<ListModel> = BehaviorRelay<ListModel>(value: ListModel())
    
    var disposable: DisposeBag = DisposeBag()
    
    func getList() {
        ListClient.getList().asObservable().subscribe(
            onNext: { result in
                self.mapResponse(result: result)
            print(result)
        }, onError: { error in
            print(error)
        }).disposed(by: disposable)
    }
    
    func mapResponse(result: ListCodable) {
        
        var list: [ListModelElement] = []
        
        for items in result {
            list.append(ListModelElement(codable: items))
        }
        
        self.dataSouce.accept(list)
        
    }
    
}
