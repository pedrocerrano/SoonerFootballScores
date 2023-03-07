//
//  SeasonGameTableViewCell.swift
//  SoonerFootballScores
//
//  Created by iMac Pro on 3/7/23.
//

import UIKit

class SeasonGameTableViewCell: UITableViewCell {

    //MARK: - OUTLETS
    @IBOutlet weak var awayTeamNameLabel: UILabel!
    @IBOutlet weak var awayTeamScoreLabel: UILabel!
    @IBOutlet weak var homeTeamNameLabel: UILabel!
    @IBOutlet weak var homeTeamScoreLabel: UILabel!
    @IBOutlet weak var soonerWinStatusLabel: UILabel!
    
    
    //MARK: - FUNCTIONS
    func configureUI(forGame game: SeasonGamesTopLevelDictionary) {
        awayTeamNameLabel.text = game.awayTeamName
        awayTeamScoreLabel.text = "\(game.awayTeamFinalScore)"
        homeTeamNameLabel.text = game.homeTeamName
        homeTeamScoreLabel.text = "\(game.homeTeamFinalScore)"
    }
}
