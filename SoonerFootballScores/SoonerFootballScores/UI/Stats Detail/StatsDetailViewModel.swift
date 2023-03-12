//
//  StatsDetailViewModel.swift
//  SoonerFootballScores
//
//  Created by iMac Pro on 3/12/23.
//

import Foundation

class StatsDetailViewModel {
    var game: GameListDictionary?
    var teamStats: [StatsTopLevelDictionary] = []
    private let statsService: StatsDetailDataServicable
    
    init(game: GameListDictionary, statsService: StatsDetailDataServicable = StatsDetailDataService()) {
        self.game = game
        self.statsService = statsService
        self.fetchGameStatistics()
    }
    
    func fetchGameStatistics() {
        guard let game = game else { return }
        statsService.fetchStatsDetail(with: .game(String(game.gameID))) { result in
            switch result {
            case .success(let topLevel):
                self.teamStats = topLevel
            case .failure(let error):
                print(error.errorDescription ?? Constants.Error.unknownError)
            }
        }
    }
}
