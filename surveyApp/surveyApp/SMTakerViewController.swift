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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
