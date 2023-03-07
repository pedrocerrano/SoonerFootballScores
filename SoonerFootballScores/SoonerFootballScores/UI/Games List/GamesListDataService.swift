//
//  GamesListDataService.swift
//  SoonerFootballScores
//
//  Created by iMac Pro on 3/7/23.
//

import Foundation

struct GamesListDataService {
    
    private let service = APIService()
    
    func fetchGamesList(completion: @escaping (Result<[GamesListDictionary], NetworkError>) -> Void) {
        guard let baseURL   = URL(string: Constants.SportsAPI.baseURL) else { completion(.failure(.invalidURL)) ; return }
        var urlComponents   = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        
        let seasonQuery     = URLQueryItem(name: Constants.SportsAPI.seasonQueryKey, value: Constants.SportsAPI.seasonQueryValue)
        let teamQuery       = URLQueryItem(name: Constants.SportsAPI.teamQueryKey, value: Constants.SportsAPI.teamQueryValue)
        urlComponents?.queryItems = [seasonQuery, teamQuery]
        
        guard let finalURL  = urlComponents?.url else { completion(.failure(.invalidURL)) ; return }
        print("fetchSeasonGames Final URL: \(finalURL)")
        
        var requestWithHeaders         = URLRequest(url: finalURL)
        requestWithHeaders.httpMethod  = "GET"
        requestWithHeaders.addValue("application/json", forHTTPHeaderField: "accept")
        requestWithHeaders.addValue("Bearer " + Constants.SportsAPI.tokenString, forHTTPHeaderField: "Authorization")
        print("URL Request with Bearer Token: \(requestWithHeaders)")
        
        service.perform(requestWithHeaders) { result in
            switch result {
            case .success(let data):
                do {
                    let topLevel = try JSONDecoder().decode([GamesListDictionary].self, from: data)
                    completion(.success(topLevel))
                } catch {
                    completion(.failure(.unableToDecode))
                }
            case .failure(let error):
                completion(.failure(.thrownError(error)))
            }
        }
    }
}
