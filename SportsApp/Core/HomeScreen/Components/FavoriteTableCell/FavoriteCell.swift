//
//  FavoriteCell.swift
//  SportsApp
//
//  Created by Heba Elcc on 27.9.2023.
//

import UIKit
import Kingfisher
import CoreData

class FavoriteCell: UITableViewCell {
    @IBOutlet weak var FavoriteImage: UIImageView!
    @IBOutlet weak var FavoriteLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    var sportName: String?
    var leagueKey: Int?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //Editing Image
        FavoriteImage.layer.borderWidth = 1
        FavoriteImage.layer.masksToBounds = false
        FavoriteImage.layer.borderColor = UIColor.white.cgColor
        FavoriteImage.layer.cornerRadius = FavoriteImage.frame.height/2
        FavoriteImage.clipsToBounds = true
    }

    func configure(sportName: String?, leagueKey: Int?) {
        self.sportName = sportName
        self.leagueKey = leagueKey
    }
    
    @IBAction func favoriteButtonPressed(_ sender: Any) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
               print("Error: Unable to access AppDelegate")
               return
           }

           let context = appDelegate.persistentContainer.viewContext

           guard let entity = NSEntityDescription.entity(forEntityName: "Leaguess", in: context) else {
               print("Error: Entity 'Leaguess' not found in Core Data model.")
               return
           }

           guard let favoriteLabel = FavoriteLabel.text, !favoriteLabel.isEmpty else {
               print("Error: Please enter a valid league name.")
               return
           }
//
//           guard let favoriteImageURLString = FavoriteImage else {
//               print("Error: Unable to retrieve the image URL.")
//               return
//           }

           // Check if the league with the same name already exists in Core Data
           let fetchRequest: NSFetchRequest<Leaguess> = Leaguess.fetchRequest()
           fetchRequest.predicate = NSPredicate(format: "league_name == %@", favoriteLabel)

           do {
               let existingLeagues = try context.fetch(fetchRequest)
               if let existingLeague = existingLeagues.first {
                   print("League already exists with the name: \(existingLeague.league_name ?? "")")
//                   FavoriteImage.image = UIImage(named: "heart.fill")
                   
                   // Show an alert that the league already exists
                   let alertController = UIAlertController(title: "League Exists", message: "A league with the same name already exists.", preferredStyle: .alert)
                   let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                   alertController.addAction(okAction)
                   UIApplication.shared.keyWindow?.rootViewController?.present(alertController, animated: true, completion: nil)
                   
                   return
               }
           } catch {
               print("Error fetching existing leagues: \(error.localizedDescription)")
           }

           let newLeague = Leaguess(entity: entity, insertInto: context)

           newLeague.league_name = favoriteLabel
           newLeague.league_key = Int32(leagueKey ?? 0)

        // newLeague.league_logo = favoriteImageURLString
            newLeague.league_sportName = sportName
           do {
               try context.save()
               print("League saved successfully.")

               // Show an alert to indicate success
               let alertController = UIAlertController(title: "Success", message: "Data is successfully added.", preferredStyle: .alert)
               let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
               alertController.addAction(okAction)
               UIApplication.shared.keyWindow?.rootViewController?.present(alertController, animated: true, completion: nil)

           } catch {
               print("Error saving: \(error.localizedDescription)")
           }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
  
    
}
