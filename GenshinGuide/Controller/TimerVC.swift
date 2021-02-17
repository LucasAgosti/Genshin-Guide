//
//  TimerVC.swift
//  GenshinGuide
//
//  Created by Lucas Fernandes on 10/02/21.
//

import UIKit
import UserNotifications

class TimerVC: UIViewController {
    
    var safeArea: UILayoutGuide!
    let titleLabel = UILabel()
    let timerTextField = UITextField()
    var timerLabel = UILabel()
    let timerButton = UIButton()
    
    var infoButton: UIBarButtonItem!
    
    var seconds = 0
    var timer = Timer()
    var infoImage = UIImage(named: "info.png")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        safeArea = view.layoutMarginsGuide
        infoButton = UIBarButtonItem(image: infoImage, style: UIBarButtonItem.Style.plain, target: self, action: #selector(pushAddController))
        setupNavController()
        setupTitleLabel()
        setupTimerTextField()
        setupTimerButton()
        
    }
    
    func setupNavController() {
        view.backgroundColor = .background
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for:.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.layoutIfNeeded()
        navigationController?.navigationBar.tintColor = .notSoWhite
        infoButton.style = .done
        navigationItem.rightBarButtonItem = infoButton
    }
    
    func setupTitleLabel() {
        view.addSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 100).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor).isActive = true
        titleLabel.heightAnchor.constraint(equalTo: safeArea.heightAnchor, multiplier: 0.1).isActive = true
        titleLabel.textColor = .white
        titleLabel.backgroundColor = .background
        titleLabel.font = UIFont(name: "Verdana", size: 20)
        titleLabel.text = "Current Resin:"
    }
    
    func setupTimerTextField() {
        view.addSubview(timerTextField)
        
        timerTextField.translatesAutoresizingMaskIntoConstraints = false
        timerTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 50).isActive = true
        timerTextField.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor).isActive = true
        timerTextField.heightAnchor.constraint(equalTo: safeArea.heightAnchor, multiplier: 0.05).isActive = true
        timerTextField.widthAnchor.constraint(equalTo: safeArea.widthAnchor, multiplier: 0.4).isActive = true
        
        timerTextField.layer.cornerRadius = 6
        timerTextField.font = UIFont(name: "Verdana", size: 22)
        timerTextField.textColor = .background
        timerTextField.backgroundColor = .white
        timerTextField.text = "0"
        timerTextField.textAlignment = .center
        timerTextField.keyboardType = .numberPad
    }
    
    func setupTimerButton() {
        view.addSubview(timerButton)
        
        timerButton.translatesAutoresizingMaskIntoConstraints = false
        timerButton.topAnchor.constraint(equalTo: timerTextField.bottomAnchor, constant: 50).isActive = true
        timerButton.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor).isActive = true
        timerButton.widthAnchor.constraint(equalTo: safeArea.widthAnchor, multiplier: 0.6).isActive = true
        timerButton.heightAnchor.constraint(equalTo: safeArea.heightAnchor, multiplier: 0.08).isActive = true
        
        timerButton.backgroundColor = .darkGray
        timerButton.setTitle("Start Timer", for: .normal)
        timerButton.layer.cornerRadius = 10
        timerButton.titleLabel?.font = UIFont(name: "Verdana", size: 18)
        timerButton.addTarget(self, action: #selector(startTimer), for: .touchUpInside)
    }

    @objc func startTimer() {
        if let resinInput = Int(timerTextField.text ?? "") {
            
            if resinInput >= 160 {
                print("Resina inserida maior que o máximo do jogo")
            } else {
                navigationController?.pushViewController(TimerAnimationVC(resin: resinInput), animated: false)
            }
        } else {
            print("Input diferente de inteiro")
        }
    }
    
    @objc func pushAddController() {
        self.present(InfoVC(), animated: true)
    }
}
