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
        
//        [Movie]? {
//        didSet {
//            // what will the didSet do once it gets the data
//            tableView.reloadData()
//        }
//    }
    
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
    
    

    
}

extension ViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     return theMovie.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath)
        
        // Movie.swift file is only an array of movies
        let specificMovie = theMovie[indexPath.section]
        
        
        cell.textLabel?.text = specificMovie.name
        cell.detailTextLabel?.text = specificMovie.year.description
        
        /*
         /
        else {
            fatalError("couldn't dequeue properly for the cell ")
        }
        */
        return cell
            }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return theMovie.count
    }
    
    
}

