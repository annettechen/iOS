//
//  ViewController.swift
//  surveyApp
//
//  Created by Annette Chen on 11/8/16.
//  Copyright © 2016 Annette Chen. All rights reserved.
//

import UIKit
import Alamofire
import FBSDKLoginKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var user = User()
    
    @IBAction func userProfileAction(sender: AnyObject) {
        // Create a new "Storyboard2" instance.
        let storyboard = UIStoryboard(name: "UserProfile", bundle: nil)
        
        // Create an instance of the storyboard's initial view controller.
        let controller = storyboard.instantiateViewController(withIdentifier: "UserProfileController") as UIViewController
        
        // Display the new view controller.
        present(controller, animated: true, completion: nil)
    }
    
    @IBAction func makeASurvey(sender: AnyObject){
        // Create a new Storyboard instance.
        let storyboard = UIStoryboard(name: "SurveyMonkey", bundle: nil)
        
        // Create an instance of the storyboard's initial view controller.
        let controller = storyboard.instantiateViewController(withIdentifier: "CreateSurveyController") as UIViewController
        
        // Display the new view controller.
        present(controller, animated: true, completion: nil)
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let cellNib = UINib(nibName: "FilteredSurveyCell", bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: "FilteredSurveyCell")
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FilteredSurveyCell", for: indexPath as IndexPath) as!FilteredSurveyCell
//        user.getInfoFromAPI(id: 2){
//            self.populateLabels()
//            cell.name?.text = self.user.surveys[indexPath[1]].title
//            cell.points?.text = "\(self.user.surveys[indexPath[1]].points) points"
//        }
        return cell
    }
    

}
