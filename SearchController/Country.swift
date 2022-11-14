//
//  Country.swift
//  SearchController
//
//  Created by Zac Workman on 29/01/2019.
//  Copyright © 2019 Kwip Limited. All rights reserved.
//

import Foundation


struct Country {
    let continent: String
    let title: String
    
    static func GetAllCountries() -> [Country] {
        return [
            Country(continent:"Europe", title:"Denmark"),
            Country(continent:"Europe", title:"United Kingdom"),
            Country(continent:"Europe", title:"Germany"),
            Country(continent:"Europe", title:"France"),
            Country(continent:"Europe", title:"Belgium"),
            
            Country(continent:"Asia", title:"Nepal"),
            Country(continent:"Asia", title:"North Korea"),
            Country(continent:"Asia", title:"Japan"),
            
            Country(continent:"Africa", title:"Algeria"),
            Country(continent:"Africa", title:"Angola"),
            Country(continent:"Africa", title:"Chad"),
            Country(continent:"Africa", title:"Sudan")
        ]
    }
}
