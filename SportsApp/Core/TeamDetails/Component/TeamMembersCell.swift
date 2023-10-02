//
//  TeamMembersCell.swift
//  SportsApp
//
//  Created by ayman on 03/10/2023.
//

import UIKit

class TeamMembersCell: UICollectionViewCell {

    @IBOutlet weak var MemberName: UILabel!
    @IBOutlet weak var TeamMemberImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
        TeamMemberImage.layer.borderWidth = 1
        TeamMemberImage.layer.masksToBounds = false
       TeamMemberImage.layer.borderColor = UIColor.white.cgColor
        TeamMemberImage.layer.cornerRadius = TeamMemberImage.frame.height/2
        TeamMemberImage.clipsToBounds = true
        
    }

}
