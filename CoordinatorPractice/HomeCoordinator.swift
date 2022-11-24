//
//  HomeCoordinator.swift
//  CoordinatorPractice
//
//  Created by Bibi on 2022/08/03.
//

import Foundation
import UIKit

protocol HomeCoordinatorDelegate {
    // HomeCoordinator와 AppCoordinator를 연결
    // 왜? HomeCoordinator에서 로그아웃하면 AppCoordinator가 이를 알고 화면을 바꿔줘야 하니까
    func didLoggedOut(coordinator: HomeCoordinator)
}

class HomeCoordinator: Coordinator, HomeViewControllerDelegate {
    
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    var delegate: HomeCoordinatorDelegate?
    
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        // homeVC 셋팅
        let viewController = HomeViewController()
        viewController.view.backgroundColor = .cyan
        viewController.delegate = self
        self.navigationController.viewControllers = [viewController]
    }
    
    func logout() {
        // mainVC에서 로그아웃 눌렀을 때
        // 화면 전환 필요 - 해당 작업을 위임한 AppCoordinator에게 넘긴다
        self.delegate?.didLoggedOut(coordinator: self)
    }
}
