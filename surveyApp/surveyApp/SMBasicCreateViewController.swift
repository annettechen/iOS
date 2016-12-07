//
//  SurveyMonkeyCreateViewController.swift
//  surveyApp
//
//  Created by Annette Chen on 12/2/16.
//  Copyright © 2016 Annette Chen. All rights reserved.
//

import UIKit
import Alamofire


class SMBasicCreateViewController: UIViewController {
    
    var survey = Survey()
    var restriction = Restriction()

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var descrip: UITextView!
    @IBOutlet weak var est_time: UITextField!
    @IBOutlet weak var points: UITextField!
    @IBOutlet var webView: UIWebView!
    
    override func viewDidLoad() {
        print("basic controller segue test..")
        print(survey.title)
        print(restriction.ethnicityRestriction)
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let url = NSURL (string: "https://mobile.surveymonkey.com/create/?ut_source=create_survey&ut_source2=header");
        let requestObj = NSURLRequest(url: url! as URL);
        webView?.loadRequest(requestObj as URLRequest);
        
    }
    
    func saveInfo(){
        survey.title = name.text!
        survey.description = descrip.text!
        survey.est_time = Int(est_time.text!)!
        survey.points = Int(points.text!)!
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toGenderCreate"{
            saveInfo()
            if let genderCreateVC = segue.destination as? SMGenderCreateViewController{
                genderCreateVC.survey = survey
            }
        }
        if segue.identifier == "toViewCreate" {
            if let viewCreateVC = segue.destination as? SMBasicCreateViewController{
                viewCreateVC.restriction = restriction
                viewCreateVC.survey = survey
            }
        }
        if segue.identifier == "toDoneCreate" {
            if let doneCreateVC = segue.destination as? SMDoneCreateViewController{
                doneCreateVC.restriction = restriction
                doneCreateVC.survey = survey
            }
        }
    }

    
    
    
    
    
}

