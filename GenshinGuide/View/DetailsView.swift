//
//  DetailsView.swift
//  GenshinGuide
//
//  Created by Lucas Fernandes on 10/02/21.
//

import UIKit

class DetailsView: UIView, UITextViewDelegate {
        
//    let categories = [""]
    var descriptionFields: [UIView]!
    var safeArea: UILayoutGuide!
    
    let icon: UIImageView = {
        let image = UIImageView()
//        image.image = #imageLiteral(resourceName: "120.png")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleToFill
        return image
        
    }()
    
    let iconView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
//        view.backgroundColor = #colorLiteral(red: 0.2156862745, green: 0.3137254902, blue: 0.5490196078, alpha: 1)
        view.layer.cornerRadius = 8
        return view
    }()

    fileprivate let descriptionView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 12
        view.backgroundColor = .green
        return view
    }()
    
    fileprivate let nameLabel: UILabel = {
        let text = UILabel()
        text.text = "Char Name"
        text.textColor = .darkText
        text.translatesAutoresizingMaskIntoConstraints = false
        text.textAlignment = .left
        text.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        return text
        
    }()
    
//    let categorySelected: UITextField = {
//        let text = UITextField()
//        text.placeholder = "Informe a categoria"
//        text.textColor = .darkText
//        text.translatesAutoresizingMaskIntoConstraints = false
//        text.textAlignment = .right
//        text.font = UIFont.systemFont(ofSize: 17, weight: .medium)
//        return text
//
//    }()
    
    let favorite: UIButton = {
        let button = UIButton()
        let icon = UIImage(named: "favorite")
        button.translatesAutoresizingMaskIntoConstraints = false
        button.clipsToBounds = true
        button.layer.cornerRadius = 16
        button.setImage(icon, for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
//        button.backgroundColor =
//        action
        return button
    }()
    
    fileprivate let visionLabel: UILabel = {
        let text = UILabel()
        text.text = "Vision"
        text.textColor = .darkText
        text.translatesAutoresizingMaskIntoConstraints = false
        text.textAlignment = .left
        text.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        return text
    }()
    
    let visionTypeLabel: UILabel = {
        let text = UILabel()
        text.text = "Cryo"
        text.textColor = .darkText
        text.translatesAutoresizingMaskIntoConstraints = false
        text.textAlignment = .right
        text.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        return text
    }()
    
    fileprivate let weaponLabel: UILabel = {
        let text = UILabel()
        text.text = "Weapon"
        text.textColor = .darkText
        text.translatesAutoresizingMaskIntoConstraints = false
        text.textAlignment = .left
        text.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        return text
    }()
    
    let weaponTypeLabel: UILabel = {
        let text = UILabel()
        text.text = "Claymore"
        text.textColor = .darkText
        text.translatesAutoresizingMaskIntoConstraints = false
        text.textAlignment = .right
        text.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        return text
    }()
    
    fileprivate let rarityLabel: UILabel = {
        let text = UILabel()
        text.text = "Rarity"
        text.textColor = .darkText
        text.translatesAutoresizingMaskIntoConstraints = false
        text.textAlignment = .left
        text.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        return text
    }()
    
    let rarityLevelLabel: UILabel = {
        let text = UILabel()
        text.text = "4 stars"
        text.textColor = .darkText
        text.translatesAutoresizingMaskIntoConstraints = false
        text.textAlignment = .right
        text.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        return text
    }()
    
    fileprivate let descriptionLabel: UILabel = {
        let text = UILabel()
        text.text = "Description"
        text.textColor = .darkText
        text.translatesAutoresizingMaskIntoConstraints = false
        text.textAlignment = .left
        text.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        return text
    }()
    
    let descriptionTextLabel: UILabel = {
        let text = UILabel()
        text.text = "Some text"
        text.textColor = .darkText
        text.translatesAutoresizingMaskIntoConstraints = false
        text.textAlignment = .right
        text.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        return text
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.descriptionFields = [visionTypeLabel]
        
        safeArea = layoutMarginsGuide
    
        backgroundColor = .background
        addSubview(iconView)
        addSubview(icon)
        addSubview(descriptionView)
        addSubview(nameLabel)
//        addSubview(categorySelected)
        addSubview(visionLabel)
        addSubview(visionTypeLabel)
        addSubview(weaponLabel)
        addSubview(weaponTypeLabel)
        addSubview(rarityLabel)
        addSubview(rarityLevelLabel)
        addSubview(descriptionLabel)
        //Constraints da Descrição
        
        NSLayoutConstraint.activate([iconView.widthAnchor.constraint(equalToConstant: 240),
                                     iconView.heightAnchor.constraint(equalToConstant: 240),
                                     iconView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 30),
                                     iconView.centerXAnchor.constraint(equalTo: centerXAnchor)])
        
        NSLayoutConstraint.activate([icon.centerYAnchor.constraint(equalTo: iconView.centerYAnchor),
                                     icon.centerXAnchor.constraint(equalTo: iconView.centerXAnchor),
                                     icon.widthAnchor.constraint(equalTo: iconView.widthAnchor, multiplier: 0.75),
                                     icon.heightAnchor.constraint(equalTo: iconView.heightAnchor, multiplier: 0.75)])
        
        NSLayoutConstraint.activate([descriptionView.topAnchor.constraint(equalTo: iconView.bottomAnchor, constant: 26),
                                     descriptionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
                                     descriptionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
                                     descriptionView.heightAnchor.constraint(equalTo: safeArea.heightAnchor, multiplier: 0.4)])
        
        NSLayoutConstraint.activate([nameLabel.topAnchor.constraint(equalTo: descriptionView.topAnchor, constant: 12),
                                     nameLabel.centerXAnchor.constraint(equalTo: descriptionView.centerXAnchor)])
        
        NSLayoutConstraint.activate([visionLabel.bottomAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 36),
                                     visionLabel.leadingAnchor.constraint(equalTo: descriptionView.leadingAnchor, constant: 16)])
        
        NSLayoutConstraint.activate([visionTypeLabel.bottomAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 36),
                                     visionTypeLabel.trailingAnchor.constraint(equalTo: descriptionView.trailingAnchor, constant: -16)])
        
        NSLayoutConstraint.activate([weaponLabel.bottomAnchor.constraint(equalTo: visionLabel.bottomAnchor, constant: 36),
                                     weaponLabel.leadingAnchor.constraint(equalTo: descriptionView.leadingAnchor, constant: 16)])
        
        NSLayoutConstraint.activate([weaponTypeLabel.bottomAnchor.constraint(equalTo: visionTypeLabel.bottomAnchor, constant: 36),
                                     weaponTypeLabel.trailingAnchor.constraint(equalTo: descriptionView.trailingAnchor, constant: -16)])
        
        NSLayoutConstraint.activate([rarityLabel.bottomAnchor.constraint(equalTo: weaponLabel.bottomAnchor, constant: 36),
                                     rarityLabel.leadingAnchor.constraint(equalTo: descriptionView.leadingAnchor, constant: 16)])
        
        NSLayoutConstraint.activate([rarityLevelLabel.bottomAnchor.constraint(equalTo: weaponTypeLabel.bottomAnchor, constant: 36),
                                     rarityLevelLabel.trailingAnchor.constraint(equalTo: descriptionView.trailingAnchor, constant: -16)])
        
        NSLayoutConstraint.activate([descriptionLabel.bottomAnchor.constraint(equalTo: rarityLabel.bottomAnchor, constant: 36),
                                     descriptionLabel.leadingAnchor.constraint(equalTo: descriptionView.leadingAnchor, constant: 16)])
    
                
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
