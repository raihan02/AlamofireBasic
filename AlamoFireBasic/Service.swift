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
    // https://restcountries.eu/rest/v2/all
    fileprivate var baseUrl = ""
    
    init(baseUrl : String)
    {
        self.baseUrl = baseUrl
    }
    var arr = [Country]()
    //MARK:- getAllCountryName Function
    
    func getAllCountryName(completion: @escaping () -> Void)
    {
        //var arr = [Country]()
        AF.request(self.baseUrl, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil).response {
            (responseData) in

            guard let data = responseData.data else {return}

            do{
                let json =  try JSONDecoder().decode([Country].self, from: data)
                 var data = Country()
                
                for i in 0 ..< json.count{
                    data.name = json[i].name
                    data.capital = json[i].capital
                    data.countryCode = json[i].countryCode
                    tempCopyCountryArray.append(data)
                }
               // print(arr)
              
                
            }
            catch{
                print("Error:  \(error)")
            }
            //self.storeCountryArrayFunc()
            completion()
        }

    }
}

/*
struct Section {
    let name: String
    var friends: [Country]

    static func alphabaticallySectionedFriends() -> [Section] {
        let friends = Friend.allFriends().sorted { $0.name < $1.name }
        let groupedFriends = Dictionary(grouping: friends) { String($0.name.first!).uppercased() }
        let sections = groupedFriends.map { Section(name: $0.key, friends: $0.value) }
        let sortedSections = sections.sorted { $0.name < $1.name }
        return sortedSections
  
 }
 */

struct Section{
    let name : String
    var country : [Country]
    
    static func alphabaticallySectionedCountry() -> [Section]
    {
        let groupedCountry = Dictionary(grouping: tempCopyCountryArray) { String(($0.name?.first!)!).uppercased() }
        let sections = groupedCountry.map { Section(name: $0.key, country: $0.value) }
        
       let sortedSection =  sections.sorted{
            $0.name < $1.name
        }
        return sortedSection
    }
}
