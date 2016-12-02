//
//  ViewController.swift
//  surveyApp
//
//  Created by Annette Chen on 11/8/16.
//  Copyright © 2016 Annette Chen. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class ViewController: UIViewController {
    
    @IBAction func userProfileAction(sender: AnyObject) {
        
        // Create a new "Storyboard2" instance.
        let storyboard = UIStoryboard(name: "UserProfile", bundle: nil)
        
        // Create an instance of the storyboard's initial view controller.
        let controller = storyboard.instantiateViewController(withIdentifier: "InitialController") as UIViewController
        
        // Display the new view controller.
        present(controller, animated: true, completion: nil)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var surveyNameTextField: UITextField!
    @IBOutlet weak var surveyDescTextField: UITextField!


}

