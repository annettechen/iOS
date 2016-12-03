//
//  Survey.swift
//  surveyApp
//
//  Created by Annette Chen on 12/2/16.
//  Copyright © 2016 Annette Chen. All rights reserved.
//

import Foundation
import Alamofire

class Survey {
    var title = String()
    var description = String()
    var est_time = Int()
    var points = Int()
    var startdate = Date()
    var enddate = Date()
    var restriction = Restriction()

    
    // gender list: [0: male, 1: female, 2: other]
    // ethnicity list: [0: hispanic or latino, 1: american indian or alaska native, 2: asian, 3: african american, 4: native hawaiian or pacific islander, 5: white]
    
    func sendToAPI(){
        let url = "https://ka-data.herokuapp.com/surveys"
        let params: Parameters = ["survey[name]":self.title, "survey[description]":self.description, "survey[est_time]": self.est_time, "survey[points]":self.points, "survey[start_date]":self.startdate, "survey[end_date]":self.enddate] as [String : Any]
        Alamofire.request(url, method: .post, parameters: params).responseJSON { response in
            
            print(response.request)  // original URL request
            print(response.response) // HTTP URL response
            print(response.data)     // server data
            print(response.result)   // result of response serialization
            
            if let JSON = response.result.value {
                print("JSON: \(JSON)")
            }
        }

    }
}
