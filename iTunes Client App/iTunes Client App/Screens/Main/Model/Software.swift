//
//  Software.swift
//  iTunes Client App
//
//  Created by Ömer Faruk Kazar on 10.10.2022.
//

import Foundation

struct Software: Decodable {
    let artistName: String?
    let collectionName: String?
    let artworkLarge: URL?
    let releaseDate: String?
    let country: String?
    let primaryGenreName: String?
    
    enum CodingKeys: String, CodingKey {
        case artistName
        case collectionName
        case artworkLarge = "artworkUrl100"
        case releaseDate
        case country
        case primaryGenreName
    }
}

