//
//  GenshinAPI.swift
//  GenshinGuide
//
//  Created by Lucas Fernandes on 10/02/21.
//

import Foundation

final class GenshinAPI {
    
    static let shared = GenshinAPI()
    
//    func getData() {
//        let urlString = "https://api.genshin.dev/characters"
//        let url = URL(string: urlString)!
//
//        let task = URLSession.shared.dataTask(with: url) { (data, resp, error) in
//
//            guard let data = data else {
//                print("Data was nil")
//                return
//            }
//
////            guard let charData = try? JSONDecoder().decode(CharList.self, from: data) else {
////                print("Json could't decode")
////                return
////            }
//
//            do {
//                let charData = try JSONDecoder().decode([Character].self, from: data)
//                print(charData)
//            } catch {
//                print(error)
//            }
//
////            print(charData.characters)
////            onCompletion(genshinList.character)
//        }
//        task.resume()
//    }
    
    func getData(completion: @escaping ([String]) -> Void) {
        let url = URL(string: "https://api.genshin.dev/characters/")!
        var urlRequest = URLRequest(url: url)

        urlRequest.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: urlRequest, completionHandler: { data, response, error in

            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: []) as! [String]
                    completion(json)
                    print(type(of: json))
                } catch {
                    print(error)
                }
                
            }
        })
        task.resume()

    }
}

struct GenshinTypes: Codable {
    let artifacts: String
    let characters: String
    let domains: String
    let elements: String
    let materials: String
    let nations: String
    let weapons: String
}

struct CharList: Codable {
    let characters: [Character]
}

struct Character: Codable {
    let name: String
    let description: String
    let vision: String
    let weaponType: String
    let rarity: Int
}

struct WeaponList: Codable {
    let weapon: Weapon
}

struct Weapon: Codable {
    let name: String
}

struct Artifact: Codable {
    let setName: String
    let buff: String
}

