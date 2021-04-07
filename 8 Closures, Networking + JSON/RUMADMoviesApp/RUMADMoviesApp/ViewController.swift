//
//  ViewController.swift
//  RUMADMoviesApp
//
//  Created by Sujit Molleti on 3/30/21.
//

import UIKit

//Past Movie Object
//struct Movie{
//    var name: String
//    var image: UIImage
//}

struct Movie {
    var name: String?
    var image: String?
}

let itemsPerRow:CGFloat = 3

let insets: UIEdgeInsets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)

class ViewController: UIViewController {
    
    let cellReuseIdentifier: String = "movieCell"
    
    let moviesToDetailSegueIdentifier: String = "moviesToDetail"

    @IBOutlet weak var moviesCollectionView: UICollectionView!
    @IBOutlet weak var moviesSearchBar: UISearchBar!
    
    let movieTitles: [String] = ["Sound Of Music", "Mean Girls", "Mortal Kombat", "The Oak Room", "Gorilla vs Kong", "Concrete Cowboy", "Tom & Jerry", "WeWork", "Every Breath You Take", "French Exit", "Thunder Force", "Minari", "The Queen's Gambit", "Raya", "The Courier"]
    
    var movies: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        moviesCollectionView.delegate = self
        moviesCollectionView.dataSource = self
        
        moviesSearchBar.delegate = self
        
//        for i in 0..<movieTitles.count{
//            movies.append(Movie(name: movieTitles[i], image: UIImage(named: "image\(i)")!))
//        }
        
        
        
    }
    
    func fetchJSON(completion: @escaping (MoviesJSON) -> ()){
        //Where do we want to get our info from?
        let apikey = "16e92ffa33aa7ac4b26b0227a52c3316"
        
        let query = "avengers"
        
        let urlstr = "https://api.themoviedb.org/3/search/movie?api_key=\(apikey)&language=en-US&query=\(query)&page=1&include_adult=false"
        
        
        guard let url = URL(string: urlstr) else { return }
        
        let request = URLRequest(url: url)
        
        let session = URLSession.shared
        
        
        session.dataTask(with: request) { (data, response, error) in
            if error == nil{
                //don't have error making request
                if data != nil {
                    //We have data
                    let decoder = JSONDecoder()
                    
                    do {
                        let jsonData = try decoder.decode(MoviesJSON.self, from: data!)
                        completion(jsonData)
                    } catch {
                        print("Error decoding object")
                    }
                    
                } else {
                    print("Error fetching data")
                }
                
            } else {
                print("Error making request: \(error)")
            }
        }.resume()
        
        
        
    }


}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    
    //numberOfSections
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    //numberOfItemsPerSection
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
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

extension ViewController: UISearchBarDelegate{
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        guard let text = searchBar.text else {return}
        
        if text.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return
        }
        
        let searchText = text.trimmingCharacters(in: .whitespacesAndNewlines)
        
        makeSearchQuery(query: searchText)
    }
    
    func makeSearchQuery(query: String){
        
        fetchJSON{ (jsondata) in
            
            DispatchQueue.main.async {
                guard let results = jsondata.results else { return }
                
                for item in results {
                    self.movies.append(Movie(name: item.original_title, image: item.poster_path))
                }
                
                self.moviesCollectionView.reloadData()
            }
            
        }
    }
    
}

