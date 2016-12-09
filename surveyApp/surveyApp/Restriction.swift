//
//  Restriction.swift
//  surveyApp
//
//  Created by Annette Chen on 12/3/16.
//  Copyright © 2016 Annette Chen. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class Restriction{
    var surveyID = Int()
    var genderRestriction = [false, false, false]
    var ageRestriction = [Int(), Int()]
    var ethnicityRestriction = [false, false, false, false, false, false]
    var longitude = Float()
    var latitude = Float()
    var radius = Int()
    var numTakers = Int()
    var locationManager = Float()
    
    func sendRestrictionsToAPI(completion: @escaping(() -> Void)){
        var jsonResult: JSON = ""
        var restrictionID: Int = 0
        let url = "https://ka-data.herokuapp.com/restrictions"
//        let headers: HTTPHeaders = ["Content-Type" : "application/json"]
        let params: Parameters = ["restriction[age_ub]": self.ageRestriction[0], "restriction[age_lb]":self.ageRestriction[1], "restriction[loc_center_long]": self.longitude, "restriction[loc_center_lat]":self.latitude, "restriction[loc_radius]": self.radius, "restriction[num_takers]":self.numTakers, "restriction[survey_id]":self.surveyID] as [String : Any]
        Alamofire.request(url, method: .post, parameters: params).responseJSON { response in
            print(response.request)  // original URL request
            print(response.response) // HTTP URL response
            print(response.data)     // server data
            print(response.result)   // result of response serialization
            
            if let json = response.result.value {
                jsonResult = JSON(json)
                print("JSON: \(json)")
                print(jsonResult["id"])
                restrictionID = jsonResult["id"].int!
            }
        }
        completion()
    }
    
    func sendGenderRestrictions(restrictionID: Int){
        let restrictionGenderURL = "https://ka-data.herokuapp.com/restriction_genders"
        for index in 0..<genderRestriction.count {
            if(genderRestriction[index]){
                let restricGenderParams: Parameters = ["restriction_gender[restriction_id]":restrictionID, "restriction_gender[gender_id]":index+1] as [String:Int]
                Alamofire.request(restrictionGenderURL, method: .post, parameters: restricGenderParams).responseJSON { response in
                    if let JSON = response.result.value {
                        print("JSON: \(JSON)")
                    }
                }
            }
            
        }
    }
    
    func sendEthnicityRestrictions(restrictionID: Int){
        let restrictionGenderURL = "https://ka-data.herokuapp.com/restriction_ethnicities"
        for index in 0..<ethnicityRestriction.count {
            if(ethnicityRestriction[index]){
                let restricEthnicityParams: Parameters = ["restriction_ethnicity[restriction_id]":restrictionID, "restriction_ethnicity[ethnicity_id]":index+1] as [String:Int]
                Alamofire.request(restrictionGenderURL, method: .post, parameters: restricEthnicityParams).responseJSON { response in
                    if let JSON = response.result.value {
                        print("JSON: \(JSON)")
                    }
                }
            }
            
        }
    }
    
}

