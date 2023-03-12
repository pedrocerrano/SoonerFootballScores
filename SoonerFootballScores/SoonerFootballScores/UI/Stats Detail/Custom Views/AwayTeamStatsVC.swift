//
//  AwayTeamStatsVC.swift
//  SoonerFootballScores
//
//  Created by iMac Pro on 3/12/23.
//

import UIKit

class AwayTeamStatsVC: UIViewController {
    
    //MARK: - OUTLETS
    @IBOutlet weak var statAwayPassingTDsLabel: UILabel!
    @IBOutlet weak var statAwayRushingTDsLabel: UILabel!
    @IBOutlet weak var statAwayFirstDownsLabel: UILabel!
    @IBOutlet weak var statAwayTotalYardsLabel: UILabel!
    @IBOutlet weak var statAwayPassingYardsLabel: UILabel!
    @IBOutlet weak var statAwayRushingYardsLabel: UILabel!
    @IBOutlet weak var statAwayPenaltiesYardsLabel: UILabel!
    @IBOutlet weak var statAwayInterceptionsLabel: UILabel!
    @IBOutlet weak var statAwayFumblesLabel: UILabel!
    @IBOutlet weak var statAwayFumblesRecoveredLabel: UILabel!
    @IBOutlet weak var statAwayTacklesLabel: UILabel!
    @IBOutlet weak var statAwaySacksLabel: UILabel!
    @IBOutlet weak var statAwayTimeOfPossessionLabel: UILabel!
    
    
    //MARK: - PROPERTIES
    var statsViewModel: StatsDetailViewModel!
    

    //MARK: - FUNCTIONS
    func configure(with team: Team) {
        for stat in team.stats {
            switch stat.category {
            case "passingTDs":
                self.statAwayPassingTDsLabel.text = stat.statValue
            case "rushingTDs":
                self.statAwayRushingTDsLabel.text = stat.statValue
            case "firstDowns":
                self.statAwayFirstDownsLabel.text = stat.statValue
            case "totalYards":
                self.statAwayTotalYardsLabel.text = stat.statValue
            case "netPassingYards":
                self.statAwayPassingYardsLabel.text = stat.statValue
            case "rushingYards":
                self.statAwayRushingYardsLabel.text = stat.statValue
            case "totalPenaltiesYards":
                self.statAwayPenaltiesYardsLabel.text = stat.statValue
            case "interceptions":
                self.statAwayInterceptionsLabel.text = stat.statValue
            case "totalFumbles":
                self.statAwayFumblesLabel.text = stat.statValue
            case "fumblesRecovered":
                self.statAwayFumblesRecoveredLabel.text = stat.statValue
            case "tackles":
                self.statAwayTacklesLabel.text = stat.statValue
            case "sacks":
                self.statAwaySacksLabel.text = stat.statValue
            case "possessionTime":
                self.statAwayTimeOfPossessionLabel.text = stat.statValue
            default:
                break
            }
        }
    }
} //: CLASS


//MARK: - EXT: AwayTeamDelegate
extension AwayTeamStatsVC: StatsDetailViewModelDelegate {
    func statsLoadedSuccessfully() {
        if let awayTeam = statsViewModel.awayTeam {
            configure(with: awayTeam)
        }
    }
}
