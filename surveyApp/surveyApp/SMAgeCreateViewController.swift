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
    
    var restriction = Restriction()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    @IBAction func surveyAgeNext (){
        restriction.ageRestriction.append(Int(age_ub.text!)!)
        restriction.ageRestriction.append(Int(age_ub.text!)!)

    }

}
