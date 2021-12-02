//
//  ViewController.swift
//  NetworkingRxSwift
//
//  Created by Ronaldo Filho on 02/12/21.
//

import UIKit

class ViewController: UIViewController {
    
    var coordinator: PrincipalCoordinator?
    var presentationView = ListView()
    var viewModel = ViewModel()
    var disposable = DisposeBag()
    
    override func loadView() {
        view = presentationView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel.getList()
        self.bindView()
        // Do any additional setup after loading the view.
    }

    func bindView() {
        viewModel.dataSouce
            .bind(
                to: presentationView
                    .tableLista
                    .rx
                    .items(
                        cellIdentifier: ListViewCell.identifier,
                        cellType: ListViewCell.self
                    )
            ) { _, data, cell in
                cell.selectionStyle = .none
                
                cell.configCell(data)
            }.disposed(by: disposable)
    }

}

