//
//  TakerViewController.swift
//  surveyApp
//
//  Created by Meghana Valluri on 12/8/16.
//  Copyright © 2016 Annette Chen. All rights reserved.
//

import UIKit

class SurveyTakenViewController: UIViewController {

    var survey = Survey()
    
    @IBOutlet var surveyNameLabel: UILabel?
    @IBOutlet var surveyPointsLabel: UILabel?
    @IBOutlet var takeBackToProfile: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLabels()
        addPointsToUser()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setLabels() {
        surveyNameLabel?.text! = "You've taken " + survey.title + "and earned"
        surveyPointsLabel?.text! = "\(survey.points)"
    
    }
    
    func addPointsToUser() {
        user.points = user.points + survey.points
    }
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "BackToUserProfile" {
            if let userProfVC = segue.destination as? UserProfileViewController{
                
            }
        }
    }

}
