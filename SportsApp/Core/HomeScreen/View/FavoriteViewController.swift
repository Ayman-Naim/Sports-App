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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchData()
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
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the league from Core Data
            let leagueToDelete = leagues[indexPath.row]
            deleteLeagueFromCoreData(league: leagueToDelete)

            // Remove the league from the data source
            leagues.remove(at: indexPath.row)

            // Delete the row from the table view
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let LeageDetailVc =  storyboard?.instantiateViewController(withIdentifier: "LeaguesCollectionViewController") as? LeaguesCollectionViewController{
            LeageDetailVc.viewModel = LeagesDetailsViewModel(id: Int(leagues[indexPath.item].league_key) , sport: leagues[indexPath.item].league_sportName ?? "")
            self.navigationController?.pushViewController(LeageDetailVc, animated: true)
        }
        else{
            print("Failed to instantiate 'AllLeagues' view controller")
        }
        
    }
    // Function to delete a league from Core Data
    private func deleteLeagueFromCoreData(league: Leaguess) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext

        context.delete(league)

        do {
            try context.save()
            print("League deleted successfully from Core Data.")
        } catch {
            print("Error deleting league: \(error.localizedDescription)")
        }
    }

    // MARK: - Fetch Data Function
    func fetchData() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<Leaguess> = Leaguess.fetchRequest()

        do {
            leagues = try context.fetch(fetchRequest)

            // Reload the table view data on the main thread
            DispatchQueue.main.async {
                self.FavoriteTableView.reloadData()
            }
        } catch {
            print("Error fetching data: \(error.localizedDescription)")
        }
    }
    
    
}

 
