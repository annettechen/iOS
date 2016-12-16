//
//  SurveyMonkeyCreateViewController.swift
//  surveyApp
//
//  Created by Annette Chen on 12/2/16.
//  Copyright © 2016 Annette Chen. All rights reserved.
//

import UIKit
import Alamofire


extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
}


class SMBasicCreateViewController: UIViewController, UITextFieldDelegate {
    
    var survey = Survey()
    var restriction = Restriction()

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var descrip: UITextField!
    @IBOutlet weak var est_time: UITextField!
    @IBOutlet weak var points: UITextField!
    @IBOutlet var webView: UIWebView!
    
    @IBOutlet var cancel: UIButton!
    @IBOutlet var nextButton: UIButton!
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if textField == name { // Switch focus to other text field
            descrip.becomeFirstResponder()
        }
        if textField == descrip { // Switch focus to other text field
            est_time.becomeFirstResponder()
        }
        if textField == est_time { // Switch focus to other text field
            points.becomeFirstResponder()
        }
        return true
    }
    
    override func viewDidLoad() {
        print("basic controller segue test..")
        print(survey.title)
        print(restriction.ethnicityRestriction)
        if(self.restorationIdentifier == "CreateSurveyController"){
            initializeTextFields()
            name.addTarget(self, action:#selector(checkFields(sender:)), for: .editingDidEnd)
            descrip.addTarget(self, action:#selector(checkFields(sender:)), for: .editingDidEnd)
            est_time.addTarget(self, action:#selector(checkFields(sender:)), for: .editingDidEnd)
            points.addTarget(self, action:#selector(checkFields(sender:)), for: .editingDidEnd)
            nextButton.isEnabled = false
            nextButton.alpha = 0.25
        }
        print("back to the basic...")
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        
        
    }
    
    func checkFields(sender: UITextField) {
        sender.text = sender.text?.trimmingCharacters(in: .whitespaces)
        guard
            let name = name.text, !name.isEmpty,
            let descrip = descrip.text, !descrip.isEmpty,
            let est_time = est_time.text, !est_time.isEmpty,
            let points = points.text, !points.isEmpty
            else { return }
        // enable your button if all conditions are met
        nextButton.isEnabled = true
        nextButton.alpha = 1.0
    }
    
    func initializeTextFields() {
        name.delegate = self
        descrip.delegate = self
        est_time.delegate = self
        est_time.keyboardType = UIKeyboardType.numberPad
        points.delegate = self
        points.keyboardType = UIKeyboardType.numberPad
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //load surveyMonkey webView
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
    
    //MARK: Navigation Between Views
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
    
    func allTextFieldsFilledOut() -> Bool {
        if ((name.text?.isEmpty)! || (descrip.text?.isEmpty)! || (est_time.text?.isEmpty)! || (points.text?.isEmpty)!) {
            return false
        }
            
        else {
            return true
        }
    }

    
    
}

