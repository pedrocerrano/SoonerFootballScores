//
//  SeasonGamesListViewModel.swift
//  SoonerFootballScores
//
//  Created by iMac Pro on 3/7/23.
//

import Foundation

protocol SeasonGamesListViewDelegate: AnyObject {
    func gamesLoadedSuccessfully()
    func encountered(_ error: NetworkError)
}

class SeasonGamesListViewModel {
    weak var delegate: SeasonGamesListViewDelegate?
    var games: [SeasonGamesTopLevelDictionary] = []
    private let service: SeasonGamesListDataService
    
    // Dependency Injection
    init(delegate: SeasonGamesListViewDelegate?, service: SeasonGamesListDataService = SeasonGamesListDataService()) {
        self.delegate = delegate
        self.service = service
        self.fetchGamesList()
    }
    
    func fetchGamesList() {
        service.fetchGamesList { result in
            switch result {
            case .success(let topLevel):
                self.games = topLevel
                self.delegate?.gamesLoadedSuccessfully()
            case .failure(let error):
                self.delegate?.encountered(error)
            }
        }
    }
}
