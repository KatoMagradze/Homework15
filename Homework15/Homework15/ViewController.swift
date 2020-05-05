//
//  ViewController.swift
//  Homework15
//
//  Created by Kato on 5/5/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class ImageClass {
    
    enum enCategory : String {
        case cats = "Cats"
        case dogs = "Dogs"
        case flowers = "Flowers"
    }
    
    var category : enCategory
    var image : UIImage
    
    init(category: enCategory, image: UIImage) {
        self.category = category
        self.image = image
    }
}

class ViewController: UIViewController, UIGestureRecognizerDelegate {
    
    var selectedImage = 0
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.delegate = self
        cv.dataSource = self
        
        //cv.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        cv.register(UINib(nibName: "DemoCell", bundle: Bundle.main), forCellWithReuseIdentifier: "demo_cell")
        cv.backgroundColor = .white
        
        return cv
    }()
    
    
    
    let largeImage: UIImageView = {
        let large = UIImageView()
        large.translatesAutoresizingMaskIntoConstraints = false
        large.contentMode = .scaleAspectFill
        large.clipsToBounds = true
        
        
        large.backgroundColor = .white
        
        return large
    }()
    
    var images = [ImageClass]()
    var istapped = 0
    
    
    override func loadView() {
        super.loadView()
        view.addSubview(collectionView)
        //view.addSubview(image)
        view.addSubview(largeImage)
        
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 500),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            //collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 100),
            collectionView.heightAnchor.constraint(equalToConstant: 150)
        ])
        
        NSLayoutConstraint.activate([
            largeImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            largeImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80),
            largeImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -80),
            //collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 100),
            largeImage.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        
        self.images.append(ImageClass(category: ImageClass.enCategory.cats, image: (UIImage(named: "cat1")!)))
        self.images.append(ImageClass(category: ImageClass.enCategory.cats, image: (UIImage(named: "cat2")!)))
        self.images.append(ImageClass(category: ImageClass.enCategory.cats, image: (UIImage(named: "cat3")!)))
        self.images.append(ImageClass(category: ImageClass.enCategory.cats, image: (UIImage(named: "cat4")!)))
        
        self.images.append(ImageClass(category: ImageClass.enCategory.dogs, image: (UIImage(named: "dog1")!)))
        self.images.append(ImageClass(category: ImageClass.enCategory.dogs, image: (UIImage(named: "dog2")!)))
        self.images.append(ImageClass(category: ImageClass.enCategory.dogs, image: (UIImage(named: "dog3")!)))

        self.images.append(ImageClass(category: ImageClass.enCategory.flowers, image: (UIImage(named: "flowers1")!)))
        self.images.append(ImageClass(category: ImageClass.enCategory.flowers, image: (UIImage(named: "flowers2")!)))
        self.images.append(ImageClass(category: ImageClass.enCategory.flowers, image: (UIImage(named: "flowers3")!)))
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let viewtapped = UITapGestureRecognizer(target: self, action: #selector(self.tap(_:)))
        viewtapped.delegate = self
        largeImage.isUserInteractionEnabled = true
        largeImage.addGestureRecognizer(viewtapped)
        
    }
    
    @objc func tap(_ gestureRecognizer: UITapGestureRecognizer) {
        largeImage.alpha = 0.5
        
        print("image tapped")
        var filteredImages = [ImageClass]()
        
        for i in 0..<images.count {
            if images[i].category == images[self.selectedImage].category
            {
                filteredImages.append(images[i])
            }
        }
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let secondViewController = storyboard.instantiateViewController(withIdentifier: "second_vc")
        if let destViewController = secondViewController as? SecondViewController
        {
            destViewController.filteredImages = images
        }
        
        present(secondViewController, animated: true, completion: nil)
        
        
    }


}

extension ViewController: UICollectionViewDelegate {
    
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "demo_cell", for: indexPath) as! DemoCell
        
        cell.cellimage.image = images[indexPath.row].image

        
        
        
                
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
        self.selectedImage = indexPath.row
        switch indexPath.row {
            
            case 0:
                largeImage.image = images[indexPath.row].image
            case 1:
                largeImage.image = images[indexPath.row].image
            case 2:
                largeImage.image = images[indexPath.row].image
            case 3:
                largeImage.image = images[indexPath.row].image
            case 4:
                largeImage.image = images[indexPath.row].image
            case 5:
                largeImage.image = images[indexPath.row].image
            case 6:
                largeImage.image = images[indexPath.row].image
            case 7:
                largeImage.image = images[indexPath.row].image
            case 8:
                largeImage.image = images[indexPath.row].image
            case 9:
                largeImage.image = images[indexPath.row].image
            default:
                print("")
            
        }
        
    }
    
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let itemWith = collectionView.frame.width / 2
        
        return CGSize(width: itemWith - 20 - 20, height: 150)
    }
    
    
}




