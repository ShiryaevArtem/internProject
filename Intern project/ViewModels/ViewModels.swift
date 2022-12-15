//
//  ViewModels.swift
//  Intern project
//
//  Created by Artem on 14.12.2022.
//

import Foundation
import UIKit
class ViewModels{
 
    //MARK: - получение данных через API
    func request(completion: @escaping (Result<[Images], Error>) -> Void) {
        let urlString="https://jsonplaceholder.typicode.com/photos"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                if let error = error {
                    completion(.failure(error))
                    return
                }
                guard let data = data else { return }
                do {
                    let images = try JSONDecoder().decode([Images].self, from: data)
                    completion( .success(images))
                    
                }catch let jsonError {
                    print("Failed to decode JSON", jsonError)
                }
                
            }
        }.resume()
    }
     //MARK: - навигация
    func generateNavigationController(rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
        let navigationVC = UINavigationController(rootViewController: rootViewController)
        navigationVC.tabBarItem.title = title
        navigationVC.tabBarItem.image = image
        return navigationVC
    }
    
    //MARK: - функция кнопки поделиться
    
    func share(url: String) {
            guard let urlShare = URL(string: url) else { return }
            let activityVC = UIActivityViewController(activityItems: [urlShare], applicationActivities: nil)
               UIApplication.shared.windows.first?.rootViewController?.present(activityVC, animated: true, completion: nil)
        }
    
    
    
}

