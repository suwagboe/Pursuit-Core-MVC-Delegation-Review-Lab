//
//  SettingsViewController.swift
//  MVC delegations Review Lab
//
//  Created by Pursuit on 1/27/20.
//  Copyright © 2020 Pursuit. All rights reserved.
//

import UIKit

class SettingsViewController: UITabBarController {
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var sampleSizeLabel: UILabel!
    @IBOutlet weak var numberOfFontSize: UILabel!
    
    @IBOutlet weak var sliderUpdateLabel: UILabel!
    
    
    @IBOutlet weak var stepperUpdateLabel: UILabel!
    
    
    var fontSize = 17

    override func viewDidLoad() {
        super.viewDidLoad()
        configureSettings()
    }
    
    func configureSettings() {
        
        slider.minimumValue = 0
        slider.maximumValue = 30
        stepper.minimumValue = 0
        stepper.maximumValue = 30
        
        
        slider.value = Float(fontSize)
        slider.value = Float(fontSize)
    }
    
    func valuesChanged() {
        
        
    }
    
    
    
    
    @IBAction func sliderAction(_ sender: UISlider) {
        
        
    }
    
    
    
    
    @IBAction func stepperAction(_ sender: UIStepper) {
        
        
        
    }
    
    
    
}
