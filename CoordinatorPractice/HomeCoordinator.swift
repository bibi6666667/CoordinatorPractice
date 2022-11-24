//
//  HomeCoordinator.swift
//  CoordinatorPractice
//
//  Created by Bibi on 2022/08/03.
//

import Foundation
import UIKit

class HomeCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    weak var parentCoordinator: AppCoordinator?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        // homeVC 셋팅
        let viewController = HomeViewController()
        viewController.coordinator = self
        viewController.view.backgroundColor = .systemPurple
        viewController.title = "Home"
        navigationController.pushViewController(viewController, animated: true)
//        self.navigationController.viewControllers = [viewController]
        print("HomeViewController를 표시합니다")
    }
    
    func logout() {
        // mainVC에서 로그아웃 눌렀을 때
        // 화면 전환 필요 - 해당 작업을 위임한 AppCoordinator에게 넘긴다
        parentCoordinator?.didLoggedOut()
    }
}
