//
//  AllLeagues.swift
//  SportsApp
//
//  Created by ayman on 27/09/2023.
//

import UIKit

class AllLeagues: UIViewController , UITableViewDelegate , UITableViewDataSource {
    
    @IBOutlet weak var LeaguesTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //LeaguesTable.delegate = self
        //LeaguesTable.dataSource = self
       
        LeaguesTable.register(UINib(nibName: "FavoriteCell", bundle: nil), forCellReuseIdentifier: "FavoriteCell")
        let Back = UIBarButtonItem( image: UIImage(systemName: "arrowshape.turn.up.backward.circle"), style: .plain, target: self, action: #selector((Back)))
        Back.tintColor = UIColor.black
        navigationItem.leftBarButtonItem = Back
    

        // Do any additional setup after loading the view.
    }
    
    
     @IBAction func Back(){
        self.navigationController?.popViewController(animated:true)
    }
    
    //MARK- TableView Functions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = LeaguesTable.dequeueReusableCell(withIdentifier: "FavoriteCell") as! FavoriteCell
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    
    
    
}



