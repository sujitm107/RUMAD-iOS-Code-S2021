//
//  movieCell.swift
//  moviesApp
//
//  Created by Sujit Molleti on 3/30/21.
//

import UIKit

class MovieCell: UICollectionViewCell {
    @IBOutlet weak var moviePosterImageView: UIImageView!
    @IBOutlet weak var movieNameLabel: UILabel!
    
    func setUpCell(movie: Movie){
        moviePosterImageView.image = movie.image
        movieNameLabel.text = movie.name
    }
    
}
