//
//  AwayTeamStatsVC.swift
//  SoonerFootballScores
//
//  Created by iMac Pro on 3/12/23.
//

import UIKit

class AwayTeamStatsVC: UIViewController {
    
    //MARK: - OUTLETS
    @IBOutlet weak var statAwayPassingTDLabel: UILabel!
    @IBOutlet weak var statAwayRushingTDLabel: UILabel!
    @IBOutlet weak var statAwayFirstDowns: UILabel!
    @IBOutlet weak var statAwayTotalYards: UILabel!
    @IBOutlet weak var statAwayPassingYards: UILabel!
    @IBOutlet weak var statAwayRushingYards: UILabel!
    @IBOutlet weak var statAwayPeanaltiesYards: UILabel!
    @IBOutlet weak var statAwayInterceptions: UILabel!
    @IBOutlet weak var statAwayFumbles: UILabel!
    @IBOutlet weak var statAwayFumblesRecovered: UILabel!
    @IBOutlet weak var statAwayTackles: UILabel!
    @IBOutlet weak var statAwaySacks: UILabel!
    @IBOutlet weak var statAwayTimeOfPossession: UILabel!
    
    
    //MARK: - PROPERTIES
    var statsViewModel: StatsDetailViewModel!
    

    //MARK: - FUNCTIONS
    func configure(with team: Team) {
        for stat in team.stats {
            if stat.category == "passingTDs" {
                self.statAwayPassingTDLabel.text = stat.statValue
            }
            
            if stat.category == "rushingTDs" {
                self.statAwayRushingTDLabel.text = stat.statValue
            }
            
            if stat.category == "firstDowns" {
                
            }
            
            if stat.category == "totalYards" {
                
            }
            
            if stat.category == "netPassingYards" {
                
            }
            
            if stat.category == "rushingYards" {
                
            }
            
            if stat.category == "totalPenaltiesYards" {
                
            }
            
            if stat.category == "interceptions" {
                
            }
            
            if stat.category == "totalFumbles" {
                
            }
            
            if stat.category == "fumblesRecovered" {
                
            }
            
            if stat.category == "tackles" {
                
            }
            
            if stat.category == "sacks" {
                
            }
            
            if stat.category == "possessionTime" {
                
            }
        }
//        loadViewIfNeeded()
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
