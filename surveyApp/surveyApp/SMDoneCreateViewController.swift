//
//  SMDoneCreateViewController.swift
//  surveyApp
//
//  Created by Annette Chen on 12/3/16.
//  Copyright © 2016 Annette Chen. All rights reserved.
//

import Foundation
import Alamofire

class SMDoneCreateViewController: UIViewController {
    
    var restriction: Restriction?
    var survey: Survey?
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var url: UITextField!
    
    override func viewDidLoad() {
        print("done page")
        print(restriction?.ethnicityRestriction)
        name.text = (survey?.title)!
        
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    @IBAction func complete(){
        survey?.url = url.text!
//        survey?.sendToAPI()
    }

}
