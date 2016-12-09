//
//  SMTakerViewController.swift
//  surveyApp
//
//  Created by Meghana Valluri on 12/7/16.
//  Copyright © 2016 Annette Chen. All rights reserved.
//

import UIKit

class SMTakerViewController: UIViewController {

    @IBOutlet var webView: UIWebView?
    @IBOutlet var done: UIButton?
    
    var viewModel: SurveyDetailViewModel?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.title = viewModel?.title()
        
        if let viewModel = viewModel,
            let urlString = viewModel.URLString(),
            let url = URL(string: urlString) {
            print(urlString)
            let request = URLRequest(url: url)
            webView?.loadRequest(request)
        }
    }
    
    @IBAction func buttonPress(){
        
        let surv = viewModel?.survey
        let survUser = SurveyUser()
        survUser.user_id = user.id
        survUser.relationship = 0
        survUser.survey_id = (surv?.id)!
        
        survUser.sendSurveyUserToAPI(){
            print("submitted surveyUser obj")
        }

<<<<<<< HEAD
    @IBAction func buttonPress(){
        
        let surv = viewModel?.survey
        let survUser = SurveyUser()
        survUser.user_id = 2
        survUser.relationship = 0
        survUser.survey_id = (surv?.id)!
        
        survUser.sendSurveyUserToAPI(){
            print("submitted surveyUser obj")
        }
    }
=======
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toFinishTakingSurvey" {
            if let surveyTakenVC = segue.destination as? SurveyTakenViewController{
                surveyTakenVC.survey = (viewModel?.survey)!
            }
        }
    }
    
    
    
>>>>>>> 4b3b1429124ad001a29d3f9bd3d5d0530fcc8929
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
