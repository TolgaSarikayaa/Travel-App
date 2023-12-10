//
//  Extension.swift
//  Travel App
//
//  Created by Tolga Sarikaya on 03.12.23.
//

import UIKit
import MapKit

/*
extension UIViewController : MKMapViewDelegate {
    func setupMapView(_ mapView: MKMapView, dataSource: MapDataSource) {
           mapView.delegate = self
           mapView.pointOfInterestFilter = MKPointOfInterestFilter(including: [.restaurant, .cafe, .nightlife, .hotel])

           // Assuming you want to display annotations from both "Warm" and "Cold" categories
           if let annotations = dataSource.annotationsByCategory["Warm"] {
               mapView.addAnnotations(annotations)
               mapView.showAnnotations(annotations, animated: false)
           }

           if let annotations = dataSource.annotationsByCategory["Cold"] {
               mapView.addAnnotations(annotations)
               mapView.showAnnotations(annotations, animated: false)
           }
       }
   }
*/

extension UIViewController  {
    func setupMapView(_ mapView: MKMapView, dataSource: GermanyMapDataSource) {
        //mapView.delegate = self
        mapView.pointOfInterestFilter = MKPointOfInterestFilter(including: [.restaurant, .cafe, .nightlife, .hotel])
        mapView.addAnnotations(dataSource.annotations)
        mapView.showAnnotations(dataSource.annotations, animated: false)
    }
}


extension CLLocationManager: CLLocationManagerDelegate {
    static func setupLocationManager(for delegate: CLLocationManagerDelegate) -> CLLocationManager {
        let locationManager = CLLocationManager()
        locationManager.requestWhenInUseAuthorization()
        locationManager.delegate = delegate
        return locationManager
    }
}



