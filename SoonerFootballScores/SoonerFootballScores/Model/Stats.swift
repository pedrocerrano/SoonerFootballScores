//
//  Stats.swift
//  SoonerFootballScores
//
//  Created by iMac Pro on 3/10/23.
//

import Foundation

struct StatsTopLevelDictionary: Decodable {
    let id: Int
    let teams: [Team]
}

struct Team: Decodable {
    let school: String
    let homeAway: HomeAway
    let stats: [StatCategories]
}

struct StatCategories: Decodable {
    private enum CodingKeys: String, CodingKey {
        case category
        case statValue = "stat"
    }
    
    let category: String
    let statValue: String
}

enum HomeAway: String, Decodable {
    case home = "home"
    case away = "away"
}
