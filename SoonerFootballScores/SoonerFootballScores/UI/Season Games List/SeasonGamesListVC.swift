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
    }
    


    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    }
} //: CLASS


//MARK: - EXT: TableView DataSource
extension SeasonGamesListVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = seasonGameListTableView.dequeueReusableCell(withIdentifier: "gameCell", for: indexPath) as? SeasonGameTableViewCell else { return UITableViewCell() }
        
        return cell
    }
}
