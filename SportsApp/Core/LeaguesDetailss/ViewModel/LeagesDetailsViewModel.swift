//
//  LeagesDetailsViewModel.swift
//  SportsApp
//
//  Created by ayman on 30/09/2023.
//

import Foundation
class LeagesDetailsViewModel  {
    var LeagesEvents: [upcommingEvents]?
    var latestEvents: [upcommingEvents]?
    var id : Int?
    var sport: String?
    
    init(id: Int , sport: String ) {
        self.id = id
        self.sport = sport

        LeagesEvents = [upcommingEvents]()
    }
    
    
    func fetch(completionHandler: @escaping ([upcommingEvents]?) -> Void) {
        // Call the fetchLeagues function from ApiManger to fetch data from the API
        ApiManger.SharedApiManger.fetchLeagues(url: "https://apiv2.allsportsapi.com/\(sport ?? "football")?met=Fixtures&leagueId=\(id ?? 0)&from=2023-09-30&to=2024-10-10&APIkey=7dbbe4899351e7c403259b7b2f31e9bf9aaba8a00cb18487724163d013402aaf", decodingModel: LeaguesDetailsModel.self) { data, error in
            // Handle the API response
           
            completionHandler(data?.result)
            self.LeagesEvents = data?.result
            print("Events:\(data)")
        }
    }
    
    func fetchLatestEvents(completionHandler: @escaping ([upcommingEvents]?) -> Void) {
        // Call the fetchLeagues function from ApiManger to fetch data from the API
        ApiManger.SharedApiManger.fetchLeagues(url: "https://apiv2.allsportsapi.com/\(sport ?? "football")?met=Fixtures&leagueId=\(id ?? 0)&from=2022-09-29&to=2023-9-19&APIkey=7dbbe4899351e7c403259b7b2f31e9bf9aaba8a00cb18487724163d013402aaf", decodingModel: LeaguesDetailsModel.self) { data, error in
            // Handle the API response
           
            completionHandler(data?.result)
            self.latestEvents = data?.result
            print("Events:\(data)")
        }
    }

}
