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
    
    @IBOutlet weak var num_takers: UITextField!
    
    var restriction: Restriction?
    var survey: Survey?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    //MARK: Navigation between views
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        restriction?.numTakers = Int(num_takers.text!)!
        if segue.identifier == "toBasicCreate" {
            if let basicCreateVC = segue.destination as? SMBasicCreateViewController{
                basicCreateVC.restriction = restriction!
                basicCreateVC.survey = survey!
            }
        }
    }
    
}
