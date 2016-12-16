//
//  SMAgeCreateViewController.swift
//  surveyApp
//
//  Created by Annette Chen on 12/3/16.
//  Copyright © 2016 Annette Chen. All rights reserved.
//

import Foundation
import Alamofire

class SMAgeCreateViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var age_ub: UITextField!
    @IBOutlet weak var age_lb: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    var restriction: Restriction?
    var survey: Survey?
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if textField == age_lb { // Switch focus to other text field
            age_ub.becomeFirstResponder()
        }
        return true
    }
    
    override func viewDidLoad() {
        print("age restriction...")
        print(restriction?.genderRestriction)
        initializeTextFields()
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        nextButton.isEnabled = false
        nextButton.alpha = 0.25
        age_ub.addTarget(self, action:#selector(checkFields(sender:)), for: .editingDidEnd)
        age_lb.addTarget(self, action:#selector(checkFields(sender:)), for: .editingDidEnd)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func initializeTextFields() {
        age_ub.delegate = self
        age_lb.delegate = self
        age_ub.keyboardType = UIKeyboardType.numberPad
        age_lb.keyboardType = UIKeyboardType.numberPad
    }
    
    func checkFields(sender: UITextField) {
        sender.text = sender.text?.trimmingCharacters(in: .whitespaces)
        guard
            let age_ub = age_ub.text, !age_ub.isEmpty,
            let age_lb = age_lb.text, !age_lb.isEmpty
            else { return }
        // enable your button if all conditions are met
        nextButton.isEnabled = true
        nextButton.alpha = 1.0
    }
    
    //MARK: Navigation between views
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        restriction?.ageRestriction[0] = (Int(age_lb.text!)!)
        restriction?.ageRestriction[1] = (Int(age_ub.text!)!)
        if segue.identifier == "toEthnicityCreate" {
            if let ethnicityCreateVC = segue.destination as? SMEthnicityCreateViewController{
                ethnicityCreateVC.restriction = restriction
                ethnicityCreateVC.survey = survey
                print("in segue")
                print(ethnicityCreateVC.restriction?.ageRestriction)
            }
        }
    }


}
