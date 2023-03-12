//
//  LogoServiceForImageView.swift
//  SoonerFootballScores
//
//  Created by iMac Pro on 3/12/23.
//

import UIKit

class LogoServiceForImageView: UIImageView {

    func fetchLogoImage(forTeamID game: Int) {
        let service = APIService()
        
        guard let baseLogoURL = URL(string: Constants.SportsAPI.logosBaseURL),
              var urlComponents = URLComponents(url: baseLogoURL, resolvingAgainstBaseURL: true) else { return}
        urlComponents.path.append(String(game))
        guard let finalLogoURL = urlComponents.url?.appendingPathExtension("png") else { return }
        
        let request = URLRequest(url: finalLogoURL)
        service.perform(request) { result in
            switch result {
            case .success(let data):
                guard let image = UIImage(data: data) else { self.setDefaultImage() ; return }
                DispatchQueue.main.async {
                    self.image = image
                }
            case .failure(let error):
                print(error.errorDescription ?? "There was an issue finding your error, so I gave you this one.")
                self.setDefaultImage()
            }
        }
    }
    
    func setDefaultImage() {
        self.image = UIImage(systemName: "football.fill")
    }
}
