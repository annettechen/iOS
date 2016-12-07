//
//  SMAgeCreateViewController.swift
//  surveyApp
//
//  Created by Annette Chen on 12/3/16.
//  Copyright © 2016 Annette Chen. All rights reserved.
//

import Foundation
import Alamofire

class SMAgeCreateViewController: UIViewController {
    @IBOutlet weak var age_ub: UITextField!
    @IBOutlet weak var age_lb: UITextField!
    
    var restriction: Restriction?
    var survey: Survey?
    
    override func viewDidLoad() {
        print("age restriction...")
        print(restriction?.genderRestriction)
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    @IBAction func surveyAgeNext (){
//        restriction?.ageRestriction.append(Int(age_ub.text!)!)
//        restriction?.ageRestriction.append(Int(age_ub.text!)!)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        restriction?.ageRestriction[0] = (Int(age_lb.text!)!)
        restriction?.ageRestriction[1] = (Int(age_ub.text!)!)
        if segue.identifier == "toEthnicityCreate" {
            if let ethnicityCreateVC = segue.destination as? SMEthnicityCreateViewController{
                ethnicityCreateVC.restriction = restriction
                ethnicityCreateVC.survey = survey
                print("in segue")
                print(ethnicityCreateVC.restriction?.ageRestriction)
            }
        }
    }


}
