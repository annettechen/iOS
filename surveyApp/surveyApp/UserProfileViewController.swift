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
import FBSDKLoginKit
import FBSDKCoreKit



class UserProfileViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var point_total: UILabel!
    @IBOutlet weak var demographics: UILabel!
    @IBOutlet weak var location: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var recentSurveys: UIButton!
    @IBOutlet weak var createdSurveys: UIButton!
    

    @IBOutlet weak var logOutButton: UIBarButtonItem!
    
    var recentSurveysClicked = true
    var createdSurveysClicked = false
    
    var json:JSON = ""


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        
        let cellNib = UINib(nibName: "SurveyCell", bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        
        recentSurveys.setTitleColor(UIColor.blue, for: .normal)
        createdSurveys.setTitleColor(UIColor.black, for: .normal)
        self.populateLabels()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func populateLabels(){
        self.name.text = user.name
        self.demographics.text = "\(String(user.age)) years old, \(user.gender), \(user.ethnicity)"
        self.point_total.text = "\(String(user.points)) points"
    }
    
    @IBAction func toggleRecentSurveys() {
        recentSurveysClicked = true
        createdSurveysClicked = false
        
        recentSurveys.setTitleColor(UIColor.blue, for: .normal)
        createdSurveys.setTitleColor(UIColor.black, for: .normal)
        self.tableView.reloadData()
    }
    
    @IBAction func toggleCreatedSurveys() {
        recentSurveysClicked = false
        createdSurveysClicked = true
        
        recentSurveys.setTitleColor(UIColor.black, for: .normal)
        createdSurveys.setTitleColor(UIColor.blue, for: .normal)
        self.tableView.reloadData()
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath as IndexPath) as!SurveyCell
        if recentSurveysClicked == true {
            user.getInfoFromAPI(id: 2){
                self.populateLabels()
                cell.name?.text = user.surveys[indexPath[1]].title
                cell.surveyDescription?.text = ""
                cell.points?.text = "+ \(user.surveys[indexPath[1]].points) points"
            }
        }
        else {
            print("created surveys clicked")
            user.getSurveysUserCreatedFromAPI(id: 2){
                self.populateLabels()
                cell.name?.text = user.createdSurveys[indexPath[1]].title
                cell.surveyDescription?.text = user.createdSurveys[indexPath[1]].description
                cell.points?.text = ""
            }
            print(user.createdSurveys.count)
        }
        return cell
    }
    
    
    @IBAction func logOut() {
        let manager = FBSDKLoginManager()
        manager.logOut()
        print("logging out")
    }
}
