//
//  HomeTeamStatsVC.swift
//  SoonerFootballScores
//
//  Created by iMac Pro on 3/12/23.
//

import UIKit

class HomeTeamStatsVC: UIViewController {
    
    //MARK: - OUTLETS
    @IBOutlet weak var statHomePassingTDsLabel: UILabel!
    @IBOutlet weak var statHomeRushingTDsLabel: UILabel!
    @IBOutlet weak var statHomeFirstDownsLabel: UILabel!
    @IBOutlet weak var statHomeTotalYardsLabel: UILabel!
    @IBOutlet weak var statHomePassingYardsLabel: UILabel!
    @IBOutlet weak var statHomeRushingYardsLabel: UILabel!
    @IBOutlet weak var statHomePenaltiesYardsLabel: UILabel!
    @IBOutlet weak var statHomeInterceptionsLabel: UILabel!
    @IBOutlet weak var statHomeFumblesLabel: UILabel!
    @IBOutlet weak var statHomeFumblesRecoveredLabel: UILabel!
    @IBOutlet weak var statHomeTacklesLabel: UILabel!
    @IBOutlet weak var statHomeSacksLabel: UILabel!
    @IBOutlet weak var statHomeTimeOfPossessionLabel: UILabel!

    //MARK: - PROPERTIES
    var statsViewModel: StatsDetailViewModel!
    
    //MARK: - FUNCTIONS
    func configure(with team: Team) {
        for stat in team.stats {
            switch stat.category {
            case "passingTDs":
                self.statHomePassingTDsLabel.text = stat.statValue
            case "rushingTDs":
                self.statHomeRushingTDsLabel.text = stat.statValue
            case "firstDowns":
                self.statHomeFirstDownsLabel.text = stat.statValue
            case "totalYards":
                self.statHomeTotalYardsLabel.text = stat.statValue
            case "netPassingYards":
                self.statHomePassingYardsLabel.text = stat.statValue
            case "rushingYards":
                self.statHomeRushingYardsLabel.text = stat.statValue
            case "totalPenaltiesYards":
                self.statHomePenaltiesYardsLabel.text = stat.statValue
            case "interceptions":
                self.statHomeInterceptionsLabel.text = stat.statValue
            case "totalFumbles":
                self.statHomeFumblesLabel.text = stat.statValue
            case "fumblesRecovered":
                self.statHomeFumblesRecoveredLabel.text = stat.statValue
            case "tackles":
                self.statHomeTacklesLabel.text = stat.statValue
            case "sacks":
                self.statHomeSacksLabel.text = stat.statValue
            case "possessionTime":
                self.statHomeTimeOfPossessionLabel.text = stat.statValue
            default:
                break
            }
        }
    }
} //: CLASS


//MARK: - EXT: HomeTeamDelegate
extension HomeTeamStatsVC: StatsDetailViewModelDelegate {
    func statsLoadedSuccessfully() {
        if let homeTeam = statsViewModel.homeTeam {
            configure(with: homeTeam)
        }
    }
}
