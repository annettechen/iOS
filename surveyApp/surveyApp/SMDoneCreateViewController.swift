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
    var surveyUser = SurveyUser()
    
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
        print("trying to complete....")
        survey?.url = url.text!
        survey?.sendSurveyToAPI(){id in
            print("this is udududududududud \(id)")

            self.restriction?.surveyID = id
            self.restriction?.sendRestrictionsToAPI(){
                //                print(self.restriction)
            }
            self.surveyUser.survey_id = (self.survey?.id)!
            self.surveyUser.user_id = 2
            self.surveyUser.relationship = 0
            self.surveyUser.sendSurveyUserToAPI(){
                print(self.surveyUser.survey_id)
            }
        }
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        // Create an instance of the storyboard's initial view controller.
        let controller = storyboard.instantiateViewController(withIdentifier: "UserProfileViewController") as UIViewController
        
        // Display the new view controller.
        present(controller, animated: true, completion: nil)

    }

}

//id in
//self.restriction?.surveyID = id
//self.restriction?.sendRestrictionsToAPI(){ id in
//    print(self.restriction)
//}

