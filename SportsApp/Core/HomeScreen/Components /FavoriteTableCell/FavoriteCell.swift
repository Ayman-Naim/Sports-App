//
//  FavoriteCell.swift
//  SportsApp
//
//  Created by Heba Elcc on 27.9.2023.
//

import UIKit
import Kingfisher

class FavoriteCell: UITableViewCell {

    @IBOutlet weak var FavoriteImage: UIImageView!
    
    @IBOutlet weak var FavoriteLabel: UILabel!
    
    @IBOutlet weak var YoutubeButton: UIButton!
    var youtubeURL: String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        //Editing Image
        FavoriteImage.layer.borderWidth = 1
        FavoriteImage.layer.masksToBounds = false
        FavoriteImage.layer.borderColor = UIColor.white.cgColor
        FavoriteImage.layer.cornerRadius = FavoriteImage.frame.height/2
        FavoriteImage.clipsToBounds = true
        
        YoutubeButton.addTarget(self, action: #selector(openYoutube), for: .touchUpInside)

        
        
    }
    
    @objc func openYoutube() {

        if let youtubeURLString = youtubeURL, let youtubeURL = URL(string: youtubeURLString) {
            UIApplication.shared.open(youtubeURL, options: [:], completionHandler: nil)
        } else {
            if let defaultYoutubeURL = URL(string: "https://www.youtube.com/watch?v=SCgH-08AoUo") {
                UIApplication.shared.open(defaultYoutubeURL, options: [:], completionHandler: nil)
            } else {
                print("Default YouTube URL is not valid")
            }
        }
    }


    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
