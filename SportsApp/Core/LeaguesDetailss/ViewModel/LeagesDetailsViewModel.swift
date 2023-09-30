//
//  LeagesDetailsViewModel.swift
//  SportsApp
//
//  Created by ayman on 30/09/2023.
//

import Foundation
class LeagesDetailsViewModel  {
    var LeagesEvents: [upcommingEvents]?
    var url : String?
   // var sport: String?
    
    init(url: String) {
        self.url = url
        LeagesEvents = [upcommingEvents]()
    }
    
    
    func fetch(completionHandler: @escaping ([upcommingEvents]?) -> Void) {
        // Call the fetchLeagues function from ApiManger to fetch data from the API
        ApiManger.SharedApiManger.fetchLeagues(url: url ?? "" , decodingModel: LeaguesDetailsModel.self) { data, error in
            // Handle the API response
           
            completionHandler(data?.result)
            self.LeagesEvents = data?.result
            print("Events:\(data)")
        }
    }
}
