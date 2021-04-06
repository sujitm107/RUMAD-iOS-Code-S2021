//
//  ViewController.swift
//  moviesApp
//
//  Created by Sujit Molleti on 3/25/21.
//

import UIKit

struct Movie {
    var name: String
    var imagePath: String?
}


private let itemsPerRow: CGFloat = 3

private let insets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)



class ViewController: UIViewController {
    
    let cellReuseIdentifier = "movieCell"
    let moviesToDetailSegueIdentifier = "moviesToDetail"
    
    //    let movieNames: [String] = ["Shiva Baby", "Mortal Kombat", "The Oak Room", "Gorilla vs Kong", "Concrete Cowboy", "Voyagers", "WeWork", "Every Breath You Take", "French Exit", "Thunder Force", "Minari"]
    
    var movies: [Movie] = []

    @IBOutlet weak var movieCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Movies"
        
        movieCollectionView.delegate = self
        movieCollectionView.dataSource = self
        
//        for i in 1...movieNames.count{
//            movies.append(Movie(name: movieNames[i-1], image: UIImage(named: "image\(i)")!))
//        }
        
        
        
    }
    
    func fetchData(query: String, completion: @escaping(TMDBJson) -> ()){
        
        let query: String = query
        let apiKey: String = "16e92ffa33aa7ac4b26b0227a52c3316"
        
        let urlStr = "https://api.themoviedb.org/3/search/movie/?api_key=\(apiKey)&language=en-US&query=\(query)&page=1&include_adult=false"
        
        print(urlStr)
        
        guard let url = URL(string: urlStr) else { return }
        
        let request = URLRequest(url: url)
        
        let session = URLSession.shared
        
        session.dataTask(with: request) { (data, response, error) in
            if error == nil {
                if data != nil {
                    
                    let jsonDecoder = JSONDecoder()
                    do {
                        let jsonData = try jsonDecoder.decode(TMDBJson.self, from: data!)
                        completion(jsonData)
                    } catch {
                        print("error decoding data")
                    }
                    
                } else {
                    print("error fetching data")
                }
            } else {
                print("Error with network request")
            }
            
        }.resume()
        
        
        
    }


}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    
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
        
        //itemsPerRow + 1 -- number of gaps
        let paddingSpace = insets.left * (itemsPerRow + 1)
        
        let availableWidth = self.view.frame.width - paddingSpace
        
        let widthPerItem = availableWidth/itemsPerRow
        
        return CGSize(width: widthPerItem, height: 250)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return insets
    }
        
        
        
}

extension ViewController: UISearchBarDelegate{
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        
        
        let text: String = searchBar.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if text == "" { return }
        
                
        fetchData (query: text) { (TMDBJson) in
            
            DispatchQueue.main.async {
                let results = TMDBJson.results
                
                var moviesTemp: [Movie] = []
                
                for item in results {
                    //if item.poser_path is nil then
                    
                    let imagePath = item.poster_path ?? nil
                    
                    moviesTemp.append(Movie(name: item.original_title!, imagePath: imagePath))
                }
                
                self.movies = moviesTemp
                self.movieCollectionView.reloadData()
            }
        }
    }
    
    
}



