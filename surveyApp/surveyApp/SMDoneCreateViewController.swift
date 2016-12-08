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
        name.text = (survey?.title)!
        
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    @IBAction func complete(){
        survey?.url = url.text!
        survey?.sendSurveyToAPI(){id in
            self.restriction?.surveyID = id
            self.restriction?.sendRestrictionsToAPI(){
                print(self.restriction)
            }

        }
    }

}

//id in
//self.restriction?.surveyID = id
//self.restriction?.sendRestrictionsToAPI(){ id in
//    print(self.restriction)
//}

