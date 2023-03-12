//
//  HomeTeamStatsVC.swift
//  SoonerFootballScores
//
//  Created by iMac Pro on 3/12/23.
//

import UIKit

class HomeTeamStatsVC: UIViewController {
    
    //MARK: - OUTLETS
    @IBOutlet weak var statHomePassingTDs: UILabel!
    @IBOutlet weak var statHomeRushingTDs: UILabel!
    @IBOutlet weak var statHomeFirstDowns: UILabel!
    @IBOutlet weak var statHomeTotalYards: UILabel!
    @IBOutlet weak var statHomePassingYards: UILabel!
    @IBOutlet weak var statHomeRushingYards: UILabel!
    @IBOutlet weak var statHomePenaltiesYards: UILabel!
    @IBOutlet weak var statHomeInterceptions: UILabel!
    @IBOutlet weak var statHomeFumbles: UILabel!
    @IBOutlet weak var statHomeFumblesRecovered: UILabel!
    @IBOutlet weak var statHomeTackles: UILabel!
    @IBOutlet weak var statHomeSacks: UILabel!
    @IBOutlet weak var statHomeTimeOfPOssession: UILabel!

    //MARK: - PROPERTIES
    var statsViewModel: StatsDetailViewModel!
    
    
    //MARK: - FUNCTIONS
    func configure(with team: Team) {
        for stat in team.stats {
            if stat.category == "passingTDs" {
                
            }
            
            if stat.category == "rushingTDs" {
                
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
    }
}


//MARK: - EXT: HomeTeamDelegate
extension HomeTeamStatsVC: StatsDetailViewModelDelegate {
    func statsLoadedSuccessfully() {
        if let homeTeam = statsViewModel.homeTeam {
            configure(with: homeTeam)
        }
    }
}
