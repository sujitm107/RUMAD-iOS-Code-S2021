//
//  DetailViewController.swift
//  moviesApp
//
//  Created by Sujit Molleti on 3/30/21.
//

import UIKit

class DetailViewController: UIViewController {
    
    var movie: Movie?
    @IBOutlet weak var posterImageView: UIImageView!
    
    //Should Store in a constants class
    let imagePathPrefix: String = "https://image.tmdb.org/t/p/w500"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = movie?.name
        
        if movie!.imagePath != nil{
            posterImageView.load(url: URL(string: "\(imagePathPrefix)\(movie!.imagePath!)")!)
        } else {
            posterImageView.image = UIImage(systemName: "film")
        }
    }
    

}
