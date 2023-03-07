//
//  TeamsInfoViewModel.swift
//  SoonerFootballScores
//
//  Created by iMac Pro on 3/7/23.
//

import Foundation

protocol TeamsInfoViewDelegate: AnyObject {
    func teamInfoLoadedSuccessfully()
    func teamLoadEncountered(_ error: NetworkError)
}

class TeamsInfoViewModel {
    weak var delegate: TeamsInfoViewDelegate?
    var teams: [TeamsInfoDictionary] = []
    private let teamInfoService: TeamsInfoDataService
    
    init(delegate: TeamsInfoViewDelegate?, teamInfoService: TeamsInfoDataService = TeamsInfoDataService()) {
        self.delegate = delegate
        self.teamInfoService = teamInfoService
        self.fetchTeamsInfo()
    }
    
    func fetchTeamsInfo() {
        teamInfoService.fetchTeamsInfo { result in
            switch result {
            case .success(let topLevel):
                self.teams = topLevel
                self.delegate?.teamInfoLoadedSuccessfully()
            case .failure(let error):
                self.delegate?.teamLoadEncountered(error)
            }
        }
    }
}
