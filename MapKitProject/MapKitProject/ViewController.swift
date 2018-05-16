//
//  ViewController.swift
//  MapKitProject
//
//  Created by Maria Donet Climent on 16/5/18.
//  Copyright © 2018 MariaDonet. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    let locationMgr = CLLocationManager()
    let pizzaAnnotations = PizzaAnnotations()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
//        mapView.showsUserLocation = true
        
        locationMgr.delegate = self
        locationMgr.startUpdatingLocation()
        locationMgr.desiredAccuracy = kCLLocationAccuracyBest
        locationMgr.requestAlwaysAuthorization()
        
        // add the annotations
        mapView.addAnnotations(pizzaAnnotations.restaurants)
    }
}

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation:CLLocation = locations[0] as CLLocation
        
        // Call stopUpdatingLocation() to stop listening for location updates,
        // other wise this function will be called every time when user location changes.
        locationMgr.stopUpdatingLocation()
        
        let center = CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        
        mapView.setRegion(region, animated: true)
        
        // Drop a pin at user's Current Location
        let myAnnotation = PizzaAnnotation(userLocation.coordinate.latitude, userLocation.coordinate.longitude, title: "USER LOCATION", subtitle: "Where you are", type: .userLocation)
        mapView.addAnnotation(myAnnotation)
    }
}

extension ViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard let myAnnotation = annotation as? PizzaAnnotation else {
            return nil
        }
        
        var identifier = myAnnotation.title ?? ""
        var annotationView = MKMarkerAnnotationView()
        if let dequedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKMarkerAnnotationView {
            annotationView = dequedView
        } else{
            annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
        }
        
        switch myAnnotation.type {
        case .userLocation:
            annotationView.glyphImage = UIImage(named: "bubble")
        case .restaurant:
            annotationView.selectedGlyphImage = UIImage(named: "circle")
        }
        //annotationView.clusteringIdentifier = identifier
        
        return annotationView
    }
}
