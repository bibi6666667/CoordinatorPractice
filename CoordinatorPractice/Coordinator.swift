//
//  Coordinator.swift
//  CoordinatorPractice
//
//  Created by Bibi on 2022/08/02.
//


import UIKit

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}
