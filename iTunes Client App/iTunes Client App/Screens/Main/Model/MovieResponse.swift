//
//  MovieResponse.swift
//  iTunes Client App
//
//  Created by Ömer Faruk Kazar on 9.10.2022.
//

import Foundation

struct MovieResponse: Decodable {
    let resultCount: Int?
    let results: [Movie]?
}
