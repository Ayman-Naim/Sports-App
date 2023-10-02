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
        
       // print("ggg:\(currentDate)")
        LeagesEvents = [upcommingEvents]()
    }
    
    
    func fetch(completionHandler: @escaping ([upcommingEvents]?) -> Void) {
        // Call the fetchLeagues function from ApiManger to fetch data from the API
        let date = getDates()
        ApiManger.SharedApiManger.fetchLeagues(url: "https://apiv2.allsportsapi.com/\(sport ?? "football")?met=Fixtures&leagueId=\(id ?? 0)&from=\(date.CurrentData)&to=\(date.NextDate)&APIkey=7dbbe4899351e7c403259b7b2f31e9bf9aaba8a00cb18487724163d013402aaf", decodingModel: LeaguesDetailsModel.self) { data, error in
            // Handle the API response
            
            completionHandler(data?.result)
            self.LeagesEvents = data?.result
            //   print("Events:\(data)")
        }
    }
    
    func fetchLatestEvents(completionHandler: @escaping ([upcommingEvents]?) -> Void) {
        // Call the fetchLeagues function from ApiManger to fetch data from the API
        let date = getDates()
        ApiManger.SharedApiManger.fetchLeagues(url: "https://apiv2.allsportsapi.com/\(sport ?? "football")?met=Fixtures&leagueId=\(id ?? 0)&from=\(date.PastDate)&to=\(date.yesterDay)&APIkey=7dbbe4899351e7c403259b7b2f31e9bf9aaba8a00cb18487724163d013402aaf", decodingModel: LeaguesDetailsModel.self) { data, error in
            // Handle the API response
            
            completionHandler(data?.result)
            self.latestEvents = data?.result
            // print("Events:\(data)")
        }
    }
    
    
    func getDates()->(CurrentData:String,PastDate:String,NextDate:String,yesterDay:String){
        let TodayDate = Date()
        let yesterDay = TodayDate.addingTimeInterval(TimeInterval(86400 * -1))
        let PastDate = TodayDate.addingTimeInterval(TimeInterval(86400 * -14))
        let nextDate = TodayDate.addingTimeInterval(TimeInterval(86400 * 7))
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "yyyy-MM-dd"
        let result = dateFormater.string(from: TodayDate)
        let result2 = dateFormater.string(from: PastDate)
        let result3 = dateFormater.string(from: nextDate)
        let result4 = dateFormater.string(from: yesterDay)
        print(result)
        print(result2)
        print(result3)
        print(result4)
        return(result,result2,result3,result4)
    }
}
