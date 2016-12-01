//
//  SurveyMonkeyAPI.swift
//  surveyApp
//
//  Created by Annette Chen on 11/29/16.
//  Copyright © 2016 Annette Chen. All rights reserved.
//

import Foundation
import Alamofire

func getJson(){

    Alamofire.request("https://ka-data.herokuapp.com/users").responseJSON { response in
        print("Start of response: ")
        print(response.request)  // original URL request
        print(response.response) // HTTP URL response
        print(response.data)     // server data
        print(response.result)   // result of response serialization
        
        if let JSON = response.result.value {
            print("JSON: \(JSON)")
        }
    }
}


