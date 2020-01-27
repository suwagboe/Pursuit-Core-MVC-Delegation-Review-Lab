//
//  ViewController.swift
//  MVC delegations Review Lab
//
//  Created by Pursuit on 1/27/20.
//  Copyright © 2020 Pursuit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
     var allMovies = Movie.allMovies

    
    var fontSize: CGFloat = 17 {
        didSet {
            // when the size changes you want the tableView to change.
            tableView.reloadData()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        loadData()
    }
    
    
    func loadData() {
        var allMovies = Movie.allMovies
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingVC = segue.destination as? SettingsViewController else {
            fatalError("The segue isnt working properly.")
        }
        //settingVC =
    }
    
    
}


extension ViewController: UITableViewDataSource {
    // I know this is to populate the data.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath)
        
        cell.textLabel?.text = allMovies.first?.name
        cell.detailTextLabel?.text = allMovies.first?.genre
        
        cell.textLabel?.font = UIFont(name: "times new roman", size: fontSize as! CGFloat)
        
        // need to apply the indexPath. 
        
        return cell
    }
    
}

extension ViewController: UITableViewDelegate {
    // what is the delegate for again?
    
    
}
