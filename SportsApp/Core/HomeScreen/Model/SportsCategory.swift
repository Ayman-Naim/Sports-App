//
//  SportsCategory.swift
//  SportsApp
//
//  Created by ayman on 29/09/2023.
//

import Foundation
enum SportsCategory :String, CaseIterable {
    case Football = "Football"
    case BasketBall = "BasketBall"
    case Cricket  = "Cricket"
    case Tennis  = "Tennis"
    
    var Url :String {
        switch self {
        case .Football: return "https://apiv2.allsportsapi.com/football/?met=Leagues&APIkey=\(ApiKey.apikey.rawValue)"
        case .BasketBall: return "https://apiv2.allsportsapi.com/basketball/?met=Leagues&APIkey=\(ApiKey.apikey.rawValue)"
        case .Cricket: return "https://apiv2.allsportsapi.com/cricket/?met=Leagues&APIkey=\(ApiKey.apikey.rawValue)"
        case .Tennis: return "https://apiv2.allsportsapi.com/tennis/?met=Leagues&APIkey=\(ApiKey.apikey.rawValue)"
            
        }
    }

    var Image:String  {
        switch self {
        case .Football: return "FootBall"
        case .BasketBall: return "BasketBall"
        case .Cricket: return "Cricket"
        case .Tennis: return "Tennis"
            
        }
    }
    
}


enum ApiKey :String {
    case apikey = "99cb45554546b20940cf95bf0c822f2ab58ed09c0cf08c0975efcc1bd6fc8c54"
    
    
}
