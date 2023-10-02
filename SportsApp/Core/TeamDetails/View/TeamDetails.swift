//
//  TeamDetails.swift
//  SportsApp
//
//  Created by ayman on 03/10/2023.
//

import UIKit

class TeamDetails: UIViewController {
  

    @IBOutlet weak var TeamMeberCollection: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.TeamMeberCollection.delegate = self
        self.TeamMeberCollection.dataSource = self
        TeamMeberCollection.register(UINib(nibName: "TeamMembersCell", bundle: nil), forCellWithReuseIdentifier: "TeamMembersCell")
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension TeamDetails:UICollectionViewDelegate,UICollectionViewDataSource {
    // MARK: - collection Data Sore
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell  = TeamMeberCollection.dequeueReusableCell(withReuseIdentifier: "TeamMembersCell", for: indexPath) as? TeamMembersCell
        cell?.TeamMemberImage.image = UIImage(named: "placeHolder")
       // cell?.MemberName.text = "Ayman"
        return cell!
    }
    
}
