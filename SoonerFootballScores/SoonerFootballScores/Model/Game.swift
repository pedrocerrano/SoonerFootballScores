//
//  GameListDictionary.swift
//  SoonerFootballScores
//
//  Created by iMac Pro on 3/7/23.
//

import Foundation

struct GameListDictionary: Decodable {
    private enum CodingKeys: String, CodingKey {
        case gameID             = "id"
        case venue
        case homeTeamID         = "home_id"
        case homeTeamName       = "home_team"
        case homeTeamFinalScore = "home_points"
        case homeTeamScoreByQtr = "home_line_scores"
        case awayTeamID         = "away_id"
        case awayTeamName       = "away_team"
        case awayTeamFinalScore = "away_points"
        case awayTeamScoreByQtr = "away_line_scores"
    }
    
    let gameID: Int
    let venue: String
    let homeTeamID: Int
    let homeTeamName: String
    let homeTeamFinalScore: Int
    let homeTeamScoreByQtr: [Int]
    let awayTeamID: Int
    let awayTeamName: String
    let awayTeamFinalScore: Int
    let awayTeamScoreByQtr: [Int]
}
