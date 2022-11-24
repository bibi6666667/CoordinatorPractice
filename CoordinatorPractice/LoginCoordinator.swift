//
//  LoginCoordinator.swift
//  CoordinatorPractice
//
//  Created by Bibi on 2022/08/02.
//

import Foundation
import UIKit

// 5-6. LoginCoordinatorDelegate 구현 - AppCoordinator와 LoginCoordinator 연결
protocol LoginCoordinatorDelegate {
    func didLoggedIn(coordinator: LoginCoordinator)
}

// 5-4. LoginCoordinator는 LoginVC의Delegate임
class LoginCoordinator: Coordinator, LoginViewControllerDelegate {
    
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    var delegate: LoginCoordinatorDelegate?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() { // VC 설정을 시작하는 역할
        let viewController = LoginViewController()
        viewController.view.backgroundColor = .systemBrown
        viewController.delegate = self
        
        self.navigationController.viewControllers = [viewController]
        // 다른 flow로 이어져야 한다면 33번 줄은 push 등으로 바꾼다.
    }
    
    // 5-5 로그인 버튼이 눌리면, AppCoordinator에게 알리고 MainVC로 가도록 한다
    func login() {
        // 5-6. LoginCoordinatorDelegate 구현
        self.delegate?.didLoggedIn(coordinator: self)
    }
    
}
