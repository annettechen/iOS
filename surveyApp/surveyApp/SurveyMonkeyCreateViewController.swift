//
//  SurveyMonkeyCreateViewController.swift
//  surveyApp
//
//  Created by Annette Chen on 12/2/16.
//  Copyright © 2016 Annette Chen. All rights reserved.
//

import UIKit
import Alamofire


class SurveyMonkeyCreateViewController: UIViewController {
    
    let survey = Survey()
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var descrip: UITextView!
    @IBOutlet weak var est_time: UITextField!
    @IBOutlet weak var points: UITextField!
    @IBOutlet var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let url = NSURL (string: "https://mobile.surveymonkey.com/create/?ut_source=create_survey&ut_source2=header");
        let requestObj = NSURLRequest(url: url! as URL);
        webView?.loadRequest(requestObj as URLRequest);
        
    }
    
    @IBAction func basicInfoNext(){
        survey.title = name.text!
        survey.description = descrip.text!
        survey.est_time = Int(est_time.text!)!
        survey.points = Int(points.text!)!
    }
    
}

