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
    
    @IBOutlet var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let url = NSURL (string: "https://mobile.surveymonkey.com/create/?ut_source=create_survey&ut_source2=header");
        let requestObj = NSURLRequest(url: url! as URL);
        webView?.loadRequest(requestObj as URLRequest);
        login()
    }
    
    func login(){
        print("logging in..")
        let loginParams = ["username":"uplift_ka", "password":"kakakaka"]
        let url = "https://www.surveymonkey.com/user/sign-in/?ut_source=anonweb&ut_source2=signout_confirmation"
        Alamofire.request(url, method: .post, parameters: loginParams).responseJSON{ response in
            if let JSON = response.result.value {
                print(response.request)  // original URL request
                print(response.response) // HTTP URL response
                print(response.data)     // server data
                print(response.result)
                print("JSON: \(JSON)")
            }

        }
    }
}

