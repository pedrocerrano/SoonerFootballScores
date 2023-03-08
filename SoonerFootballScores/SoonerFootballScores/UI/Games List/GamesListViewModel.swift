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
    var games: [GamesListDictionary] = []
    private let service: GamesListDataService
    
    // Dependency Injection
    init(delegate: GamesListViewDelegate?, service: GamesListDataService = GamesListDataService()) {
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
                print(error.errorDescription ?? "Write better code.")
            }
        }
    }
}
