//
//  ViewController.swift
//  MVC+Delegation-Review-Lab
//
//  Created by Benjamin Stone on 8/19/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var theMovie = Movie.allMovies
    
    
    var newFontSize: CGFloat? = 20{
        // give the font a start value
        didSet{
            tableView.reloadData()
            // adds the data to file
            
        }
}
  
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        // tableView.delegate = self
        loadData()
    }

    func loadData() {
        // want the movie to be all of the movies and then add into all of the movies
        theMovie = Movie.allMovies //??? will this work
    }
    
    //we need to make a UNWIND segue only...
    
    @IBAction func updateUIFromUnwindSegue(segue: UIStoryboardSegue ){
        guard let detailsViewController = segue.source as? DetailsViewController else {
            return
        }
        newFontSize = detailsViewController.currentFontSize
    }

}

extension ViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     return theMovie.count
    }
    
    // populated the data that comes in from the above variable
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath)
        
        // Movie.swift file is only an array of movies
        // remember that row is for only one array
        // if you do section then it needs to be an array of arrays
        
        let specificMovie = theMovie[indexPath.row]
        
        // changes the text
        cell.textLabel?.text = specificMovie.name
        //changes the font
         cell.textLabel?.font = UIFont(name: "times new roman", size: newFontSize!)
        
        //changes the text
        cell.detailTextLabel?.text = specificMovie.year.description
       
        //changes the font
        // need to add the name of the font and size of the font
        cell.detailTextLabel?.font = UIFont(name:  "times new roman", size: newFontSize!)
        
        /*
         /
        else {
            fatalError("couldn't dequeue properly for the cell ")
        }
        */
        return cell
            }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // this give the number of sections of the file
        return theMovie.count
    }
    
    
}

