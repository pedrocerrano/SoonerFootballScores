//
//  GameTableViewCell.swift
//  SoonerFootballScores
//
//  Created by iMac Pro on 3/7/23.
//

import UIKit

class GameTableViewCell: UITableViewCell {

    //MARK: - OUTLETS
    @IBOutlet weak var awayTeamNameLabel: UILabel!
    @IBOutlet weak var awayTeamScoreLabel: UILabel!
    @IBOutlet weak var homeTeamNameLabel: UILabel!
    @IBOutlet weak var homeTeamScoreLabel: UILabel!
    @IBOutlet weak var soonerWinStatusLabel: UILabel!
    
    
    //MARK: - FUNCTIONS
    func configureUI(forGame game: GamesListDictionary) {
        awayTeamNameLabel.text = game.awayTeamName
        awayTeamScoreLabel.text = "\(game.awayTeamFinalScore)"
        homeTeamNameLabel.text = game.homeTeamName
        homeTeamScoreLabel.text = "\(game.homeTeamFinalScore)"
        
        if game.awayTeamName == "Oklahoma" && game.awayTeamFinalScore > game.homeTeamFinalScore {
            formatWiningText()
        } else if game.homeTeamName == "Oklahoma" && game.homeTeamFinalScore > game.awayTeamFinalScore {
            formatWiningText()
        } else {
            formatLosingText()
        }
    }
    
    
    func formatWiningText() {
        soonerWinStatusLabel.text = "W"
        soonerWinStatusLabel.textColor = .green
    }
    
    
    func formatLosingText() {
        soonerWinStatusLabel.text = "L"
        soonerWinStatusLabel.textColor = .red
    }
}
