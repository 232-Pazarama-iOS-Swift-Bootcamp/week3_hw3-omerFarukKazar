//
//  MovieRequest.swift
//  iTunes Client App
//
//  Created by Ömer Faruk Kazar on 10.10.2022.
//

import Foundation

struct MovieRequest: DataRequest {

    var baseURL: String {
        "https://itunes.apple.com"
    }

    var url: String {
        "/search"
    }

    var queryItems: [String : String] {
        ["term": "Movie"]
    }

    var method: HTTPMethod {
        .get
    }

    func decode(_ data: Data) throws -> MovieResponse {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let response = try decoder.decode(MovieResponse.self, from: data)
        return response
    }
}
