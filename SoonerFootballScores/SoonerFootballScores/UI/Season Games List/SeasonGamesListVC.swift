//
//  SeasonGamesListVC.swift
//  SoonerFootballScores
//
//  Created by iMac Pro on 3/7/23.
//

import UIKit

class SeasonGamesListVC: UIViewController {

    //MARK: - OUTLETS
    @IBOutlet weak var seasonGameListTableView: UITableView!
    
    
    //MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        seasonGameListTableView.dataSource = self
        fetchSeasonGamesList()
    }
    
    
    //MARK: - PROPERTIES
    var games: [SeasonGamesTopLevelDictionary] = []
    
    
    //MARK: - FUNCTIONS
    func fetchSeasonGamesList() {
        SeasonGamesListViewModel.fetchSeasonGamesList { result in
            switch result {
            case .success(let topLevel):
                self.games = topLevel
                DispatchQueue.main.async {
                    self.seasonGameListTableView.reloadData()
                }
            case .failure(let error):
                print(error.errorDescription ?? Constants.Error.unknownError)
            }
        }
    }


    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    }
} //: CLASS


//MARK: - EXT: TableView DataSource
extension SeasonGamesListVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return games.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = seasonGameListTableView.dequeueReusableCell(withIdentifier: "gameCell", for: indexPath) as? SeasonGameTableViewCell else { return UITableViewCell() }
        cell.selectionStyle = .none
        
        let game = games[indexPath.row]
        cell.updateUI(forGame: game)
        
        return cell
    }
}
