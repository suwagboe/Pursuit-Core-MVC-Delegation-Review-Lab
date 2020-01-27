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
    
     var TheMovies = Movie.allMovies

    
    var fontSize: CGFloat? = 10 {
        // making optional to see if there is a value
        didSet {
            // when the size changes you want the tableView to change.
            tableView.reloadData()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        loadData()
    }
    
    
   private func loadData() {
        TheMovies = Movie.allMovies
    }
    
    // function to segue programatically.
    private func settingSegue() {
           guard let settingsController = storyboard?.instantiateViewController(identifier: "SettingsViewController") as? SettingsViewController else {
               fatalError("it is not seguing properly..")
           }
        settingsController.settingFontSize = Double(fontSize!)
        settingsController.delegate = self
       
       present(settingsController, animated: true)
        
        // you want to make a seperate reference to the protocol in order to access the info
      
        //why is the delegate here...
        // delegate will get called... whenever you move between segues so even when you move from the second view to the first one this function will get called
            // settingsController.delegate?.changeFontSize() = self
        
       }
    
    
    @IBAction func settingButton(_ sender: UIBarButtonItem) {
        
        settingSegue()
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        guard let settingVC = segue.destination as? SettingsViewController else {
//            fatalError("The segue isnt working properly.")
//        }
//       // settingVC.delegate = self
//
//        // didSet only listens...
//        // delegate talks and listens to changes..
//        // telling it to watch itself?? or watch whatever is called on the delegate of this functions
//    }
}


extension ViewController: UITableViewDataSource, changingTheFontDelegate {
    func changeFontSize(_ sender: SettingsViewController, font: CGFloat) {
        
        fontSize = CGFloat(font)
    }
    
    // I know this is to populate the data.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TheMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath)
        
        let getaccessto = TheMovies[indexPath.row]
        
        cell.textLabel?.text = getaccessto.name
        cell.detailTextLabel?.text = getaccessto.genre
        
        //cell.textLabel?.font = UIFont(name: "Times New Roman", size: fontSize!)
        cell.textLabel?.font = cell.textLabel?.font.withSize(fontSize!)
        cell.detailTextLabel?.font = cell.detailTextLabel?.font.withSize(fontSize!)
        return cell
    }
    
}


