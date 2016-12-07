//
//  UserProfileViewController.swift
//  surveyApp
//
//  Created by Annette Chen on 12/1/16.
//  Copyright © 2016 Annette Chen. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


class UserProfileViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var point_total: UILabel!
    @IBOutlet weak var age: UILabel!
    @IBOutlet weak var gender: UILabel!
    @IBOutlet weak var ethnicity: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var recentSurveys: UIButton!
    @IBOutlet weak var createdSurveys: UIButton!

    var recentSurveysClicked = true
    var createdSurveysClicked = false
    
    var user = User()
    var json:JSON = ""


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        
        let cellNib = UINib(nibName: "SurveyCell", bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func editProfile(){
    }
    
    func populateLabels(){
        self.name.text = self.user.name
        self.point_total.text = String(self.user.points)
        self.age.text = String(self.user.age)
        self.gender.text = self.user.gender
        self.ethnicity.text = self.user.ethnicity
    }

    @IBAction func toggleProfile() {
        
        recentSurveysClicked = !recentSurveysClicked
        createdSurveysClicked = !createdSurveysClicked
    
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath as IndexPath) as!SurveyCell
        if recentSurveysClicked {
            user.getInfoFromAPI(id: 2){
                self.populateLabels()
                cell.name?.text = self.user.surveys[indexPath[1]].title
                cell.points?.text = "+ \(self.user.surveys[indexPath[1]].points) points"
            }
        }
        else {
            user.getSurveysUserCreatedFromAPI(id: 2){
                self.populateLabels()
                cell.name?.text = self.user.createdSurveys[indexPath[1]].title
                cell.points?.text = self.user.createdSurveys[indexPath[1]].title
            }
        }
        return cell
    }
}
