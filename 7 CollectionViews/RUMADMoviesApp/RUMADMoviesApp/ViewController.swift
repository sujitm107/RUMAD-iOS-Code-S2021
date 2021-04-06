//
//  ViewController.swift
//  RUMADMoviesApp
//
//  Created by Sujit Molleti on 3/30/21.
//

import UIKit

struct Movie{
    var name: String
    var image: UIImage
}

let itemsPerRow:CGFloat = 3

let insets: UIEdgeInsets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)

class ViewController: UIViewController {
    
    let cellReuseIdentifier: String = "movieCell"
    
    let moviesToDetailSegueIdentifier: String = "moviesToDetail"

    @IBOutlet weak var moviesCollectionView: UICollectionView!
    
    let movieTitles: [String] = ["Sound Of Music", "Mean Girls", "Mortal Kombat", "The Oak Room", "Gorilla vs Kong", "Concrete Cowboy", "Tom & Jerry", "WeWork", "Every Breath You Take", "French Exit", "Thunder Force", "Minari", "The Queen's Gambit", "Raya", "The Courier"]
    
    var movies: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        moviesCollectionView.delegate = self
        moviesCollectionView.dataSource = self
        
        for i in 0..<movieTitles.count{
            movies.append(Movie(name: movieTitles[i], image: UIImage(named: "image\(i)")!))
        }
        
    }


}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    
    //numberOfSections
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    //numberOfItemsPerSection
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieTitles.count
    }
    
        //cellForItemAt
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier, for: indexPath) as! MovieCell
        
        cell.setUpCell(movie: movies[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: moviesToDetailSegueIdentifier, sender: movies[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == moviesToDetailSegueIdentifier{
            let vc = segue.destination as! DetailViewController
            vc.movie = sender as! Movie
        }
    }
    
}

extension ViewController: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let paddingSpace = (itemsPerRow + 1) * insets.left
        
        let availableWidth = self.view.frame.width - paddingSpace
        
        let widthPerItem = (availableWidth / itemsPerRow)
        
        return CGSize(width: widthPerItem, height: 220)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return insets
    }
    
}

