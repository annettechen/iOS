//
//  SurveyModel.swift
//  surveyApp
//
//  Created by Annette Chen on 12/2/16.
//  Copyright © 2016 Annette Chen. All rights reserved.
//

import Foundation

class SurveyViewModel {
    let surveys = [Survey]()
    let profileRows: Int = 4
    
    var survs = [Survey]()
    var filteredSurvs = [Survey]()
    

    // Returns number of rows
    func numberOfRows() -> Int {
        if filteredSurvs.isEmpty {
            return survs.count
        } else {
            return filteredSurvs.count
        }
    }
    
    // Return title for survey
    func titleForRowAtIndexPath(_ indexPath: IndexPath) -> String {
        guard indexPath.row >= 0 && indexPath.row < survs.count else {
            return ""
        }
        if filteredSurvs.isEmpty {
            return survs[indexPath.row].title
        } else {
            return filteredSurvs[indexPath.row].title
        }
    }
    
    // Return points for survey
    func pointsForRowAtIndexPath(_ indexPath: IndexPath) -> String {
        guard indexPath.row >= 0 && indexPath.row < survs.count else {
            return ""
        }
        if filteredSurvs.isEmpty {
            return " + \(survs[indexPath.row].points) "
        } else {
            return " \(filteredSurvs[indexPath.row].points)"
        }
    }
    
    // Return estimated time for survey
    func estTimeForRowAtIndexPath(_ indexPath: IndexPath) -> String {
        guard indexPath.row >= 0 && indexPath.row < survs.count else {
            return ""
        }
        if filteredSurvs.isEmpty {
            return " + \(survs[indexPath.row].est_time) "
        } else {
            return " \(filteredSurvs[indexPath.row].est_time)"
        }
    }
    
    //Return description for survey
    func descriptionForRowAtIndexPath(_ indexPath: IndexPath) -> String {
        guard indexPath.row >= 0 && indexPath.row < survs.count else {
            return ""
        }
        if filteredSurvs.isEmpty {
            return survs[indexPath.row].description
        } else {
            return filteredSurvs[indexPath.row].description
        }
    }
    
    //Return SurveyDetail Object for a given survey
    func detailViewModelForRowAtIndexPath(_ indexPath: IndexPath) -> SurveyDetailViewModel {
        let surv = (filteredSurvs.isEmpty ? survs[indexPath.row] : filteredSurvs[indexPath.row])
        return SurveyDetailViewModel(survey: surv)
    }
    
    //Runs a search query
    func updateFiltering(_ searchText: String) -> Void {
        filteredSurvs = self.survs.filter { surv in
            return surv.title.lowercased().contains(searchText.lowercased())
        }
    }

}
