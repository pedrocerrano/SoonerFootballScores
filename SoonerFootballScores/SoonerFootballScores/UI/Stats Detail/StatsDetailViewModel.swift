//
//  StatsDetailViewModel.swift
//  SoonerFootballScores
//
//  Created by iMac Pro on 3/12/23.
//

import Foundation

protocol StatsDetailViewModelDelegate: AnyObject {
    func statsLoadedSuccessfully()
}

class StatsDetailViewModel {
    weak var awayTeamDelegate: StatsDetailViewModelDelegate?
    weak var homeTeamDelegate: StatsDetailViewModelDelegate?
    var game: GameListDictionary?
    var homeTeam: Team?
    var awayTeam: Team?
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
                self.homeTeam = topLevel.first?.teams.first(where: { $0.homeAway == .home } )
                self.awayTeam = topLevel.first?.teams.first(where: { $0.homeAway == .away } )
                DispatchQueue.main.async {
                    self.awayTeamDelegate?.statsLoadedSuccessfully()
                    self.homeTeamDelegate?.statsLoadedSuccessfully()
                }
            case .failure(let error):
                print(error.errorDescription ?? Constants.Error.unknownError)
            }
        }
    }
}
