//
//  AppDelegate.swift
//  CoordinatorPractice
//
//  Created by Bibi on 2022/08/02.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var coordinator: AppCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // 앱에서 사용될 메인 내비게이션 컨트롤러 생성
        let navigationController = UINavigationController()
        
        // 앱 코디네이터에 네비게이션 컨트롤러를 넣음 - 뷰 컨트롤러를 보여주기 위해
        coordinator = AppCoordinator(navigationController: navigationController)
        
        // 코디네이터가 제어권을 갖도록 지시
        coordinator?.start()
        
        // 기본 UIWindow를 만들고 활성화하기
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        return true
    }
}

