//
//  AppCoordinator.swift
//  CoordinatorPractice
//
//  Created by Bibi on 2022/08/02.
//

import Foundation
import UIKit

class AppCoordinator: Coordinator, LoginCoordinatorDelegate, HomeCoordinatorDelegate {
   
    var childCoordinators: [Coordinator] = [] // child coordinator가 할당 해제되는것을 방지하기 위해 사용
    var navigationController: UINavigationController
    
    var isLoggedIn = false
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        if isLoggedIn {
            showMainViewController()
        } else {
            showLoginViewController()
        }
    }
    
    private func showMainViewController() {
        // HomeCoordinator를 만들고 start 호출 (VC 직접 생성 하지않음)
        let coordinator = HomeCoordinator(navigationController: self.navigationController)
        coordinator.delegate = self // 앱코디네이터는 하위코디네이터의 대리자
        coordinator.start()
        self.childCoordinators.append(coordinator)
    }
    
    private func showLoginViewController() {
        // LoginCoordinator를 만들고 start 호출
        let coordinator = LoginCoordinator(navigationController: self.navigationController)
        coordinator.delegate = self // 앱코디네이터는 하위코디네이터의 대리자
        coordinator.start()
        self.childCoordinators.append(coordinator)
    }
    
    func didLoggedIn(coordinator: LoginCoordinator) {
        self.childCoordinators = self.childCoordinators.filter  { $0 !== coordinator } // AppCoordinator의 자식 코디네이터 목록에서 LoginCoordinator 지우기
        self.showMainViewController()
    }
    
    func didLoggedOut(coordinator: HomeCoordinator) {
        self.childCoordinators = self.childCoordinators.filter  { $0 !== coordinator } // AppCoordinator의 자식 코디네이터 목록에서 HomeCoordinator 지우기
        self.showLoginViewController()
    }
}
