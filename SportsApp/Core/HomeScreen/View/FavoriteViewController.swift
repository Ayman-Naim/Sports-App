//
//  FavoriteViewController.swift
//  SportsApp
//
//  Created by Heba Elcc on 27.9.2023.
//

import UIKit
import CoreData

class FavoriteViewController : UIViewController, UITableViewDelegate , UITableViewDataSource {
    var leagues: [Leaguess] = []

    @IBOutlet weak var FavoriteTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        FavoriteTableView.delegate = self
        FavoriteTableView.dataSource = self
        
        FavoriteTableView.register(UINib(nibName: "FavoriteCell", bundle: nil), forCellReuseIdentifier: "FavoriteCell")
        self.navigationItem.setHidesBackButton(true, animated: true)
        fetchData()


        // Do any additional setup after loading the view.
    }
    
    //MARK- TableView Functions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return leagues.count    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = FavoriteTableView.dequeueReusableCell(withIdentifier: "FavoriteCell") as! FavoriteCell
        let league = leagues[indexPath.row]
        cell.FavoriteLabel.text = league.league_name

        cell.favoriteButton.isHidden = true
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    func fetchData() {
           let appDelegate = UIApplication.shared.delegate as! AppDelegate
           let context = appDelegate.persistentContainer.viewContext
           let fetchRequest: NSFetchRequest<Leaguess> = Leaguess.fetchRequest()

           do {
               leagues = try context.fetch(fetchRequest)
               FavoriteTableView.reloadData() // Reload data after fetching
           } catch {
               print("Error fetching data: \(error.localizedDescription)")
           }
       }
   }
