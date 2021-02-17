//
//  InfoVC.swift
//  GenshinGuide
//
//  Created by Lucas Fernandes on 12/02/21.
//

import UIKit

class InfoVC: UIViewController {

    var safeArea: UILayoutGuide!
    let titleLabel = UILabel()
    let textLabel = UILabel()


    let dismissButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .background
        safeArea = view.layoutMarginsGuide
        
        setupTitleLabel()
        setupTextLabel()
        setupDismissButton()
    }
    
    func setupTitleLabel() {
        view.addSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 50).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20).isActive = true
        titleLabel.textColor = .white
        titleLabel.font = UIFont(name: "Verdana", size: 17)
        titleLabel.textAlignment = .left
        titleLabel.text = "How timer works:"
    }
    
    func setupTextLabel() {
        view.addSubview(textLabel)
        
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.topAnchor.constraint(equalTo: titleLabel.topAnchor, constant: 80).isActive = true
        textLabel.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor).isActive = true
        textLabel.widthAnchor.constraint(equalTo: safeArea.widthAnchor, multiplier: 0.9).isActive = true
        textLabel.textColor = .white
        textLabel.font = UIFont(name: "Verdana", size: 16)
        textLabel.numberOfLines = 0
        textLabel.text = "You have to put the resin that you have in game, so we'll calculate how long takes to your resin gauge gets full and we'll notify you when it gets full :)\n\nOne resin recharges in 8 minutes\nSo, it'll take 21 hours to recharge your full resin."
    }
    
    func setupDismissButton() {
        view.addSubview(dismissButton)
        
        dismissButton.translatesAutoresizingMaskIntoConstraints = false
        dismissButton.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -50).isActive = true
        dismissButton.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor).isActive = true
        
        dismissButton.setTitle("Dismiss", for: .normal)
        dismissButton.addTarget(self, action: #selector(dismissAction), for: .touchUpInside)
    }
 
    @objc func dismissAction() {
        self.dismiss(animated: true)
    }
}
