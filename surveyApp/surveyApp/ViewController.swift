//
//  ViewController.swift
//  surveyApp
//
//  Created by Annette Chen on 11/8/16.
//  Copyright © 2016 Annette Chen. All rights reserved.
//

import UIKit
import Alamofire
import FBSDKLoginKit

// MARK: UISearch extension
extension ViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
}

var user = User()

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    let viewModel = SurveyViewModel()
    
    //for Search
    let searchController = UISearchController(searchResultsController: nil)
    
    // MARK: Std View Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        user.id = 3
        //register the nib
        let cellNib = UINib(nibName: "FilteredSurveyCell", bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: "FilteredSurveyCell")
        tableView.delegate = self
        
        tableView.dataSource = self
        
        //setup search bar(method at the bottom of file)
        setupSearchBar()
        
        //get the data for the table
        user.getSurveysUserCanTakeFromAPI(id: 2){ [unowned self] in
            print("getting surveys for table")
            DispatchQueue.main.async {
                self.viewModel.filteredSurvs = user.takeableSurveys
                self.tableView.reloadData()
            }
        }
        //user.filterTakeableSurveysByLocation()
//        tableView.reloadData()

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let selectedRow = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: selectedRow, animated: true)
        }
    }
    
    //MARK: Button Interaction
    
    @IBAction func userProfileAction(sender: AnyObject) {
        // Create a new "Storyboard2" instance.
        let storyboard = UIStoryboard(name: "UserProfile", bundle: nil)
        
        // Create an instance of the storyboard's initial view controller.
        let controller = storyboard.instantiateViewController(withIdentifier: "UserProfileController") as UIViewController
        
        // Display the new view controller.
        present(controller, animated: true, completion: nil)
    }
    
    @IBAction func makeASurvey(sender: AnyObject){
        // Create a new Storyboard instance.
        let storyboard = UIStoryboard(name: "SurveyMonkey", bundle: nil)
        
        // Create an instance of the storyboard's initial view controller.
        let controller = storyboard.instantiateViewController(withIdentifier: "CreateSurveyController") as UIViewController
        
        // Display the new view controller.
        present(controller, animated: true, completion: nil)
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toSurveyMonkeyToTake", sender: indexPath)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FilteredSurveyCell", for: indexPath as IndexPath) as!FilteredSurveyCell
        
        print(indexPath.row)
        print(viewModel.filteredSurvs[0].title)
        cell.surveyTitle?.text = viewModel.filteredSurvs[indexPath[1]].title
        cell.points?.text = "\(viewModel.filteredSurvs[indexPath[1]].points)pts"
        cell.surveyDesc?.text = viewModel.filteredSurvs[indexPath[1]].description
        cell.time?.text = "\(viewModel.filteredSurvs[indexPath[1]].est_time)min."

        return cell
    }
    
    // MARK: Segues
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let surveyDetailVC = segue.destination as? SMTakerViewController,
            let indexPath = sender as? IndexPath {
            let vm = SurveyDetailViewModel(survey: viewModel.filteredSurvs[indexPath[1]])
            surveyDetailVC.viewModel = vm
            print ("SURVEY ID")
            print (viewModel.filteredSurvs[indexPath[1]].id)
            print("USER ID")
            print(user.id)
        }
    }
    
    
    // MARK: Search Methods
    func setupSearchBar() {
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar
    }
    
    func filterContentForSearchText(_ searchText: String, scope: String = "All") {
        viewModel.updateFiltering(searchText)
        tableView.reloadData()
    }
    
    

    

}
