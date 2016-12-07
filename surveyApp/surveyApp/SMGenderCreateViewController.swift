//
//  SMGenderCreateViewController.swift
//  surveyApp
//
//  Created by Annette Chen on 12/3/16.
//  Copyright © 2016 Annette Chen. All rights reserved.
//

import Foundation
import Alamofire

class SMGenderCreateViewController: UIViewController {
    @IBOutlet weak var male: UIButton!
    @IBOutlet weak var female: UIButton!
    @IBOutlet weak var other: UIButton!
    
    var restriction = Restriction()
    var survey: Survey?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        male.setTitleColor(UIColor.gray, for: .normal)
        female.setTitleColor(UIColor.gray, for: .normal)
        other.setTitleColor(UIColor.gray, for: .normal)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    @IBAction func maleTapped(sender: AnyObject){
        toggleButton(button: male, index: 0)
    }

    @IBAction func femaleTapped(sender: AnyObject){
        toggleButton(button: female, index: 1)
    }

    @IBAction func otherTapped(sender: AnyObject){
        toggleButton(button: other, index: 2)
    }
    
    func toggleButton(button:UIButton, index:Int){
        if(button.titleColor(for: .normal) == UIColor.gray){
            button.setTitleColor(UIColor.blue, for: .normal)
            restriction.genderRestriction[index] = true
        } else {
            button.setTitleColor(UIColor.gray, for: .normal)
            restriction.genderRestriction[index] = false
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toAgeCreate" {
            if let ageCreateVC = segue.destination as? SMAgeCreateViewController{
                ageCreateVC.restriction = restriction
                ageCreateVC.survey = survey
            }
        }
    }
    
    

}
