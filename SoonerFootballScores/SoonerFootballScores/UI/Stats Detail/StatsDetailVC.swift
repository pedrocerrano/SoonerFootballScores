//
//  StatsDetailVC.swift
//  SoonerFootballScores
//
//  Created by iMac Pro on 3/12/23.
//

import UIKit

class StatsDetailVC: UIViewController {

    //MARK: - OUTLETS
    @IBOutlet weak var awayTeamLogoImageView: LogoServiceForImageView!
    @IBOutlet weak var awayTeamNameLabel: UILabel!
    @IBOutlet weak var awayTeamQ1ScoreLabel: UILabel!
    @IBOutlet weak var awayTeamQ2ScoreLabel: UILabel!
    @IBOutlet weak var awayTeamQ3ScoreLabel: UILabel!
    @IBOutlet weak var awayTeamQ4ScoreLabel: UILabel!
    @IBOutlet weak var awayTeamFinalScoreLabel: UILabel!
    
    @IBOutlet weak var homeTeamLogoImageView: LogoServiceForImageView!
    @IBOutlet weak var homeTeamNameLabel: UILabel!
    @IBOutlet weak var homeTeamQ1ScoreLabel: UILabel!
    @IBOutlet weak var homeTeamQ2ScoreLabel: UILabel!
    @IBOutlet weak var homeTeamQ3ScoreLabel: UILabel!
    @IBOutlet weak var homeTeamQ4ScoreLabel: UILabel!
    @IBOutlet weak var homeTeamFinalScoreLabel: UILabel!
    
    @IBOutlet weak var teamsSegmentedControl: UISegmentedControl!
    @IBOutlet weak var awayTeamContainerView: UIView!
    @IBOutlet weak var homeTeamContainerView: UIView!
    
    
    //MARK: - PROPERTIES
    var statsViewModel: StatsDetailViewModel!
    
    //MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        changeViews()
    }
    
    
    @IBAction func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        changeViews()
    }
    
    func configureUI() {
        DispatchQueue.main.async {
            guard let game = self.statsViewModel.game else { return }
            self.awayTeamLogoImageView.fetchLogoImage(forTeamID: game.awayTeamID)
            self.awayTeamNameLabel.text = game.awayTeamName
            self.awayTeamQ1ScoreLabel.text = "\(game.awayTeamScoreByQtr[0])"
            self.awayTeamQ2ScoreLabel.text = "\(game.awayTeamScoreByQtr[1])"
            self.awayTeamQ3ScoreLabel.text = "\(game.awayTeamScoreByQtr[2])"
            self.awayTeamQ4ScoreLabel.text = "\(game.awayTeamScoreByQtr[3])"
            self.awayTeamFinalScoreLabel.text = "\(game.awayTeamFinalScore)"
            self.homeTeamLogoImageView.fetchLogoImage(forTeamID: game.homeTeamID)
            self.homeTeamNameLabel.text = game.homeTeamName
            self.homeTeamQ1ScoreLabel.text = "\(game.homeTeamScoreByQtr[0])"
            self.homeTeamQ2ScoreLabel.text = "\(game.homeTeamScoreByQtr[1])"
            self.homeTeamQ3ScoreLabel.text = "\(game.homeTeamScoreByQtr[2])"
            self.homeTeamQ4ScoreLabel.text = "\(game.homeTeamScoreByQtr[3])"
            self.homeTeamFinalScoreLabel.text = "\(game.homeTeamFinalScore)"
            self.teamsSegmentedControl.setTitle(self.statsViewModel.game?.awayTeamName, forSegmentAt: 0)
            self.teamsSegmentedControl.setTitle(self.statsViewModel.game?.homeTeamName, forSegmentAt: 1)
        }
    }
    
    
    func changeViews() {
        let selectedIndex = teamsSegmentedControl.selectedSegmentIndex
        switch selectedIndex {
        case 0:
            awayTeamContainerView.isHidden = false
            homeTeamContainerView.isHidden = true
        case 1:
            awayTeamContainerView.isHidden = true
            homeTeamContainerView.isHidden = false
        default:
            break
        }
    }
}
