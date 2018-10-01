//
//  ViewController.swift
//  Maps
//
//  Created by Tarek Moubarak on 10/1/18.
//  Copyright © 2018 Tarek Moubarak. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let latitude: CLLocationDegrees = 33.9808662
        let longitude: CLLocationDegrees = 35.636951
        let latDelta: CLLocationDegrees = 0.01
        let longDelta: CLLocationDegrees = 0.01
        let span: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: longDelta)
        
        let location: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        
        let region: MKCoordinateRegion = MKCoordinateRegion(center: location, span: span)
        mapView.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        annotation.title = "Hellotree"
        annotation.subtitle = "BEST WEB & MOBILE DEVS IN TOWN"
        mapView.addAnnotation(annotation)
        
        let uiLongPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.longpress(gestureRecognier:)))
        uiLongPressGestureRecognizer.minimumPressDuration = 1
        mapView.addGestureRecognizer(uiLongPressGestureRecognizer)
    }
    
    @objc func longpress(gestureRecognier: UIGestureRecognizer){
        let touchPoint = gestureRecognier.location(in: self.mapView)
        let coordinate = mapView.convert(touchPoint, toCoordinateFrom: self.mapView)

        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: coordinate.latitude, longitude: coordinate.longitude)
        annotation.title = "New Place"
        annotation.subtitle = "Maybe i'll go here too..."
        
        mapView.addAnnotation(annotation)
    }


}

