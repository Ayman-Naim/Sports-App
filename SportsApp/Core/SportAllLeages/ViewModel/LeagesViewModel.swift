//
//  LeagesViewModel.swift
//  SportsApp
//
//  Created by ayman on 29/09/2023.
//
//
//import Foundation
//
//
//class LeagesViewModel{
//    var LeagesResult :[Leagues]?
//    init(){
//        LeagesResult = [Leagues]()
//
//    }
//    func fetch (completionHandeler: @escaping ([Leagues]?) -> Void ){
//        ApiManger.SharedApiManger.fetchLeagues(url: "https://apiv2.allsportsapi.com/football/?met=Leagues&APIkey=7dbbe4899351e7c403259b7b2f31e9bf9aaba8a00cb18487724163d013402aaf", decodingModel: LeaguesModel.self) { data, error in
//
//            print(data)
//            completionHandeler(data?.result)
//            self.LeagesResult = data!.result
//    }
//
//
//
//
//    }
//
//}
import Foundation

class LeagesViewModel {
    var LeagesResult: [Leagues]?
    var url : String?
    var sport: String?
    
    init(url: String , sport: String) {
        self.url = url
        self.sport = sport
        LeagesResult = [Leagues]()
    }

    func fetch(completionHandler: @escaping ([Leagues]?) -> Void) {
        // Call the fetchLeagues function from ApiManger to fetch data from the API
        ApiManger.SharedApiManger.fetchLeagues(url: url ?? "" , decodingModel: LeaguesModel.self) { data, error in
            // Handle the API response
            completionHandler(data?.result)
            self.LeagesResult = data?.result
        }
    }
}
