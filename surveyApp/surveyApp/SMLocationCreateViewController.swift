//
//  SMLocationCreateViewController.swift
//  surveyApp
//
//  Created by Annette Chen on 12/3/16.
//  Copyright © 2016 Annette Chen. All rights reserved.
//

import Foundation
import Alamofire


class SMLocationCreateViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {

    @IBOutlet weak var radius: UITextField!
    @IBOutlet weak var centerCity: UIPickerView!
    @IBOutlet weak var nextButton: UIButton!
    var restriction: Restriction?
    var survey: Survey?
    
    
    //MARK: Pre-Set Location Centers
    var cityDataSource = [String]()
    var city = ""
    var Locations: [String: [Float]] = ["Boston":[42.3601, -71.0589], "San Francisco":[37.7749, -122.4194], "DC": [38.9072, 77.0369], "Pittsburgh":[40.4406, -79.9959]]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        centerCity.dataSource = self;
        centerCity.delegate = self;
        for (key, _) in Locations{
            cityDataSource.append(key)
        }
        initializeTextFields()
        self.hideKeyboardWhenTappedAround()
        nextButton.isEnabled = false
        nextButton.alpha = 0.25
        radius.addTarget(self, action:#selector(checkFields(sender:)), for: .editingDidEnd)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func initializeTextFields() {
        radius.delegate = self
        radius.keyboardType = UIKeyboardType.numberPad
    }
    
    //MARK: Navigation between views
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        restriction?.latitude = (Locations[city]?[0])!
        restriction?.longitude = (Locations[city]?[1])!
        restriction?.radius = Int(radius.text!)!
        if segue.identifier == "toNumberCreate" {
            if let numberCreateVC = segue.destination as? SMNumberCreateViewController{
                numberCreateVC.restriction = restriction!
                numberCreateVC.survey = survey!
            }
        }
    }
    
    func checkFields(sender: UITextField) {
        sender.text = sender.text?.trimmingCharacters(in: .whitespaces)
        guard
            let radius = radius.text, !radius.isEmpty
            else { return }
        // enable your button if all conditions are met
        nextButton.isEnabled = true
        nextButton.alpha = 1.0
    }
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return cityDataSource.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        city = cityDataSource[row]
        return cityDataSource[row]
    }

}
