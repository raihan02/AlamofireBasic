//
//  ServiceClass.swift
//  AlamoFireBasic
//
//  Created by Twnibit_Raihan on 20/2/20.
//  Copyright © 2020 Twnibit_Raihan. All rights reserved.
//

import Foundation
import Alamofire
class Service{
    // https://restcountries.eu/rest/v2
    fileprivate var baseUrl = ""
    
    init(baseUrl : String)
    {
        self.baseUrl = baseUrl
    }
    //MARK:- getAllCountryName Function
    func getAllCountryNames(endpoint : String)
    {
        AF.request(self.baseUrl + endpoint, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil).response {
            (responseData) in

            guard let data = responseData.data else {return}

            do{
                let json =  try JSONDecoder().decode([Country].self, from: data)
                print("Countries: ", json)
            }
            catch{
                print("Error:  \(error)")
            }
            
        }
    }
}
