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
        urlComponents?.path.append(Constants.SportsAPI.FetchGames.gamesPath)
        
        
        let seasonQuery     = URLQueryItem(name: Constants.SportsAPI.FetchGames.seasonQueryKey, value: Constants.SportsAPI.FetchGames.seasonQueryValue)
        let teamQuery       = URLQueryItem(name: Constants.SportsAPI.FetchGames.teamQueryKey, value: Constants.SportsAPI.FetchGames.teamQueryValue)
        urlComponents?.queryItems = [seasonQuery, teamQuery]
        
        guard let finalURL  = urlComponents?.url else { completion(.failure(.invalidURL)) ; return }
        print("Fetch Games List Final URL: \(finalURL)")
        
        var request         = URLRequest(url: finalURL)
        request.httpMethod  = "GET"
        request.addValue(Constants.SportsAPI.Headers.headerOneValue, forHTTPHeaderField: Constants.SportsAPI.Headers.headerOneField)
        request.addValue(Constants.SportsAPI.Headers.headerTwoValue, forHTTPHeaderField: Constants.SportsAPI.Headers.headerTwoField)
        print("URL Request with Bearer Token: \(request)")
        
        service.perform(request) { result in
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
