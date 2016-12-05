//
//  SMLocationCreateViewController.swift
//  surveyApp
//
//  Created by Annette Chen on 12/3/16.
//  Copyright © 2016 Annette Chen. All rights reserved.
//

import Foundation
import Alamofire
import MapKit

class SMLocationCreateViewController: UIViewController {
    @IBOutlet weak var mapView: MKMapView!
    
    let restriction = Restriction()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        restriction.getCurrentLocation()
        let initialLocation = CLLocation(latitude: restriction.latitude, longitude: restriction.longitude)
        centerMapOnLocation(location: initialLocation)
        let droppedPin = MKPointAnnotation()
        droppedPin.coordinate = CLLocationCoordinate2D(latitude: restriction.latitude, longitude: restriction.longitude)
        droppedPin.title = "You Are Here"
        mapView.addAnnotation(droppedPin)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    let regionRadius: CLLocationDistance = 10000

    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }
}
