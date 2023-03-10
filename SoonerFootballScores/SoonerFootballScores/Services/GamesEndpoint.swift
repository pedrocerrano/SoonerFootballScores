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
    case game
    
    var fullURL: URL? {
        guard let url = Self.baseURL,
              var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true) else { return nil }
        
        switch self {
        case .season:
            urlComponents.path.append("games")
            let seasonQuery = URLQueryItem(name: "year", value: "2022")
            let teamQuery   = URLQueryItem(name: "team", value: "Oklahoma")
            urlComponents.queryItems = [seasonQuery, teamQuery]
        case .game:
            urlComponents.path.append("games")
            urlComponents.path.append("teams")
            #warning("Need to complete with GameID Query")
        }
        return urlComponents.url
    }
}
