//
//  Game.swift
//  SoonerFootballScores
//
//  Created by iMac Pro on 3/7/23.
//

import Foundation

struct SeasonGamesTopLevelDictionary: Decodable {
    let games: [Game]
}

struct Game: Decodable {
    private enum CodingKeys: String, CodingKey {
        case gameID             = "id"
        case season
        case homeTeamID         = "home_id"
        case homeTeam           = "home_team"
        case homeTeamFinalScore = "home_points"
        case homeTeamScoreByQtr = "home_line_scores"
        case awayTeamID         = "away_id"
        case awayTeam           = "away_team"
        case awayTeamFinalScore = "away_points"
        case awayTeamScoreByQtr = "away_line_scores"
    }
    
    let gameID: Int
    let season: Int
    let homeTeamID: Int
    let homeTeam: String
    let homeTeamFinalScore: Int
    let homeTeamScoreByQtr: [Int]
    let awayTeamID: Int
    let awayTeam: String
    let awayTeamFinalScore: Int
    let awayTeamScoreByQtr: [Int]
}
