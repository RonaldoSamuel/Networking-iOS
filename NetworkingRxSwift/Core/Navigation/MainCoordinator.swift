//
//  MainCoordinator.swift
//  NetworkingRxSwift
//
//  Created by Ronaldo Filho on 02/12/21.
//

import UIKit

class MainCoordinator: NSCoder, Coordinator, UINavigationControllerDelegate {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
            navigationController.delegate = self
            login()
        }
        
        func login() {
            let child = PrincipalCoordinator(navigationController: navigationController)
            child.parentCoordinator = self
            childCoordinators.append(child)
            child.start()
        }
    
    func childDidFinish(_ child: Coordinator?) {
        for (index, coordinator) in childCoordinators.enumerated() where coordinator === child {
            childCoordinators.remove(at: index)
        }
    }
        
    }
