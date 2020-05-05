//
//  SecondViewController.swift
//  Homework15
//
//  Created by Kato on 5/5/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.delegate = self
        cv.dataSource = self
        
        //cv.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        cv.register(UINib(nibName: "SecondDemoCell", bundle: Bundle.main), forCellWithReuseIdentifier: "second_demo_cell")
        cv.backgroundColor = .white
        
        return cv
    }()
    
    var filteredImages = [ImageClass]()

    
    override func loadView() {
        super.loadView()
        
        view.addSubview(self.collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 100),
            //collectionView.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

}

extension SecondViewController: UICollectionViewDelegate {
    
}

extension SecondViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.filteredImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "second_demo_cell", for: indexPath) as! SecondDemoCell
        
        //cell.backgroundColor = .red
        
        cell.secondImageView.image = self.filteredImages[indexPath.row].image
        
        return cell
    }
    
    
}

extension SecondViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
        let itemWith = collectionView.frame.width / 2
    
        return CGSize(width: itemWith - 20 - 20, height: 150)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 30, left: 20, bottom: 0, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
}
