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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = movie?.name
        self.posterImageView.image = movie?.image
    }
    

}
