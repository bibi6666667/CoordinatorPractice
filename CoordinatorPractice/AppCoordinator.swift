//
//  AppCoordinator.swift
//  CoordinatorPractice
//
//  Created by Bibi on 2022/08/02.
//

import Foundation
import UIKit

class AppCoordinator: NSObject, Coordinator, UINavigationControllerDelegate {
   
    var childCoordinators: [Coordinator] = [] // child coordinator가 할당 해제되는것을 방지하기 위해 사용
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        navigationController.delegate = self
        showLoginViewController()
    }
    
    private func showHomeViewController() {
        // 자식 코디네이터를 만들고 제어권을 갖게 함(start 호출)
        let child = HomeCoordinator(navigationController: navigationController)
        childCoordinators.append(child)
        child.start()
        child.parentCoordinator = self
    }
    
    private func showLoginViewController() {
        // 자식 코디네이터를 만들고 제어권을 갖게 함(start 호출)
        let child = LoginCoordinator(navigationController: navigationController)
        childCoordinators.append(child)
        child.start()
        child.parentCoordinator = self
    }
    
    func didLoggedIn() {
        navigationController.popViewController(animated: true)
        showHomeViewController()
        print("로그인 -> 홈")
    }
    
    func didLoggedOut() {
        navigationController.popViewController(animated: true)
//        showLoginViewController()
        print("홈 -> 로그인")
    }
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        
        print("viewControllers : \(navigationController.viewControllers)")
        print("childCoordinators : \(childCoordinators)")
        
        // 어떤 뷰컨트롤러로부터 이동해 왔는지 조회
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else {
            return
        }

        // 해당 뷰컨트롤러가 뷰컨트롤러 배열에 존재하는지 확인. 만약 존재한다면, pop이 아닌 push를 한 것이므로 따로 처리할 작업은 없다.
        if navigationController.viewControllers.contains(fromViewController) {
            return
        }

        // 여기까지 도달했다면 해당 뷰컨트롤러가 뷰컨트롤러 배열에 존재하지 않는다는 것이며, 이는 pop이 되었음을 의미한다.
        // 따라서 어떤 뷰 컨트롤러가 pop되었는지 확인 후 그 뷰컨트롤러를 관리하던 자식 코디네이터를 지워주어야 한다.
        if let homeViewController = fromViewController as? HomeViewController {
            print("HomeVC의 코디네이터 삭제")
            childDidFinish(homeViewController.coordinator)
        }
        if let loginViewController = fromViewController as? LoginViewController {
            print("LoginVC의 코디네이터 삭제")
            childDidFinish(loginViewController.coordinator)
        }
        print("viewControllers : \(navigationController.viewControllers)")
        print("childCoordinators : \(childCoordinators)")
    }
    
    func childDidFinish(_ child: Coordinator?) {
        for (index, coordinator) in childCoordinators.enumerated() {
            if coordinator === child {
                childCoordinators.remove(at: index)
                print("\(child) 삭제함")
                break
            }
        }
    }
}
