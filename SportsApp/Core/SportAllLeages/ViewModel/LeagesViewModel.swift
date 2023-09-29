//
//  LeagesViewModel.swift
//  SportsApp
//
//  Created by ayman on 29/09/2023.
//

import Foundation


class LeagesViewModel{
    var LeagesResult :[Leagues]?
    init(){
        LeagesResult = [Leagues]()
        
    }
    func fetch (completionHandeler: @escaping ([Leagues]?) -> Void ){
        ApiManger.SharedApiManger.fetchLeagues(url: "https://apiv2.allsportsapi.com/football/?met=Leagues&APIkey=7dbbe4899351e7c403259b7b2f31e9bf9aaba8a00cb18487724163d013402aaf", decodingModel: LeaguesModel.self) { data, error in
            
            print(data)
            completionHandeler(data?.result)
            self.LeagesResult = data!.result
    }
   
        
        
        
    }
    
}

