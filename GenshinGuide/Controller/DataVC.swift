//
//  DataVC.swift
//  GenshinGuide
//
//  Created by Lucas Fernandes on 10/02/21.
//

import UIKit

class DataVC: UIViewController {

    let tableView = UITableView()
    var safeArea: UILayoutGuide!
    var dataList = ["Characters", "Weapons", "Artifacts", "Domains", "Elements"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        safeArea = view.layoutMarginsGuide
        setupTableView()
        
    }
    
    // MARK: - Setup View
    
    func setupTableView() {
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellid")
        
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
}

// MARK: - TableView Data Source

extension DataVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellid", for: indexPath)
        let dataType = dataList[indexPath.row]
        
        cell.textLabel?.text = dataType
        return cell
        
    }
}

extension DataVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let amiibo = self.amiiboList[indexPath.row]
//        let amiiboDetailVC = AmiiboDetailVC()
//
//        amiiboDetailVC.amiibo = amiibo
//        self.present(amiiboDetailVC, animated: true)
//
        if(indexPath.row == 1) {
            let nextVC = CharVC()
            self.navigationController?.pushViewController(nextVC, animated: true)
        }
//        else if(indexPath.row == 1) {
//            let nextVC = DownloadedVC()
//            self.navigationController?.pushViewController(nextVC, animated: true)
//        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

