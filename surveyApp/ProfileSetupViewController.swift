//
//  ProfileSetupViewController.swift
//  surveyApp
//
//  Created by Emily Su on 12/6/16.
//  Copyright © 2016 Annette Chen. All rights reserved.
//

import UIKit

class ProfileSetupViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var age: UITextField!
//    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var genderView: UIPickerView!
    @IBOutlet weak var ethnicityView: UIPickerView!
    
    
    var genderDataSource = ["Male", "Female", "Other"];
    
    var ethnicityDataSource = ["Hispanic or Latino","American Indian or Alaskan Native","Asian","African American","Native Hawaiian or Other Pacific Islander","White"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == genderView {
            return genderDataSource.count
        } else if pickerView == ethnicityView {
            return ethnicityDataSource.count
        }
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == genderView {
            user.gender = genderDataSource[row]
            return genderDataSource[row]
        } else if pickerView == ethnicityView {
            user.ethnicity = ethnicityDataSource[row]
            return ethnicityDataSource[row]
        }
        return ""
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        genderView.delegate = self
        genderView.dataSource = self
        
        ethnicityView.delegate = self
        ethnicityView.dataSource = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func finish(sender: AnyObject) {
        user.name = name.text!
        user.age = Int(age.text!)!
        // Create a new "Storyboard2" instance.
        let storyboard = UIStoryboard(name: "UserProfile", bundle: nil)
        
        // Create an instance of the storyboard's initial view controller.
        let controller = storyboard.instantiateViewController(withIdentifier: "UserProfileController") as UIViewController
        
        // Display the new view controller.
        present(controller, animated: true, completion: nil)
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
