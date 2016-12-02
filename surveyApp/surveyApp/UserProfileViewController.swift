//
//  UserProfileViewController.swift
//  surveyApp
//
//  Created by Annette Chen on 12/1/16.
//  Copyright © 2016 Annette Chen. All rights reserved.
//

import UIKit
import Alamofire

class UserProfileViewController: UIViewController {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var point_total: UILabel!
    @IBOutlet weak var age: UILabel!
    @IBOutlet weak var gender: UILabel!
    @IBOutlet weak var ethnicity: UILabel!
    
    @IBOutlet var surveyTable: UITableView!
    
    let user = User(id: 2, name:"mary", email:"mary", gender:"female", age:20, ethnicity: "white", points: 10 )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let cellNib = UINib(nibName: "UserSurveyCell", bundle: nil)
        surveyTable.register(cellNib, forCellReuseIdentifier: "cell")
        
        // get the data for the table
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func editProfile(){
        user.getInfoFromAPI(id: 2)    }
}
