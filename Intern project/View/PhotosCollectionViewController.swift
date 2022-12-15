//
//  PhotosCollectionViewController.swift
//  Intern project
//
//  Created by Artem on 15.12.2022.
//

import Foundation
import UIKit
class PhotosCollectionViewController: UICollectionViewController {
    private lazy var addBarButtonItem: UIBarButtonItem = {
        return UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addBarButtonTapped))
    }()
    private lazy var actionBarButtonItem: UIBarButtonItem = {
        return UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(actionBarButtonTapped))
    }()
   
    
    var viewModelsMain = ViewModels()
    var images: [Images] = []
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModels.request { (result) in
            switch result {
            case .success(let images):
                self.images = images
                print("vse otlichno")
                
            case .failure(let error):
                print("This error: " , error)
            }
        }
        collectionView.backgroundColor = .orange
        setupNavigationBar()
        setupCollectionView()
        
        
        
        
        
    }
    
    //MARK:- NavigationButtons Action
    @objc private func addBarButtonTapped(){
        print(#function)
    }
    @objc private func actionBarButtonTapped(){
        print(#function)
    }
    
    //MARK:- Setup UI Elements
    
    private func setupCollectionView(){
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "CellId")
        collectionView.register(PhotosCell.self, forCellWithReuseIdentifier: PhotosCell.reuseId)
    }
    
    private func setupNavigationBar(){
        
        let titleLabel=UILabel()
        titleLabel.text = "Photos"
        titleLabel.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        titleLabel.textColor = .gray
        navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: titleLabel)
        navigationItem.rightBarButtonItems = [actionBarButtonItem,addBarButtonItem]
    }
    
    //MARK:- UICollectionViewDataSource, UICollectionViewDelegate
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCell.reuseId, for: indexPath) as! PhotosCell
        let unsplashPhoto = images.url[indexPath.item]
        cell.unspalshPhoto = unsplashPhoto
        cell.backgroundColor = .red
        return cell
    }
    
}
extension PhotosCollectionViewController{
    
}
