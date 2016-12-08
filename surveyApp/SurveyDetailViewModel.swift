//
//  SurveyDetailViewModel.swift
//  surveyApp
//
//  Created by Meghana Valluri on 12/7/16.
//  Copyright © 2016 Annette Chen. All rights reserved.
//

import UIKit

class SurveyDetailViewModel {

    let survey: Survey
    
    init(survey: Survey) {
        self.survey = survey
    }
    
    func id() -> Int {
        return survey.id
    }
    func title() -> String {
        return survey.title
    }
    
    func URLString() -> String? {
        return survey.url
    }

}
