//
//  TimerView.swift
//  GenshinGuide
//
//  Created by Lucas Fernandes on 10/02/21.
//

import UIKit

class TimerView: UIView , UITextViewDelegate {
    
    var safeArea: UILayoutGuide!

    
    fileprivate let category: UILabel = {
        let text = UILabel()
        text.text = "Your Current Resin"
        text.textColor = .black
        text.translatesAutoresizingMaskIntoConstraints = false
        text.textAlignment = .left
        text.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return text
        
    }()
    
    let categorySelected: UITextField = {
        let text = UITextField()
        text.placeholder = "0"
        text.textColor = .orange
        text.translatesAutoresizingMaskIntoConstraints = false
        text.textAlignment = .right
        text.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        return text
        
    }()
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        backgroundColor = .green
        safeArea = layoutMarginsGuide
        addSubview(category)
        addSubview(categorySelected)
        
        category.translatesAutoresizingMaskIntoConstraints = false
        category.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: -150).isActive = true
        category.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor).isActive = true
        category.backgroundColor = .white
        
        categorySelected.translatesAutoresizingMaskIntoConstraints = false
        categorySelected.topAnchor.constraint(equalTo: category.bottomAnchor, constant: 30).isActive = true
        categorySelected.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor).isActive = true
        categorySelected.backgroundColor = .white
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
import Foundation
