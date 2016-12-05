//
//  SMEthnicityCreateViewController.swift
//  surveyApp
//
//  Created by Annette Chen on 12/3/16.
//  Copyright © 2016 Annette Chen. All rights reserved.
//

import Foundation
import Alamofire

class SMEthnicityCreateViewController: UIViewController {
    @IBOutlet weak var hispanic: UIButton!
    @IBOutlet weak var indian: UIButton!
    @IBOutlet weak var asian: UIButton!
    @IBOutlet weak var african_american: UIButton!
    @IBOutlet weak var pacific_islander: UIButton!
    @IBOutlet weak var white: UIButton!
    
    let restriction = Restriction()
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    @IBAction func hispanicTapped(sender: AnyObject){
        toggleButton(button: hispanic, index: 0)
    }
    @IBAction func indianTapped(sender: AnyObject){
        toggleButton(button: indian, index: 1)
    }
    @IBAction func asianTapped(sender: AnyObject){
        toggleButton(button: asian, index: 2)
    }
    @IBAction func afamericanTapped(sender: AnyObject){
        toggleButton(button: african_american, index: 3)
    }
    @IBAction func pacislanderTapped(sender: AnyObject){
        toggleButton(button: pacific_islander, index: 4)
    }
    @IBAction func whiteTapped(sender: AnyObject){
        toggleButton(button: white, index: 5)
    }
    
    func toggleButton(button:UIButton, index:Int){
        if(button.titleColor(for: .normal) == UIColor.gray){
            button.setTitleColor(UIColor.blue, for: .normal)
            restriction.ethnicityRestriction[index] = true
        } else {
            button.setTitleColor(UIColor.gray, for: .normal)
            restriction.ethnicityRestriction[index] = false
        }
    }

    @IBAction func surveyEthnicityNext(){
        
    }
}
