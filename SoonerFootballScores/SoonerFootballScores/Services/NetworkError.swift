//
//  NetworkError.swift
//  SoonerFootballScores
//
//  Created by iMac Pro on 3/7/23.
//

import Foundation

enum NetworkError: LocalizedError {
    
    case invalidURL
    case thrownError(Error)
    case noData
    case unableToDecode
    case emptyArray
    case invalidStatusCode
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid URL. Check your endpoint."
        case .thrownError(let error):
            return "Thrown error: \(error.localizedDescription)"
        case .noData:
            return "No data received from successful network fetch."
        case .unableToDecode:
            return "Unable to decode model object from data."
        case .emptyArray:
            return "Unable to retrieve Game from array."
        case .invalidStatusCode:
            return "Fetch returned an unsuccessful Status Code. Code was not 200."
        }
    }
}
