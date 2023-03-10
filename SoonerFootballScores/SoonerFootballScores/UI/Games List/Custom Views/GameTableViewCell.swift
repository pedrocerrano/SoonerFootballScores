//
//  GameTableViewCell.swift
//  SoonerFootballScores
//
//  Created by iMac Pro on 3/7/23.
//

import UIKit

class GameTableViewCell: UITableViewCell {

    //MARK: - OUTLETS
    @IBOutlet weak var awayTeamLogoImageView: ServiceRequestingImageView!
    @IBOutlet weak var awayTeamNameLabel: UILabel!
    @IBOutlet weak var awayTeamScoreLabel: UILabel!
    @IBOutlet weak var homeTeamLogoImageView: ServiceRequestingImageView!
    @IBOutlet weak var homeTeamNameLabel: UILabel!
    @IBOutlet weak var homeTeamScoreLabel: UILabel!
    @IBOutlet weak var winOrLoseLabel: UILabel!

    
    //MARK: - FUNCTIONS
    func configureUI(forGame game: GameListDictionary) {
        awayTeamNameLabel.text = game.awayTeamName
        awayTeamScoreLabel.text = "\(game.awayTeamFinalScore)"
        homeTeamNameLabel.text = game.homeTeamName
        homeTeamScoreLabel.text = "\(game.homeTeamFinalScore)"
        fetchHomeTeamLogo(forGame: game)
        fetchAwayTeamLogo(forGame: game)
        
        if game.awayTeamName == "Oklahoma" && game.awayTeamFinalScore > game.homeTeamFinalScore {
            formatWiningText()
        } else if game.homeTeamName == "Oklahoma" && game.homeTeamFinalScore > game.awayTeamFinalScore {
            formatWiningText()
        } else {
            formatLosingText()
        }
    }
    
    private func fetchHomeTeamLogo(forGame game: GameListDictionary) {
        guard let baseLogoURL = URL(string: Constants.SportsAPI.logosBaseURL),
              var urlComponents = URLComponents(url: baseLogoURL, resolvingAgainstBaseURL: true) else { return}
        urlComponents.path.append(String(game.homeTeamID))
        guard let finalLogoURL = urlComponents.url?.appendingPathExtension("png") else { return }
        homeTeamLogoImageView.fetchImage(using: finalLogoURL)
        print("Home Team Logo final URL: \(finalLogoURL)")
    }
    
    private func fetchAwayTeamLogo(forGame game: GameListDictionary) {
        guard let baseLogoURL = URL(string: Constants.SportsAPI.logosBaseURL),
              var urlComponents = URLComponents(url: baseLogoURL, resolvingAgainstBaseURL: true) else { return}
        urlComponents.path.append(String(game.awayTeamID))
        guard let finalLogoURL = urlComponents.url?.appendingPathExtension("png") else { return }
        awayTeamLogoImageView.fetchImage(using: finalLogoURL)
        print("Away Team Logo final URL: \(finalLogoURL)")
    }
    
    
    private func formatWiningText() {
        winOrLoseLabel.text = "W"
        winOrLoseLabel.textColor = .green
    }
    
    
    private func formatLosingText() {
        winOrLoseLabel.text = "L"
        winOrLoseLabel.textColor = .red
    }
}
