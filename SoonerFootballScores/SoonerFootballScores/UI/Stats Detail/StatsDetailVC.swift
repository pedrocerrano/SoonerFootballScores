//
//  StatsDetailVC.swift
//  SoonerFootballScores
//
//  Created by iMac Pro on 3/12/23.
//

import UIKit

class StatsDetailVC: UIViewController {

    //MARK: - OUTLETS
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
