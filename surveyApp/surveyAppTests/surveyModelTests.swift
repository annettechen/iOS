//
//  surveyAppTests.swift
//  surveyAppTests
//
//  Created by Annette Chen on 11/8/16.
//  Copyright © 2016 Annette Chen. All rights reserved.
//

import XCTest
@testable import surveyApp

class surveyAppTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    // MARK: Survey Model Tests
    func test_titleForRowAtIndexPath() {
        let survey1 = Survey()
        survey1.title = "Survey 1 Title"
        let survey2 = Survey()
        survey2.title = "Survey 2 Title"
        let surveys = [survey1, survey2]
        let surveyViewModel = SurveyViewModel()
        surveyViewModel.survs = surveys
        
        let indexPath1 = IndexPath(row: 0, section: 0)
        XCTAssertEqual(surveyViewModel.titleForRowAtIndexPath(indexPath1), "Survey 1 Title")
        
        let indexPath2 = IndexPath(row: 1, section: 0)
        XCTAssertEqual(surveyViewModel.titleForRowAtIndexPath(indexPath2), "Survey 2 Title")
        
        let indexPath3 = IndexPath(row: 99, section: 99)
        XCTAssertEqual(surveyViewModel.titleForRowAtIndexPath(indexPath3), "")
    }
    
    func test_pointsForRowAtIndexPath() {
        let survey1 = Survey()
        survey1.title = "Survey 1 Title"
        survey1.points = 10
        let survey2 = Survey()
        survey2.title = "Survey 2 Title"
        survey2.points = 20
        let surveys = [survey1, survey2]
        let surveyViewModel = SurveyViewModel()
        surveyViewModel.survs = surveys
        
        let indexPath1 = IndexPath(row: 0, section: 0)
        XCTAssertEqual(surveyViewModel.pointsForRowAtIndexPath(indexPath1), " + 10 ")
        
        let indexPath2 = IndexPath(row: 1, section: 0)
        XCTAssertEqual(surveyViewModel.pointsForRowAtIndexPath(indexPath2), " + 20 ")
        
        let indexPath3 = IndexPath(row: 99, section: 99)
        XCTAssertEqual(surveyViewModel.pointsForRowAtIndexPath(indexPath3), "")
    }
    
    func test_estTimeForRowAtIndexPath() {
        let survey1 = Survey()
        survey1.title = "Survey 1 Title"
        survey1.points = 10
        survey1.est_time = 10
        let survey2 = Survey()
        survey2.title = "Survey 2 Title"
        survey2.points = 20
        survey2.est_time = 20
        let surveys = [survey1, survey2]
        let surveyViewModel = SurveyViewModel()
        surveyViewModel.survs = surveys
        
        let indexPath1 = IndexPath(row: 0, section: 0)
        XCTAssertEqual(surveyViewModel.estTimeForRowAtIndexPath(indexPath1), " + 10 ")
        
        let indexPath2 = IndexPath(row: 1, section: 0)
        XCTAssertEqual(surveyViewModel.estTimeForRowAtIndexPath(indexPath2), " + 20 ")
        
        let indexPath3 = IndexPath(row: 99, section: 99)
        XCTAssertEqual(surveyViewModel.estTimeForRowAtIndexPath(indexPath3), "")
    }
    
    func test_descriptionForRowAtIndexPath() {
        let survey1 = Survey()
        survey1.title = "Survey 1 Title"
        survey1.points = 10
        survey1.description = "survey 1 description"
        let survey2 = Survey()
        survey2.title = "Survey 2 Title"
        survey2.points = 20
        survey2.description = "survey 2 description"
        let surveys = [survey1, survey2]
        let surveyViewModel = SurveyViewModel()
        surveyViewModel.survs = surveys
        
        let indexPath1 = IndexPath(row: 0, section: 0)
        XCTAssertEqual(surveyViewModel.descriptionForRowAtIndexPath(indexPath1), "survey 1 description")
        
        let indexPath2 = IndexPath(row: 1, section: 0)
        XCTAssertEqual(surveyViewModel.descriptionForRowAtIndexPath(indexPath2), "survey 2 description")
        
        let indexPath3 = IndexPath(row: 99, section: 99)
        XCTAssertEqual(surveyViewModel.descriptionForRowAtIndexPath(indexPath3), "")
    }
    
    func test_detailViewModelForRowAtIndexPath() {
        let survey1 = Survey()
        survey1.id = 1
        let survey2 = Survey()
        survey2.id = 2
        let surveys = [survey1, survey2]
        
        let viewModel = SurveyViewModel()
        viewModel.survs = surveys
        
        let indexPath = IndexPath(row: 1, section: 0)
        let detailVM = viewModel.detailViewModelForRowAtIndexPath(indexPath)
        XCTAssertEqual(detailVM.survey.id, survey2.id)
    }

    
    //MARK: User Tests
    func test_getInfoFromApiForUser(){
        let user = User()
        user.id = 1
        user.getInfoFromAPI(id: user.id){
            XCTAssertEqual(user.name, "Mark")
        }
    }
    
    func test_getSurveysUserCanTake(){
        let user = User()
        user.id = 1
        user.getSurveysUserCanTakeFromAPI(id: 1){
            XCTAssertEqual(user.takeableSurveys.first?.title, "CMU Mindfulness")
        }
    }
    
    func test_getSurveysUserCreated(){
        let user = User()
        user.id = 1
        user.getSurveysUserCreatedFromAPI(id: 1){
            XCTAssertEqual(user.createdSurveys.first?.title, "Personality Questionnaire")
        }
    }
    
}
