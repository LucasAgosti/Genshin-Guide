//
//  TimerAnimationVC.swift
//  GenshinGuide
//
//  Created by Lucas Fernandes on 12/02/21.
//

import UIKit

class TimerAnimationVC: UIViewController {

    let shape = CAShapeLayer()
    var timerLabel = UILabel()
    var safeArea: UILayoutGuide!
    let cancelButton = UIButton()
    
    static var resin: Int!
    var seconds = 0
    var timer = Timer()
    
    private var label: UILabel {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Timer Left"
        label.font = .systemFont(ofSize: 36, weight: .light)
        return label
    }
    
    private var button: UIButton = {
        let button = UIButton()
        button.setTitle("Cancel", for: .normal)
        button.backgroundColor = .pastelBlue
        button.titleLabel?.font = UIFont(name: "Verdana", size: 18)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(didTapCancelButton), for: .touchUpInside)
        
        return button
    }()
    
    init(resin: Int) {
        super.init(nibName: nil, bundle: nil)
        TimerAnimationVC.resin = resin
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Hides back button on nav controller
        navigationItem.leftBarButtonItem = UIBarButtonItem()
        safeArea = view.layoutMarginsGuide
        print("Resina inserida pelo user: \(String(describing: TimerAnimationVC.resin))")
        view.backgroundColor = .background
        
        label.sizeToFit()
        label.center = view.center
        view.addSubview(label)
        
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerClass), userInfo: nil , repeats: true)
        
        setupTimerLabel()
//        setupAnimation()
        animateCircle()
        setupCancelButton()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
//        print("Chamou subviews")
        setupAnimation()
    }
    
    func setupTimerLabel() {
        view.addSubview(timerLabel)
        
        timerLabel.translatesAutoresizingMaskIntoConstraints = false
        timerLabel.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor).isActive = true
        timerLabel.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor).isActive = true
        timerLabel.widthAnchor.constraint(equalTo: safeArea.widthAnchor, multiplier: 0.45).isActive = true
        timerLabel.textColor = .white
        timerLabel.textAlignment = .center
        timerLabel.font = UIFont(name: "Verdana", size: 17)
        timerLabel.text = "Current Resin:" + String(seconds)
    }
    
    func setupAnimation() {
        let circlePath = UIBezierPath(arcCenter: view.center,
                                      radius: 150,
                                      startAngle: -(.pi / 2),
                                      endAngle: .pi * 2,
                                      clockwise: true)
        
        let trackShape = CAShapeLayer()
        
        trackShape.path = circlePath.cgPath
        trackShape.fillColor = UIColor.clear.cgColor
        trackShape.lineWidth = 22
        trackShape.strokeColor = UIColor.notSoWhite.cgColor
        view.layer.addSublayer(trackShape)
        
        shape.path = circlePath.cgPath
        shape.lineWidth = 22
        shape.strokeColor = UIColor.pastelBlue.cgColor
        shape.fillColor = UIColor.clear.cgColor
        shape.strokeEnd = 0
        view.layer.addSublayer(shape)
        
//        trackShape.translatesAutoresizingMaskIntoConstraints = false
//        trackShape.topAnchor.constraint(equalTo: timerTextField.bottomAnchor, constant: 50).isActive = true
//        trackShape.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor).isActive = true
//        trackShape.widthAnchor.constraint(equalTo: safeArea.widthAnchor, multiplier: 0.4).isActive = true
//        trackShape.heightAnchor.constraint(equalTo: safeArea.heightAnchor, multiplier: 0.1).isActive = true
    }
    
//    func setupCircleConstraints() {
//
//    }
    
    func animateCircle() {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.toValue = 1
        animation.duration = Double(resinToSecond(resin: TimerAnimationVC.resin))
        animation.isRemovedOnCompletion = false
        animation.fillMode = .forwards
        shape.add(animation, forKey: "animation")
    }
    
    func setupCancelButton() {
//        let button = UIButton(frame: CGRect(x: 20, y: view.frame.size.height - 150, width: view.frame.size.width - 40, height: 50))
        view.addSubview(button)
//        button.setTitle("Cancel", for: .normal)
//        button.backgroundColor = .systemGreen
//        button.layer.cornerRadius = 10
//        button.addTarget(self, action: #selector(didTapCancelButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor).isActive = true
        button.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -100).isActive = true
        button.widthAnchor.constraint(equalTo: safeArea.widthAnchor, multiplier: 0.55).isActive = true
        button.heightAnchor.constraint(equalTo: safeArea.heightAnchor, multiplier: 0.08).isActive = true
    }
    
    func resinToSecond(resin: Int) -> Int {
         return (160 - resin) * 8 * 60
    }
    
    @objc func didTapCancelButton() {
        timer.invalidate()
        self.view.backgroundColor = .red
        navigationController?.popViewController(animated: false)
        
        let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
        print("clicou no botão cancelar")
        do {
            let timerScreenInitializer = try (context?.fetch(ResinCalculator.fetchRequest()) as! [ResinCalculator])
            print(timerScreenInitializer.count)
            if timerScreenInitializer.count > 0 {
                context?.delete(timerScreenInitializer[0])
            }
            print(timerScreenInitializer.count)

            try context?.save()
        } catch {
            print("Erro ao apagar coredata")
        }
    }
    
    @objc func timerClass() {
        seconds += 1

        // A cada 8 minutos a resina aumenta em 1
        if(seconds % 480 == 0) {
            TimerAnimationVC.resin += 1
        }
        timerLabel.text = "Current Resin: " + String(TimerAnimationVC.resin)
            
        if(TimerAnimationVC.resin == 160) {
            print("Resina esta cheia")
            timer.invalidate()
            
            // Send Notification logic
//            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(5)) {
//                NotificationCenter.default.post(someNotification)
//            }
        }
    }
}
