//
//  ProfileSetupViewController.swift
//  surveyApp
//
//  Created by Emily Su on 12/6/16.
//  Copyright © 2016 Annette Chen. All rights reserved.
//

import UIKit

class ProfileSetupViewController: UIViewController {
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var age: UITextField!
    @IBOutlet weak var gender: UIPickerView!
    @IBOutlet weak var ethnicity: UIPickerView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
