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
    
    var restriction: Restriction?
    var survey: Survey?
    
    override func viewDidLoad() {
        print("ethnicity view controller....")
        print(restriction?.ageRestriction)
        setButtons()
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    @IBAction func hispanicTapped(sender: AnyObject){
        toggleButton(button: hispanic, index: 0)
        print(restriction?.ethnicityRestriction)

    }
    @IBAction func indianTapped(sender: AnyObject){
        toggleButton(button: indian, index: 1)
        print(restriction?.ethnicityRestriction)

    }
    @IBAction func asianTapped(sender: AnyObject){
        toggleButton(button: asian, index: 2)
        print(restriction?.ethnicityRestriction)

    }
    @IBAction func afamericanTapped(sender: AnyObject){
        toggleButton(button: african_american, index: 3)
        print(restriction?.ethnicityRestriction)

    }
    @IBAction func pacislanderTapped(sender: AnyObject){
        toggleButton(button: pacific_islander, index: 4)
        print(restriction?.ethnicityRestriction)

    }
    @IBAction func whiteTapped(sender: AnyObject){
        toggleButton(button: white, index: 5)
        print(restriction?.ethnicityRestriction)
    }
    
    func toggleButton(button:UIButton, index:Int){
        if(button.titleColor(for: .normal) == UIColor.gray){
            button.setTitleColor(UIColor.blue, for: .normal)
            restriction?.ethnicityRestriction[index] = true
        } else {
            button.setTitleColor(UIColor.gray, for: .normal)
            restriction?.ethnicityRestriction[index] = false
        }
    }

    func setButtons(){
        hispanic.setTitleColor(UIColor.gray, for: .normal)
        indian.setTitleColor(UIColor.gray, for: .normal)
        asian.setTitleColor(UIColor.gray, for: .normal)
        african_american.setTitleColor(UIColor.gray, for: .normal)
        pacific_islander.setTitleColor(UIColor.gray, for: .normal)
        white.setTitleColor(UIColor.gray, for: .normal)
    }
    
    @IBAction func surveyEthnicityNext(){
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("pps ethnicity...")
        print(restriction?.ethnicityRestriction)
        print(restriction?.ethnicityRestriction)
        if segue.identifier == "toLocationCreate" {
            if let locationCreateVC = segue.destination as? SMLocationCreateViewController{
                locationCreateVC.restriction = restriction!
                locationCreateVC.survey = survey
            }
        }
    }

}
