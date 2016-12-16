//
//  SMNumberCreateViewController.swift
//  surveyApp
//
//  Created by Annette Chen on 12/3/16.
//  Copyright © 2016 Annette Chen. All rights reserved.
//

import Foundation
import Alamofire

class SMNumberCreateViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var num_takers: UITextField!
    
    @IBOutlet weak var nextButton: UIButton!
    
    var restriction: Restriction?
    var survey: Survey?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeTextFields()
        self.hideKeyboardWhenTappedAround()
        nextButton.isEnabled = false
        nextButton.alpha = 0.25
        num_takers.addTarget(self, action:#selector(checkFields(sender:)), for: .editingDidEnd)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func initializeTextFields() {
        num_takers.delegate = self
        num_takers.keyboardType = UIKeyboardType.numberPad
    }
    
    func checkFields(sender: UITextField) {
        sender.text = sender.text?.trimmingCharacters(in: .whitespaces)
        guard
            let num_takers = num_takers.text, !num_takers.isEmpty
            else { return }
        // enable your button if all conditions are met
        nextButton.isEnabled = true
        nextButton.alpha = 1.0
    }
    
    //MARK: Navigation between views
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        restriction?.numTakers = Int(num_takers.text!)!
        if segue.identifier == "toBasicCreate" {
            if let basicCreateVC = segue.destination as? SMBasicCreateViewController{
                print("inside number segue...")
                print(basicCreateVC.restriction)
                basicCreateVC.restriction = restriction!
                basicCreateVC.survey = survey!
            }
        }
    }
    
}
