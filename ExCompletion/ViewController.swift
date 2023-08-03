//
//  ViewController.swift
//  ExCompletion
//
//  Created by 김종권 on 2023/08/03.
//

import UIKit

class ViewController: UIViewController {
    private let vc: UIViewController = {
        let vc = UIViewController()
        vc.view.backgroundColor = .yellow
        return vc
    }()
    private let button: UIButton = {
        let button = UIButton()
        button.setTitle("button", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitleColor(.blue, for: .highlighted)
        button.addTarget(self, action: #selector(tap), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(button)
        NSLayoutConstraint.activate([
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
    }
    
    @objc private func tap() {
        run() {
            print("test!")
        }
    }

    private func run(completion: @escaping (() -> Void)) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        UIView
            .animate(
                withDuration: 5,
                animations: { self.view.backgroundColor = .yellow }
            )
        CATransaction.commit()
    }
}
