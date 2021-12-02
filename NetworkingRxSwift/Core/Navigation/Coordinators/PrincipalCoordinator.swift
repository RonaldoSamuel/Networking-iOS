//
//  PrincipalCoordinator.swift
//  NetworkingRxSwift
//
//  Created by Ronaldo Filho on 02/12/21.
//

import UIKit

class PrincipalCoordinator: Coordinator {
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    weak var parentCoordinator: MainCoordinator?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        login()
    }
    
    func login() {
        let navigatorController = ViewController()
        navigatorController.coordinator = self
        navigationController.pushViewController(navigatorController, animated: true)
    }
    
}
