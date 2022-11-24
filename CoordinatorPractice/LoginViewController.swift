//
//  LoginViewController.swift
//  CoordinatorPractice
//
//  Created by Bibi on 2022/08/02.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {
    
    weak var coordinator: LoginCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let loginItem = UIBarButtonItem(title: "로그인", style: .plain, target: self, action: #selector(loginButtonDidTap))
        self.navigationItem.rightBarButtonItem = loginItem
    }
    
    deinit {
        print("\(type(of: self)) deinit")
    }
    
    @objc
    func loginButtonDidTap() {
        coordinator?.login()
    }
}
