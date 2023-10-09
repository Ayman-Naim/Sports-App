//
//  IncomingCell.swift
//  ProjectCollectionn
//
//  Created by Heba Elcc on 28.9.2023.
//

import UIKit

class IncomingCell: UICollectionViewCell {

    @IBOutlet weak var BackgroundImage: UIImageView!
    
    @IBOutlet weak var matchTime: UILabel!
    
    @IBOutlet weak var matchDate: UILabel!
    
    @IBOutlet weak var HomeTeamLogo:UIImageView!
    
    @IBOutlet weak var LatestDate: UILabel!
    @IBOutlet weak var LatestTime: UILabel!
    @IBOutlet weak var HomeTeamName: UILabel!
    
    @IBOutlet weak var AwayTeamLogo: UIImageView!
    @IBOutlet weak var awayTeamName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
//        
//        BackgroundImage.layer.borderWidth = 1
//        BackgroundImage.layer.masksToBounds = false
//        BackgroundImage.layer.borderColor = UIColor.black.cgColor
//        BackgroundImage.layer.cornerRadius = BackgroundImage.frame.height/2
//        BackgroundImage.clipsToBounds = true
        BackgroundImage.backgroundColor = .black
        

    }

}
