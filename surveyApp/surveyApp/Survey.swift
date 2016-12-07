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
    var url = String()
    var restriction = Restriction()

    
    // gender list: [1: male, 2: female, 3: other]
    // ethnicity list: [1: hispanic or latino, 2: american indian or alaska native, 3: asian, 4: african american, 5: native hawaiian or pacific islander, 6: white]
    
    func sendToAPI(){
        let url = "https://ka-data.herokuapp.com/surveys"
        let params: Parameters = ["survey[name]":self.title, "survey[description]":self.description, "survey[est_time]": self.est_time, "survey[points]":self.points, "survey[url]":self.url] as [String : Any]
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
