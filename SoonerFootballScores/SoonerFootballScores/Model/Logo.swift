//
//  LogoTopLevelDictionary.swift
//  SoonerFootballScores
//
//  Created by iMac Pro on 3/7/23.
//

import Foundation

struct LogoTopLevelDictionary: Decodable {
    private enum CodingKeys: String, CodingKey {
        case teamID             = "id"
        case schoolName         = "school"
        case teamColor          = "color"
        case teamLogos          = "logos"
    }
    
    let teamID: Int
    let schoolName: String
    let teamColor: String
    let teamLogos: [String]
}
