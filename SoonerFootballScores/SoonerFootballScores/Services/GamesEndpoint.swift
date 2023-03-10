//
//  GamesEndpoint.swift
//  SoonerFootballScores
//
//  Created by iMac Pro on 3/10/23.
//

import Foundation

enum GamesEndpoint {
    static let baseURL = URL(string: "https://api.collegefootballdata.com/")
    
    case season
    case game(String)
    
    var fullURL: URL? {
        guard let url = Self.baseURL,
              var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true) else { return nil }
        urlComponents.path.append("games")
        
        switch self {
        case .season:
            let seasonQuery = URLQueryItem(name: "year", value: "2022")
            let teamQuery   = URLQueryItem(name: "team", value: "Oklahoma")
            urlComponents.queryItems = [seasonQuery, teamQuery]
        case .game(let gameID):
            urlComponents.path.append("teams")
            let gameIDQuery   = URLQueryItem(name: "gameid", value: gameID)
            urlComponents.queryItems = [gameIDQuery]
        }
        return urlComponents.url
    }
}
