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
    var awayTeam: Team?
    var homeTeam: Team?
    var game: GameListDictionary?
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
                // The API is an array at the Top Level, therefore topLevel.first taps into the only element of the array
                // teams.first(where: leverages an enum from the Stats Model to provide the condition for the first argument, and assigns that to the respective teams which are then used on the Custom Views to provide statistical data to the teams
                self.homeTeam = topLevel.first?.teams.first(where: { $0.homeAway == .home } )
                self.awayTeam = topLevel.first?.teams.first(where: { $0.homeAway == .away } )
                DispatchQueue.main.async {
                    // Because I used container views to pass data to the respective awayTeam and homeTeam VC's, I ran into a race issue and thus needed to provide them separate delegates to let the views know that data was loaded before they tried to display the views.
                    self.awayTeamDelegate?.statsLoadedSuccessfully()
                    self.homeTeamDelegate?.statsLoadedSuccessfully()
                }
            case .failure(let error):
                print(error.errorDescription ?? Constants.Error.unknownError)
            }
        }
    }
}
