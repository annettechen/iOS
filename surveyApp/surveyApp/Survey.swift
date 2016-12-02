//
//  Survey.swift
//  surveyApp
//
//  Created by Annette Chen on 12/2/16.
//  Copyright © 2016 Annette Chen. All rights reserved.
//

import Foundation

class Survey {
    let id: Int
    let name: String
    let email: String
    let age: Int
    let gender: String
    let ethnicity: String
    let points: Int
    
    init(id:Int, name:String, email:String, age:Int, gender:String, ethnicity:String, points:Int){
        self.id = id
        self.name = name
        self.email = email
        self.age = age
        self.gender = gender
        self.ethnicity = ethnicity
        self.points = points
    }
    
    func getInfoFromAPI(id:Int) -> JSONSerialization {
        
    }
    
    
}
