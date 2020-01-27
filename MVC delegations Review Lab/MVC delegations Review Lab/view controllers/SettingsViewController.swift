//
//  SettingsViewController.swift
//  MVC delegations Review Lab
//
//  Created by Pursuit on 1/27/20.
//  Copyright © 2020 Pursuit. All rights reserved.
//

import UIKit

// this is the delegate == and also a protocol
protocol changingTheFontDelegate: AnyObject {
    // where the action is happening... so this where the protocol goes.. can also be outside of this file.
    
    // class is a reference type.
    // a protocol method.
    // we call the protocol... which is the function
    func changeFontSize(_ sender: SettingsViewController, font: CGFloat)
    // this is looking for the font...
    
    
    // object where the action is happen and also the object that is sending the info to the delegate
    // this means to look at this place. // ask ches again if confused.
    // https://useyourloaf.com/blog/quick-guide-to-swift-delegates/
}

class SettingsViewController: UIViewController {
    
    // making an instance of the protocol/delegate to gain access to the function/protocol inside of it.
    weak var delegate: changingTheFontDelegate?
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var sampleSizeLabel: UILabel!
    @IBOutlet weak var numberOfFontSize: UILabel!
    
    @IBOutlet weak var sliderUpdateLabel: UILabel!
    
    
    @IBOutlet weak var stepperUpdateLabel: UILabel!
    
    
    var settingFontSize = 10.0{
        didSet {
            delegate?.changeFontSize(self, font: CGFloat(settingFontSize))
            // this is to watch when the font size changes.
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSettings()
    }
    
    func configureSettings() {
        // other slider configuration....
        slider.minimumValue = 0.0
        slider.maximumValue = 30.0
        slider.value = 10.0
        
        stepper.value = 10.0
        stepper.minimumValue = 0.0
        stepper.maximumValue = 30.0
        stepper.stepValue = 1
    }
  
    @IBAction func sliderAction(_ sender: UISlider) {
        settingFontSize = Double(sender.value)

        slider?.value = sender.value
        stepper?.value = Double(sender.value)
        sampleSizeLabel.text = "The size is now\(sender.value)"
           }
        
    
    @IBAction func stepperAction(_ sender: UIStepper) {
        settingFontSize = Double(sender.value)
        
        
        sampleSizeLabel.text = "The size is now\(sender.value)"
        stepper?.value = Double(sender.value)
        slider?.value = Float(sender.value)
    }
    
    
    
}
