//
//  Model.swift
//  moviesApp
//
//  Created by Sujit Molleti on 4/3/21.
//

import Foundation

struct TMDBJson: Codable{
    var page: Int?
    var results: [TMDBResult]
}

struct TMDBResult: Codable{
    var original_title: String?
    var poster_path: String?
}
