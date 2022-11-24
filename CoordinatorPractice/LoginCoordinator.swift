//
//  LoginCoordinator.swift
//  CoordinatorPractice
//
//  Created by Bibi on 2022/08/02.
//

import Foundation
import UIKit

class LoginCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    weak var parentCoordinator: AppCoordinator?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() { // VC 설정을 시작하는 역할
        // loginVC 셋팅
        let viewController = LoginViewController()
        viewController.coordinator = self
        viewController.view.backgroundColor = .systemBrown
        viewController.title = "Login"
        navigationController.pushViewController(viewController, animated: true)
        print("LoginViewController를 표시합니다")
    }
    
    func login() {
        parentCoordinator?.didLoggedIn()
    }
    
}
