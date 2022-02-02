//
//  ViewController.swift
//  NetworkingRxSwift
//
//  Created by Ronaldo Filho on 02/12/21.
//

import UIKit

class ViewController: UIViewController {
    
    var expandedIndexPath: NSIndexPath?
    
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
                    .tableList
                    .rx
                    .items(
                        cellIdentifier: ListViewCell.identifier,
                        cellType: ListViewCell.self
                    )
            ) { _, data, cell in
                cell.selectionStyle = .none
                
                cell.configCell(data)
            }.disposed(by: disposable)
        
        self.presentationView.tableList.rx.itemSelected
          .subscribe(onNext: { [weak self] indexPath in
              let cell = self?.presentationView.tableList.cellForRow(at: indexPath) as? ListViewCell
              self?.presentationView.tableList.beginUpdates()
              cell?.userClickEffect()
              self?.presentationView.tableList.endUpdates()
          }).disposed(by: disposable)
    }

}
