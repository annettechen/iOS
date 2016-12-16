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
            let request = URLRequest(url: url)
            webView?.loadRequest(request)
        }
    }
    
    // MARK: When Survey is Completed ...
    @IBAction func buttonPress(){
        
        let surv = viewModel?.survey
        let survUser = SurveyUser()
        survUser.user_id = user.id
        print(surv?.id)
        survUser.relationship = 1
        survUser.survey_id = (surv?.id)!
        
        survUser.sendSurveyUserToAPI(){
            print("submitted surveyUser obj")
        }

    }
    
    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toFinishTakingSurvey" {
            if let surveyTakenVC = segue.destination as? SurveyTakenViewController{
                print("SURVEY TITLE")
                print(viewModel?.survey.title)
                print(viewModel?.survey.points)
                surveyTakenVC.survey = (viewModel?.survey)!
            }
        }
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
