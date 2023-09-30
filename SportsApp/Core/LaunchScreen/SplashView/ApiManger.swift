//
//  ApiManger.swift
//  SportsApp
//
//  Created by ayman on 29/09/2023.
//

import Foundation
import Alamofire

class ApiManger {
    
    static let SharedApiManger = ApiManger()
    
   private  init(){
        
    }
    
    /*func fetchLeages<T>(url:String ,DecodingModel:T){
        let request = AF.request("https://apiv2.allsportsapi.com/football/?met=Leagues&APIkey=7dbbe4899351e7c403259b7b2f31e9bf9aaba8a00cb18487724163d013402aaf")
        request.responseDecodable(of: LeaguesModel.self ) { (data) in
             print("Debug:\(data)")
          //  complitationHnaler(data)
           }
    }
    */
    
    
    func fetchLeagues<T: Decodable>(url: String, decodingModel: T.Type, completion: @escaping (T?, Error?) -> Void) {
        AF.request(url).validate().responseDecodable(of: T.self) { response in
        
        switch response.result {
        case .success(let decodedData):
            print("DeBug: \(response)")
            completion(decodedData, nil)
        case .failure(let error):
            completion(nil, error)
            
            
        }
        
    }
        
    }
    
}
