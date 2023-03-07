//
//  Constants.swift
//  SoonerFootballScores
//
//  Created by iMac Pro on 3/7/23.
//

import Foundation

struct Constants {
    
    struct SportsAPI {
// https://api.collegefootballdata.com/games?year=2022&team=Oklahoma
        static let baseURL          = "https://api.collegefootballdata.com/games"
        static let seasonQueryKey   = "year"
        static let seasonQueryValue = "2022"
        static let teamQueryKey     = "team"
        static let teamQueryValue   = "Oklahoma"
        
        static let tokenString      = "H4HP4tVe/PUHXs2rphw9z0upZACS5z2d0IjnDadVdnSiFJY6VTgF81ffkT2FysV3"
    }
}
