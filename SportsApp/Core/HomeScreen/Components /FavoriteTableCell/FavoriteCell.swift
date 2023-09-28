//
//  FavoriteCell.swift
//  SportsApp
//
//  Created by Heba Elcc on 27.9.2023.
//

import UIKit

class FavoriteCell: UITableViewCell {

    @IBOutlet weak var FavoriteImage: UIImageView!
    
    @IBOutlet weak var FavoriteLabel: UILabel!
    
    @IBOutlet weak var YoutubeButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        //Editing Image
        FavoriteImage.layer.borderWidth = 1
        FavoriteImage.layer.masksToBounds = false
        FavoriteImage.layer.borderColor = UIColor.black.cgColor
        FavoriteImage.layer.cornerRadius = FavoriteImage.frame.height/2
        FavoriteImage.clipsToBounds = true
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
