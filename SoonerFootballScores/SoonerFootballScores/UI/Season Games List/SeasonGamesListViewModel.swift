//
//  SeasonGamesListViewModel.swift
//  SoonerFootballScores
//
//  Created by iMac Pro on 3/7/23.
//

import Foundation

struct SeasonGamesListViewModel {
    
    static func fetchSeasonGamesList(completion: @escaping (Result<[SeasonGamesTopLevelDictionary], NetworkError>) -> Void) {
        guard let baseURL   = URL(string: Constants.SportsAPI.baseURL) else { completion(.failure(.invalidURL)) ; return }
        var urlComponents   = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        
        let seasonQuery     = URLQueryItem(name: Constants.SportsAPI.seasonQueryKey, value: Constants.SportsAPI.seasonQueryValue)
        let teamQuery       = URLQueryItem(name: Constants.SportsAPI.teamQueryKey, value: Constants.SportsAPI.teamQueryValue)
        urlComponents?.queryItems = [seasonQuery, teamQuery]
        
        guard let finalURL  = urlComponents?.url else { completion(.failure(.invalidURL)) ; return }
        print("fetchSeasonGames Final URL: \(finalURL)")
        
        var request         = URLRequest(url: finalURL)
        request.httpMethod  = "GET"
        request.addValue("application/json", forHTTPHeaderField: "accept")
        request.addValue("Bearer " + Constants.SportsAPI.tokenString, forHTTPHeaderField: "Authorization")
        print("URL Request with Bearer Token: \(request)")
        
        URLSession.shared.dataTask(with: request) { gamesData, response, error in
            if let error = error {
                completion(.failure(.thrownError(error)))
                return
            }
            
            if let response = response as? HTTPURLResponse {
                print("fetch Season Games Status Code: \(response.statusCode)")
            }
            
            guard let data = gamesData else { completion(.failure(.noData)) ; return }
            do {
                let topLevel = try JSONDecoder().decode([SeasonGamesTopLevelDictionary].self, from: data)
                completion(.success(topLevel))
            } catch {
                completion(.failure(.unableToDecode))
                print("...from fetchSeasonGames data.")
            }
        }.resume()
    }
}
