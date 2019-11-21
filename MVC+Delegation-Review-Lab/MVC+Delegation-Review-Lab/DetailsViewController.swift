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
    
    var currentFontSize: CGFloat? = 18
    
    
    // it is the font size??
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureStepper()
        configureSlider()
    }
    
    func configureSlider(){
        slider.minimumValue = 0.0
        slider.maximumValue = 50.0
        //?? 

        // default value
        slider.value = 5.0
    }
    
    
    func configureStepper() {
        stepper.minimumValue = 0.0
        stepper.maximumValue = 50.0
        stepper.stepValue = 1.0

        //default stepper value
        stepper.value = 5.0
    }
    
    //MARK: actions and methods
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        
        // the value of the actual slider is equal to the sender value
        slider.value = Float(sender.value)
        
        // makes the current font size equal to the size inside of actual view controller.
        currentFontSize = CGFloat(sender.value)
        stepperLabel.text = "Preview Font Size: \(String(describing: currentFontSize)) "
        
    }
    
    @IBAction func stepperChanged(_ sender: UIStepper) {
        stepper.value = sender.value
        currentFontSize = CGFloat(sender.value)
        stepperLabel.text = "Preview Font Size: \(String(describing: currentFontSize)) "
    }

}
