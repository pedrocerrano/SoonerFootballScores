//
//  Constants.swift
//  SoonerFootballScores
//
//  Created by iMac Pro on 3/7/23.
//

import Foundation

struct Constants {
    
    struct SportsAPI {
        
        static let baseURL              = "https://api.collegefootballdata.com/"
        
        struct Headers {
            static let headerOneValue   = "application/json"
            static let headerOneField   = "accept"
                        
            static let tokenString      = "H4HP4tVe/PUHXs2rphw9z0upZACS5z2d0IjnDadVdnSiFJY6VTgF81ffkT2FysV3"
            static let headerTwoValue   = "Bearer \(tokenString)"
            static let headerTwoField   = "Authorization"
        }
        
        
        struct FetchGames {
            static let gamesPath        = "games"
            
            static let seasonQueryKey   = "year"
            static let seasonQueryValue = "2022"
            static let teamQueryKey     = "team"
            static let teamQueryValue   = "Oklahoma"
        }
        
        
        struct FetchTeams {
            static let teamsInfoPath    = "teams"
        }
    } //: SportsAPI
    
    
    struct Error {
        static let unknownError     = "Unknown error. Our team is working to resolve the issue."
    }
} //: Constants
