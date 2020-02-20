//
//  CountryMode.swift
//  AlamoFireBasic
//
//  Created by Twnibit_Raihan on 20/2/20.
//  Copyright © 2020 Twnibit_Raihan. All rights reserved.
//

import Foundation

struct Country : Codable {
    var name : String?
    var capital : String?
    var countryCode : String?
    
    
    enum CodingKeys : String, CodingKey{
        case name = "name"
        case capital = "capital"
        case countryCode = "alpha3Code"
    }
}


