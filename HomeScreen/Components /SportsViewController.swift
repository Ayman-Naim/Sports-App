//
//  SportsViewController.swift
//  SportsApp
//
//  Created by ayman on 26/09/2023.
//

import UIKit

class SportsViewController: UIViewController  {
    var twoCellsLAyout = false
    @IBOutlet weak var SportsCollectionView: UICollectionView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SportsCollectionView.delegate = self
        SportsCollectionView.dataSource = self
        
        
        
        SportsCollectionView.register(UINib(nibName: "SportsCell", bundle: nil), forCellWithReuseIdentifier: "SportsCell")
     
        let margin: CGFloat = 25
        guard let flowLayout = SportsCollectionView.collectionViewLayout as? UICollectionViewFlowLayout else { return }

        flowLayout.minimumInteritemSpacing = margin
            flowLayout.minimumLineSpacing = margin
            flowLayout.sectionInset = UIEdgeInsets(top: margin, left: margin, bottom: margin, right: margin)
       
      
    }
    
   
     @IBAction func LayoutClicked(_ sender: Any) {
      
         if twoCellsLAyout{
             twoCellsLAyout = false
         }
         else {
             twoCellsLAyout = true
         }
    
        SportsCollectionView.reloadData()
    }
    
}

class CustomFlowLayout: UICollectionViewFlowLayout {

    override func prepare() {

        super.prepare()

        if let collectionView = collectionView {

            let availableWidth = collectionView.bounds.width - sectionInset.left - sectionInset.right

            

            // You can adjust this value to control the spacing between cells

            let minimumSpacing: CGFloat = 4.0

            

            let itemWidth = (availableWidth - minimumSpacing) * 0.2 // Number of items per row

            itemSize = CGSize(width: itemWidth, height: itemWidth) // Set both width and height to make it square

            minimumInteritemSpacing = minimumSpacing

        }

    }

}

extension SportsViewController :UICollectionViewDelegate ,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell =  SportsCollectionView.dequeueReusableCell(withReuseIdentifier: "SportsCell", for: indexPath) as! SportsCell
        //cell.backgroundColor = .systemGray3
         cell.CellImage.contentMode = .scaleAspectFill
         cell.CellImage.clipsToBounds = true
        switch indexPath.row{
        case 0 :
            cell.CellLabel.text  = "Football"
              cell.CellImage.image =  UIImage(named: "2")
        case 1 :
            cell.CellLabel.text  = "BasketBall"
              cell.CellImage.image =  UIImage(named: "2")
        case 2 :
            cell.CellLabel.text  = "Cricket"
              cell.CellImage.image =  UIImage(named: "2")
        default:
            cell.CellLabel.text  = "Tennis"
              cell.CellImage.image =  UIImage(named: "2")
        }
        
        
      
  
    
       
        
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if twoCellsLAyout{
            let noOfCellsInRow = 2  //number of column you want
               let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
               let totalSpace = flowLayout.sectionInset.left
            + flowLayout.sectionInset.right
                   + (flowLayout.minimumInteritemSpacing * CGFloat(noOfCellsInRow - 1))

               let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(noOfCellsInRow))
            return CGSize(width: size, height: size)
        }
        else{
            let noOfCellsInRow = 1  //number of column you want
               let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
               let totalSpace = flowLayout.sectionInset.left
            + flowLayout.sectionInset.right
                   + (flowLayout.minimumInteritemSpacing * CGFloat(noOfCellsInRow - 1))

               let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(noOfCellsInRow))
            return CGSize(width: size, height: Int(Double(size)/2.8))
        }
            
        
        
    }
    
 
    
    
}
