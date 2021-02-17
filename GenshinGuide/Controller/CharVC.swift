//
//  CharVC.swift
//  GenshinGuide
//
//  Created by Lucas Fernandes on 10/02/21.
//

import UIKit

class CharVC: UIViewController {

    let tableView = UITableView()
    var safeArea: UILayoutGuide!
//    var characterList = [Character]()
    var characterList = [String]()
    var weaponList = [Weapon]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        safeArea = view.layoutMarginsGuide
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CharCell.self, forCellReuseIdentifier: "cellid")
        setupTableView()
        
        let anonymousFunction = { (charNames: [String]) in
            DispatchQueue.main.async {
                self.characterList = charNames
                self.tableView.reloadData()
            }
        }
        
        GenshinAPI.shared.getData(completion: {charNames in
                                    self.characterList = charNames})
        
//        GenshinAPI.shared.getData(onCompletion: anonymousFunction)
        GenshinAPI.shared.getData(completion: anonymousFunction)

    }
    
    func setupTableView() {
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }

}

extension CharVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characterList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellid", for: indexPath)
        let character = characterList[indexPath.row]
        
        guard let charCell = cell as? CharCell else {
            return cell
        }
        
//        cell.textLabel?.text = character
        charCell.nameLabel.text = character.capitalizingFirstLetter()
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.pushViewController(DetailsVC(), animated: true)
        print("Clicou na tableview")
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 50
//    }
}

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

//    mutating func capitalizeFirstLetter() {
//        self = self.capitalizingFirstLetter()
//    }
}
