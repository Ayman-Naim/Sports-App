//
//  LeaguesCollectionViewController.swift
//  ProjectCollectionn
//
//  Created by Heba Elcc on 27.9.2023.
//
//
import UIKit


class LeaguesCollectionViewController: UICollectionViewController , UICollectionViewDelegateFlowLayout {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(UINib(nibName: "TeamsCell", bundle: nil), forCellWithReuseIdentifier: "TeamsCell")
        collectionView.register(UINib(nibName: "IncomingCell", bundle: nil), forCellWithReuseIdentifier: "IncomingCell")
        collectionView.register(UINib(nibName: "LatestCell", bundle: nil), forCellWithReuseIdentifier: "LatestCell")
        
        
        let layout = UICollectionViewCompositionalLayout { sectionIndex, enviroment in
            switch sectionIndex {
            case 0 :
                return self.UpcomingEvents()
            case 1 :
                return self.LatestEvents()
            default:
                return self.TeamsSection()
                
            }
        }
        collectionView.setCollectionViewLayout(layout, animated: true)
        
        
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using [segue destinationViewController].
     // Pass the selected object to the new view controller.
     }
     */
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 3
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 8
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "IncomingCell", for: indexPath)
            return cell
            
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LatestCell", for: indexPath)
            return cell
            
        case 2:
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TeamsCell", for: indexPath) as! TeamsCell
            return cell
            
        default:
            return UICollectionViewCell()
        }
    }
    
    //MARK: Header Functions
    func supplementtryHeader()->NSCollectionLayoutBoundarySupplementaryItem{
        
        .init(layoutSize: .init(widthDimension:.fractionalWidth(1), heightDimension: .estimated(50)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .top )
        
    }
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader{
            let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath) as! SectionHeader
            
            switch indexPath.section {
            case 0 :
                sectionHeader.HeaderTitle?.text = "Upcoming Events"
                return sectionHeader
                
            case 1 :
                sectionHeader.HeaderTitle?.text = "latest Events"
                return sectionHeader
                
            case 2 :
                sectionHeader.HeaderTitle?.text = "Teams "
                return sectionHeader
                
            default :
                sectionHeader.HeaderTitle?.text = "Sports"
                return sectionHeader
            }
        }
        return UICollectionViewCell()
    }
    
    //MARK: Functions For Animation
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
    //MARK: 3 Functions for 3 sections (Upcoming Events - Latest Events - Teams)
    
    func UpcomingEvents()-> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1)
                                              , heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1)
                                               , heightDimension: .absolute(180))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize
                                                       , subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0
                                                      , bottom: 0, trailing: 25)
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 15
                                                        , bottom: 10, trailing: 0)
        section.orthogonalScrollingBehavior = .paging
        section.boundarySupplementaryItems = [self.supplementtryHeader()]
        
        //animation
        
        section.visibleItemsInvalidationHandler = { items, offset, environment in
            items.forEach { item in
                if item.representedElementCategory == .cell {
                    let distanceFromCenter = abs((item.frame.midX - offset.x) - environment.container.contentSize.width / 2.0)
                    let minScale: CGFloat = 0.8
                    let maxScale: CGFloat = 1.0
                    let scale = max(maxScale - (distanceFromCenter / environment.container.contentSize.width), minScale)
                    item.transform = CGAffineTransform(scaleX: scale, y: scale)
                }
            }
        }
        return section
    }
    
    func LatestEvents()->NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1)
                                              , heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1)
                                               , heightDimension: .absolute(220))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize
                                                     , subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0
                                                      , bottom: 8, trailing: 0)
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 15
                                                        , bottom: 10, trailing: 15)
        section.boundarySupplementaryItems = [self.supplementtryHeader()]
        return section
    }
    
    func TeamsSection()-> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1)
                                              , heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.45)
                                               , heightDimension: .absolute(150))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize
                                                     , subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0
                                                      , bottom: 0, trailing: 15)
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 15
                                                        , bottom: 10, trailing: 0)
        section.orthogonalScrollingBehavior = .continuous
        section.boundarySupplementaryItems = [self.supplementtryHeader()]
        // Animation
        section.visibleItemsInvalidationHandler = { items, offset, environment in
            items.forEach { item in
                if item.representedElementCategory == .cell {
                    let distanceFromCenter = abs((item.frame.midX - offset.x) - environment.container.contentSize.width / 2.0)
                    let minScale: CGFloat = 0.8
                    let maxScale: CGFloat = 1.0
                    let scale = max(maxScale - (distanceFromCenter / environment.container.contentSize.width), minScale)
                    item.transform = CGAffineTransform(scaleX: scale, y: scale)
                }
            }
        }
        
        return section
    }
    
    
}



