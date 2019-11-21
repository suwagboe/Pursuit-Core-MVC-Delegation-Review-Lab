//
//  DetailsViewController.swift
//  MVC+Delegation-Review-Lab
//
//  Created by World Domination a Brand on 11/20/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var sliderLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var stepperLabel: UILabel!
    
//    var stepperNum: Double {
//
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureStepper()
    }
    
    func configureSlider(){
        
    }
    
    func configureStepper() {
        stepper.minimumValue = 0.0
        stepper.maximumValue = 10.0
        stepper.stepValue = 1.0
        
        //default stepper value
        stepper.value = 5.0
    }
    
    //MARK: actions and methods
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        var sliderchanged = sender.value
    }
    
    @IBAction func stepperChanged(_ sender: UIStepper) {
        var stepperValue = sender.value
    }
    

}
