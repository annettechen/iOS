//
//  ViewController.swift
//  surveyApp
//
//  Created by Annette Chen on 11/8/16.
//  Copyright © 2016 Annette Chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var  questions = [String]()
    var newQuestion: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        questions = ["how are you","favorite color","favorite animal"]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

