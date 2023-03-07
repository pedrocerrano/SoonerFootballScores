//
//  GamesListVC.swift
//  SoonerFootballScores
//
//  Created by iMac Pro on 3/7/23.
//

import UIKit

class GamesListVC: UIViewController {

    //MARK: - OUTLETS
    @IBOutlet weak var seasonGameListTableView: UITableView!
    
    
    //MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        seasonGameListTableView.dataSource = self
        viewModel = GamesListViewModel(delegate: self)
    }
    
    
    //MARK: - PROPERTIES
    var viewModel: GamesListViewModel!


    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    }
} //: CLASS


//MARK: - EXT: TableView DataSource
extension GamesListVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.games.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = seasonGameListTableView.dequeueReusableCell(withIdentifier: "gameCell", for: indexPath) as? GameTableViewCell else { return UITableViewCell() }
        cell.selectionStyle = .none
        
        let game = viewModel.games[indexPath.row]
        cell.configureUI(forGame: game)

        
        return cell
    }
} //: EXT DataSource


//MARK: - EXT: DELEGATE
extension GamesListVC: GamesListViewDelegate {
    func gamesLoadedSuccessfully() {
        DispatchQueue.main.async {
            self.seasonGameListTableView.reloadData()
        }
    }
    
    func encountered(_ error: NetworkError) {
        let alertController = UIAlertController(title: "Network Error", message: error.errorDescription, preferredStyle: .alert)
        let closeAction     = UIAlertAction(title: "Cancel", style: .cancel)
        alertController.addAction(closeAction)
        DispatchQueue.main.async {
            self.present(alertController, animated: true)
        }
    }
} //: EXT Delegate
