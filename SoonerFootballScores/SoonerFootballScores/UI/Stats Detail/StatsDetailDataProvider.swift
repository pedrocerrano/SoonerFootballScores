//
//  StatsDetailDataProvider.swift
//  SoonerFootballScores
//
//  Created by iMac Pro on 3/12/23.
//

import Foundation

protocol StatsDetailDataServicable {
    func fetchStatsDetail(with endpoint: GamesEndpoint, completion: @escaping (Result<[StatsTopLevelDictionary], NetworkError>) -> Void)
}

struct StatsDetailDataService: StatsDetailDataServicable {
    private let statsService = APIService()
    
    func fetchStatsDetail(with endpoint: GamesEndpoint, completion: @escaping (Result<[StatsTopLevelDictionary], NetworkError>) -> Void) {
        guard let finalURL = endpoint.fullURL else { completion(.failure(.invalidURL)) ; return }
        print("Fetch Stats final URL: \(finalURL)")
        
        var request         = URLRequest(url: finalURL)
        request.httpMethod  = "GET"
        request.addValue(Constants.SportsAPI.Headers.headerOneValue, forHTTPHeaderField: Constants.SportsAPI.Headers.headerOneField)
        request.addValue(Constants.SportsAPI.Headers.headerTwoValue, forHTTPHeaderField: Constants.SportsAPI.Headers.headerTwoField)
        
        statsService.perform(request) { result in
            switch result {
            case .success(let data):
                do {
                    let topLevelDict = try JSONDecoder().decode([StatsTopLevelDictionary].self, from: data)
                    completion(.success(topLevelDict))
                } catch {
                    completion(.failure(.unableToDecode))
                }
            case .failure(let error):
                completion(.failure(.thrownError(error)))
            }
        }
    }
}
