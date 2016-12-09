//
//  SurveyUser.swift
//  surveyApp
//
//  Created by Meghana Valluri on 12/8/16.
//  Copyright © 2016 Annette Chen. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class SurveyUser {
    var survey_id = Int()
    var user_id = Int()
    var relationship = Int()
    
    
    // relationship: [0: creator, 1: taker]
<<<<<<< HEAD

    
    func sendSurveyUserToAPI(completion: @escaping(() -> Void)){
        print("does it come here??")
=======
    
    
    func sendSurveyUserToAPI(completion: @escaping(() -> Void)){
>>>>>>> 4b3b1429124ad001a29d3f9bd3d5d0530fcc8929
        var jsonResult: JSON = ""
        var id: Int = 1
        let url = "https://ka-data.herokuapp.com/survey_users"
        let params: Parameters = ["survey_user[survey_id]":self.survey_id, "survey_user[user_id]":self.user_id, "survey_user[relationship]": self.relationship] as [String : Any]
<<<<<<< HEAD
        print(params)
=======
>>>>>>> 4b3b1429124ad001a29d3f9bd3d5d0530fcc8929
        Alamofire.request(url, method: .post, parameters: params).responseJSON { response in
            
            print(response.request)  // original URL request
            print(response.response) // HTTP URL response
            print(response.data)     // server data
            print(response.result)   // result of response serialization
            
            if let json = response.result.value {
                jsonResult = JSON(json)
                print("JSON: \(json)")
                id = jsonResult["id"].int!
                print("here is the survey_user id \(id)")
            }
        }
        completion()
        
    }
<<<<<<< HEAD

=======
    
>>>>>>> 4b3b1429124ad001a29d3f9bd3d5d0530fcc8929
}
