//
//  AllLeagues.swift
//  SportsApp
//
//  Created by ayman on 27/09/2023.
//

import UIKit
import Kingfisher


class AllLeagues: UIViewController , UITableViewDelegate , UITableViewDataSource {
    var LeagesResult : [Leagues]?
    @IBOutlet weak var LeaguesTable: UITableView!
    
    var viewModel: LeagesViewModel!
    
    
    convenience init(viewModel: LeagesViewModel) {
        self.init()
        self.viewModel = viewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        LeagesResult = [Leagues]()
        viewModel.fetch { [weak self] leages in
            self?.LeagesResult = leages
            self?.LeaguesTable.reloadData()
        }
       
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
        print("Debug\(self.LeagesResult?.count)")
        return self.LeagesResult?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = LeaguesTable.dequeueReusableCell(withIdentifier: "FavoriteCell") as! FavoriteCell
        
        cell.FavoriteLabel.text = self.LeagesResult?[indexPath.row].league_name
        //cell.FavoriteImage
        
        if let imageUrl = URL(string: self.LeagesResult?[indexPath.row].league_logo ?? "") {
            cell.FavoriteImage.kf.setImage(with: imageUrl)
        }
//        cell.youtubeURL = self.LeagesResult?[indexPath.row].youtubeURL

        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    
    
    
}



