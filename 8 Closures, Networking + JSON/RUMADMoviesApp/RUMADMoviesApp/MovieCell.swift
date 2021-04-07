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
        
        if movie.image != nil{
            let poster_path = "https://image.tmdb.org/t/p/w500\(movie.image!)"
            self.posterImageView.load(url: URL(string: poster_path)!)
        } else {
            self.posterImageView.image = UIImage(systemName: "film")
        }
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

