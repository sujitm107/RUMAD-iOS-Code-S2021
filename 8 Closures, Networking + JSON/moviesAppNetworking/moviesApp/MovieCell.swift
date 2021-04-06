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
    
    //should store in a constants class
    let imagePathPrefix: String = "https://image.tmdb.org/t/p/w500"
    
    func setUpCell(movie: Movie){
        if movie.imagePath != nil{
            moviePosterImageView.load(url: URL(string: "\(imagePathPrefix)\(movie.imagePath!)")!)
        } else {
            moviePosterImageView.image = UIImage(systemName: "film")
        }
        movieNameLabel.text = movie.name
    }
    
}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
