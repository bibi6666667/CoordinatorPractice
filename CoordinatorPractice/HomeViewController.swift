//
//  MainViewController.swift
//  CoordinatorPractice
//
//  Created by Bibi on 2022/08/03.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    
    weak var coordinator: HomeCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let item = UIBarButtonItem(title: "로그아웃", style: .plain, target: self, action: #selector(logoutButtonDidTap))
        self.navigationItem.rightBarButtonItem = item
    }
    
    deinit {
        print("\(type(of: self)) deinit")
    }
    
    @objc
    func logoutButtonDidTap() {
        coordinator?.logout()
    }
}
