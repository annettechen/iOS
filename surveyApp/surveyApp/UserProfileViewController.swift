//
//  UserProfileViewController.swift
//  surveyApp
//
//  Created by Annette Chen on 12/1/16.
//  Copyright © 2016 Annette Chen. All rights reserved.
//

import UIKit

class UserProfileViewController: UIViewController {
    
    @IBOutlet weak var surveyTables: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let cellNib = UINib(nibName: "SurveyCell", bundle: nil)
        surveyTables.register(cellNib, forCellReuseIdentifier: "cell")
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
