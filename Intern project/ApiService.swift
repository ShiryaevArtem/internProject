//
//  ApiService.swift
//  Intern project
//
//  Created by Artem on 14.12.2022.
//

import Foundation
import UIKit
struct Post:Codable,Identifiable{
    let id = UUID()
    var title: String
    var url: String
    var thumbnailUrl: String
}
func getPhoto(completion: @escaping ([Post]) -> ()) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/photos")
            else { return }
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let posts = try! JSONDecoder().decode([Post].self, from: data!)
            DispatchQueue.main.async {
                completion(posts)
                print(posts)
            }
        }
        .resume()
}
