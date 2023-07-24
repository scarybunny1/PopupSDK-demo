//
//  DemoViewController.swift
//  PopupSDK
//
//  Created by Ayush Bhatt on 24/07/23.
//

import UIKit

class DemoViewController: UIViewController {
    
    let topButton: UIButton = {
        let b = UIButton()
        b.setTitle("Show Popup at the Top", for: .normal)
        b.setTitleColor(.red, for: .normal)
        return b
    }()

    let centerButton: UIButton = {
        let b = UIButton()
        b.setTitle("Show Popup in the Center", for: .normal)
        b.setTitleColor(.blue, for: .normal)
        return b
    }()
    
    let bottomButton: UIButton = {
        let b = UIButton()
        b.setTitleColor(.green, for: .normal)
        b.setTitle("Show Popup at the Bottom", for: .normal)
        return b
    }()
    
    let stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.distribution = .fillEqually
        sv.spacing = 10
        sv.alignment = .fill
        return sv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        stackView.addArrangedSubview(topButton)
        stackView.addArrangedSubview(centerButton)
        stackView.addArrangedSubview(bottomButton)
        
        view.addSubview(stackView)
        
        setUpButtons()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(greaterThanOrEqualTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    private func setUpButtons(){
        topButton.addTarget(self, action: #selector(didTapPopUpButton), for: .touchUpInside)
        centerButton.addTarget(self, action: #selector(didTapPopUpButton), for: .touchUpInside)
        bottomButton.addTarget(self, action: #selector(didTapPopUpButton), for: .touchUpInside)
    }
    
    @objc private func didTapPopUpButton(_ sender: UIButton){
        if sender == topButton{
            // Show popup on top
        } else if sender == centerButton{
            // Show popup in the center
        } else{
            // Show popup at bottpm
        }
    }
}
