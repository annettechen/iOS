//
//  ShortAnswerViewController.swift
//  surveyApp
//
//  Created by Emily Su on 11/13/16.
//  Copyright © 2016 Annette Chen. All rights reserved.
//

import UIKit

class ShortAnswerViewController: UIViewController {

    var questionName: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func submitShortAnswer(_ sender: AnyObject) {
        let newQuestion = shortAnswerTextField.text!
        (self.navigationController?.viewControllers[(self.navigationController?.viewControllers.count)! - 2] as! QuestionListTableViewController).questions.append(newQuestion)
        self.navigationController!.popViewController(animated: true)
    }

    
    @IBOutlet weak var shortAnswerTextField: UITextField!
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
