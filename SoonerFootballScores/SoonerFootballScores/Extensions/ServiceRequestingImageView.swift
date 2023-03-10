//
//  ServiceRequestingImageView.swift
//  SoonerFootballScores
//
//  Created by iMac Pro on 3/10/23.
//

import UIKit

class ServiceRequestingImageView: UIImageView {

    func fetchImage(using url: URL) {
        let service = APIService()
        let request = URLRequest(url: url)
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
