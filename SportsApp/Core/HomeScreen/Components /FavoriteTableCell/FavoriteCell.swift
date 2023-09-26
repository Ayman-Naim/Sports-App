//
//  FavoriteCell.swift
//  SportsApp
//
//  Created by Shimaa Elcc on 27.9.2023.
//

import UIKit

class FavoriteCell: UITableViewCell {

    @IBOutlet weak var FavoriteImage: UIImageView!
    
    @IBOutlet weak var FavoriteLabel: UILabel!
    
    @IBOutlet weak var YoutubeButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
