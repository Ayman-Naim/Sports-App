//
//  SportsViewController.swift
//  SportsApp
//
//  Created by ayman on 26/09/2023.
//

import UIKit

class SportsViewController: UIViewController  {

    @IBOutlet weak var SportsCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        SportsCollectionView.delegate = self
        SportsCollectionView.dataSource = self
        SportsCollectionView.register(UINib(nibName: "SportsCell", bundle: nil), forCellWithReuseIdentifier: "SportsCell")
        // Do any additional setup after loading the view.
    }
    

    

}



extension SportsViewController :UICollectionViewDelegate ,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell =  SportsCollectionView.dequeueReusableCell(withReuseIdentifier: "SportsCell", for: indexPath) as! SportsCell
        
        cell.CellLabel.text  = "El Team el gammmed "
        cell.CellImage.image =  UIImage(systemName: "heart.fill")
        
        
        return cell
    }
    
    
    
    
    
}
