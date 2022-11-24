//
//  LoginViewController.swift
//  CoordinatorPractice
//
//  Created by Bibi on 2022/08/02.
//

import Foundation
import UIKit

protocol LoginViewControllerDelegate {
    func login()
}

class LoginViewController: UIViewController {
    
    var delegate: LoginViewControllerDelegate?
    
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
        // 5-3. 로그인버튼이 눌리면 LoginCoordinator가 이를 알도록 delegate를 구현함
        // 왜? LoginVC의 로그인버튼이 눌리면 MainVC를 보여줘야 하는데, VC를 보여주는 역할을 대리자인 Coordinator가 하니까.
        
        self.delegate?.login()
    }
}
