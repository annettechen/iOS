//
//  User.swift
//  surveyApp
//
//  Created by Annette Chen on 12/2/16.
//  Copyright © 2016 Annette Chen. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class User {
    var id = Int()
    var name = String()
    var email = String()
    var gender = String()
    var age = Int()
    var ethnicity = String()
    var points = Int()
    var surveys = [Survey]()
    
    
    let genders = ["Male", "Female", "Other"]
    let ethnicities = ["Hispanic or Latino","American Indian or Alaskan Native","Asian","African American","Native Hawaiian or Other Pacific Islander","White"]

    
    func getInfoFromAPI(id:Int, completion: @escaping (() -> Void)){
        var jsonResult:JSON = ""
        let url = "https://ka-data.herokuapp.com/users/" + "\(id)" + "/info"
        
        Alamofire.request(url).responseJSON {response in
            if let json = response.result.value {
                jsonResult = JSON(json)
                self.fillUserData(json: jsonResult)
            }
            completion()
        }
    }
    
    func fillUserData(json: JSON){
        self.id = json["demographics"]["id"].int!
        self.name = json["demographics"]["name"].string!
        self.email = json["demographics"]["email"].string!
        let genderIndex = json["demographics"]["gender"].int!
        self.gender = genders[genderIndex]
        self.age = json["demographics"]["age"].int!
        let ethnicityIndex = json["demographics"]["ethnicity"].int!
        self.ethnicity = ethnicities[ethnicityIndex]
        self.points = json["demographics"]["points"].int!
        fillSurveyData(surveyJSON: json["eligible_surveys"])
    }
    
    func fillSurveyData(surveyJSON: JSON){
        for index in 0..<surveyJSON.count{
            let new = Survey()
            new.title = surveyJSON[index]["name"].string!
            new.description = surveyJSON[index]["description"].string!
//            new.est_time = surveyJSON[index]["est_time"].int!
            new.points = surveyJSON[index]["points"].int!
            self.surveys.append(new)
        }
    }
    
}

//        let params: Parameters = ["user[name]" :"Test", "user[email]":"test@example.com", "user[age]": 25, "user[gender]":1, "user[taker]":true, "user[creator]":false, "user[ethnicity]":2, "user[points]": 30] as [String : Any]

//        Alamofire.request("https://ka-data.herokuapp.com/users", method: .post, parameters: params).responseJSON { response in
//
//            print(response.request)  // original URL request
//            print(response.response) // HTTP URL response
//            print(response.data)     // server data
//            print(response.result)   // result of response serialization
//
//            if let json = response.result.value {
//                let jsonResult = JSON(json)
//                print(jsonResult["survey"])
//            }
//        }
