//
//  GameTableViewCellDataService.swift
//  SoonerFootballScores
//
//  Created by iMac Pro on 3/8/23.
//

import UIKit

struct GameTableViewCellDataService {
    
    private let service = APIService()
    
    func fetchTeamLogo(withTeamID teamID: String, completion: @escaping (Result<UIImage, NetworkError>) -> Void) {
        guard let finalURL = URL(string: Constants.SportsAPI.logosBaseURL + teamID + ".png") else { completion(.failure(.invalidURL)) ; return }
        print("Fetch Team Logos final URL: \(finalURL)")
        
        let request = URLRequest(url: finalURL)
        service.perform(request) { result in
            switch result {
            case .success(let data):
                guard let image = UIImage(data: data) else { completion(.failure(.noData)) ; return }
                completion(.success(image))
            case .failure(let error):
                completion(.failure(.thrownError(error)))
            }
        }
    }
}
