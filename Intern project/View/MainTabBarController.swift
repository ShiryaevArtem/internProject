//
//  SecondViewController.swift
//  Intern project
//
//  Created by Artem on 15.12.2022.
//

import Foundation
import UIKit
class MainTabBarController: UITabBarController {ß
    
    var viewModels = ViewModels()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.backgroundColor = .gray
        let photosVC = PhotosCollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())
        
        viewControllers = [
            viewModels.generateNavigationController(rootViewController: photosVC, title: "photos", image: #imageLiteral(resourceName: "image")),
            viewModels.generateNavigationController(rootViewController: ViewController(), title: "favorites", image: #imageLiteral(resourceName: "image"))
        ]
       
    }
    func seeImage(rootViewController: UIViewController) -> UIViewController {
        let navigationVC = UINavigationController(rootViewController: rootViewController)
        return navigationVC
    }
    
}
