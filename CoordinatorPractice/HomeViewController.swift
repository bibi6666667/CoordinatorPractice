//
//  MainViewController.swift
//  CoordinatorPractice
//
//  Created by Bibi on 2022/08/03.
//

import Foundation
import UIKit

protocol HomeViewControllerDelegate {
    // MainViewController에서 발생하지만, 처리는 다른 객체에게 위임할 작업
    func logout()
}

class HomeViewController: UIViewController {
    
    var delegate: HomeViewControllerDelegate?
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
        self.delegate?.logout()
    }
}
