//
//  SportsCategory.swift
//  SportsApp
//
//  Created by ayman on 29/09/2023.
//

import Foundation
enum SportsCategory :String {
    case Football = "Football"
    case BasketBall = "BasketBall"
    case Cricket  = "Cricket"
    case Tennis  = "Tennis"
    
    var Url :String {
        switch self {
        case .Football: return " "
        case .BasketBall: return " "
        case .Cricket: return " "
        case .Tennis: return " "
            
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
