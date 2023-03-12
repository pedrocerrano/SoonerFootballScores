//
//  GamesDataService.swift
//  SoonerFootballScores
//
//  Created by iMac Pro on 3/7/23.
//

import Foundation

protocol GamesDataServicable {
    func fetchGamesList(with endpoint: GamesEndpoint, completion: @escaping (Result<[GameListDictionary], NetworkError>) -> Void)
}

struct GamesDataService: GamesDataServicable {
    private let service = APIService()
    
    func fetchGamesList(with endpoint: GamesEndpoint, completion: @escaping (Result<[GameListDictionary], NetworkError>) -> Void) {
        guard let finalURL  = endpoint.fullURL else { completion(.failure(.invalidURL)) ; return }
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
                    let topLevel = try JSONDecoder().decode([GameListDictionary].self, from: data)
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
