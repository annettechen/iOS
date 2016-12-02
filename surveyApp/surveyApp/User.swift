//
//  User.swift
//  surveyApp
//
//  Created by Annette Chen on 12/2/16.
//  Copyright © 2016 Annette Chen. All rights reserved.
//

import Foundation

class User {
    let id: Int
    let name: String
    let email: String
    let gender: String
    let age: Int
    let ethnicity: String
    let points: Int
    
    init(id: Int, name:String, email:String, gender:String, age:Int, ethnicity:String, points:Int) {
        self.id = id
        self.name = name
        self.email = email
        self.gender = gender
        self.age = age
        self.ethnicity = ethnicity
        self.points = points
    }
    
    func getInfoFromAPI(id: Int) -> JSONSerialization {
        let url = "ka-data.herokuapp.com/users" + id 
    }
}
