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
    private let gamesService: GamesDataServicable
    
    // Dependency Injection
    init(delegate: GamesListViewDelegate?, service: GamesDataServicable = GamesDataService()) {
        self.delegate = delegate
        self.gamesService = service
        self.fetchGamesList()
    }
    
    func fetchGamesList() {
        gamesService.fetchGamesList(with: .season) { result in
            switch result {
            case .success(let topLevel):
                self.games = topLevel
                self.delegate?.gamesLoadedSuccessfully()
            case .failure(let error):
                print(error.errorDescription ?? Constants.Error.unknownError)
            }
        }
    }
}
