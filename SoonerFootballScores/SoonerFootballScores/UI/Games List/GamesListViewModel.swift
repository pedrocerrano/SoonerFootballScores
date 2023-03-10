//
//  GamesListViewModel.swift
//  SoonerFootballScores
//
//  Created by iMac Pro on 3/7/23.
//

import Foundation

protocol GamesListViewDelegate: AnyObject {
    func gamesLoadedSuccessfully()
}

class GamesListViewModel {
    weak var delegate: GamesListViewDelegate?
    var games: [GameListDictionary] = []
    private let service: GamesDataService
    
    // Dependency Injection
    init(delegate: GamesListViewDelegate?, service: GamesDataService = GamesDataService()) {
        self.delegate = delegate
        self.service = service
        self.fetchGamesList()
    }
    
    func fetchGamesList() {
        service.fetchGamesList(with: .season) { result in
            switch result {
            case .success(let topLevel):
                self.games = topLevel
                self.delegate?.gamesLoadedSuccessfully()
            case .failure(let error):
                print(error.errorDescription ?? "Write better code.")
            }
        }
    }
}
