//
//  LeagesDetailsViewModel.swift
//  SportsApp
//
//  Created by ayman on 30/09/2023.
//

import Foundation

struct LeaguesDetailsModel : Codable{
    var success : Int?
    var result : [upcommingEvents]
    
}
struct upcommingEvents : Codable{
    var event_home_team :String?
    var event_away_team :String?
    var event_status : String?
    var home_team_logo :String?
    var away_team_logo  :String?
    var event_date  :String?
    var event_time: String?
    var league_logo : String?
}
