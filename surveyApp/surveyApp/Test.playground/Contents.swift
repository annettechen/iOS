//: Playground - noun: a place where people can play

import UIKit
import Alamofire

var str = "Hello, playground"

let id = 2
let url = "https://ka-data.herokuapp.com/users/" + "\(id)" + "/info"
var jsonResult: String = ""


Alamofire.request(url).responseJSON {response in   // server data
    print(response.result)
    if let json = response.result.value {
        jsonResult = json as! String
        print("JSON: \(json)")
        
    }
}

print(jsonResult)