//
//  SMNumberCreateViewController.swift
//  surveyApp
//
//  Created by Annette Chen on 12/3/16.
//  Copyright © 2016 Annette Chen. All rights reserved.
//

import Foundation
import Alamofire

class SMNumberCreateViewController: UIViewController {
    
    var restriction: Restriction?
    var survey: Survey?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        restriction?.numTakers = 23
        if segue.identifier == "toBasicCreate" {
            if let basicCreateVC = segue.destination as? SMBasicCreateViewController{
                basicCreateVC.restriction = restriction!
                basicCreateVC.survey = survey!
            }
        }
    }
    
}
