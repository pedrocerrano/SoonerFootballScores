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
    let homeAway: String
    let points: Int
    let stats: [Stat]
}

struct Stat: Decodable {
    let category: String
    let stat: String
}
