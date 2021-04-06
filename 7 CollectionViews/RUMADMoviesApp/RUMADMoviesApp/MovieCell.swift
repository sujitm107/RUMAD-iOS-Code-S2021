//
//  MovieCell.swift
//  RUMADMoviesApp
//
//  Created by Sujit Molleti on 3/30/21.
//

import UIKit

class MovieCell: UICollectionViewCell {
    
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    
    func setUpCell(movie: Movie){
        self.movieNameLabel.text = movie.name
        self.posterImageView.image = movie.image
    }
}
