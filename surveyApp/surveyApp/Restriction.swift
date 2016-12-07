//
//  Restriction.swift
//  surveyApp
//
//  Created by Annette Chen on 12/3/16.
//  Copyright © 2016 Annette Chen. All rights reserved.
//

import Foundation
import Alamofire
import CoreLocation

class Restriction: NSObject{
    var surveyID = Int()
    var genderRestriction = [false, false, false]
    var ageRestriction = [Int(), Int()]
    var ethnicityRestriction = [false, false, false, false, false, false]
    var longitude = CLLocationDegrees()
    var latitude = CLLocationDegrees()
    var radius = Int()
    var numTakers = Int()
    var locationManager = CLLocationManager()
    
    func sendRestrictionsToAPI(){
        let url = "https://ka-data.herokuapp.com/restrictions"
        let params: Parameters = ["restriction[age_ub]": self.ageRestriction[0], "restriction[age_lb]":self.ageRestriction[1], "restriction[loc_center_long]": self.longitude, "restriction[loc_center_lat]":self.latitude, "restriction[loc_radius]": self.radius, "restriction[num_takers]":self.numTakers, "restriction[survey_id]":self.surveyID] as [String : Any]
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
    
//    func genderRestrictions(restrictionID: Int){
//        // create gender tables for all acceptable genders and create restriction_gender tables to connect
//        let genderURL = "https://ka-data.herokuapp.com/genders"
//        let restrictionGenderURL = "https://ka-data.herokuapp.com/restriction_genders"
//        for gender in genderRestriction {
//            let genderParams: Parameters = ["gender[name]":gender] as [String:Int]
//            Alamofire.request(genderURL, method: .post, parameters: genderParams).responseJSON { response in
//                if let JSON = response.result.value {
//                    print("JSON: \(JSON)")
//                }
//            }
//            let restricGenderParams: Parameters = ["restriction_gender[restriction_id]":restrictionID, "restriction_gender[gender_id]":gender] as [String:Int]
//            Alamofire.request(restrictionGenderURL, method: .post, parameters: genderParams).responseJSON { response in
//                if let JSON = response.result.value {
//                    print("JSON: \(JSON)")
//                }
//            }
//        }
//    }
    
    func getCurrentLocation() {
        locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.distanceFilter = kCLDistanceFilterNone
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
        
        if let currLocation = locationManager.location {
            self.latitude = currLocation.coordinate.latitude
            self.longitude = currLocation.coordinate.longitude
        }
    }
}

