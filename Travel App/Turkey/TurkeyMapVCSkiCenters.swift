//
//  TurkeyMapVCSkiCenters.swift
//  Travel App
//
//  Created by Tolga Sarikaya on 13.04.23.
//

import UIKit
import MapKit

class TurkeyMapVCSkiCenters: UIViewController, CLLocationManagerDelegate {

    // MARK: - UI Elements
    @IBOutlet var mapView2: MKMapView!
    
    private let dataSource: MapDataSource
  
    
    required init?(coder: NSCoder) {
        dataSource = MapDataSource()
        super.init(coder: coder)
        
        title = "Ski Centers"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
       
        
        setupMapView(mapView2, dataSource:  dataSource)
        
        
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation {
            return nil
        }
        
        let reuseId = "pin"
        var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseId) as? MKMarkerAnnotationView
        
        if pinView == nil {
            pinView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
            pinView?.canShowCallout = true
            
            let button = UIButton(type: .detailDisclosure)
            pinView?.rightCalloutAccessoryView = button
        } else {
            pinView?.annotation = annotation
        }
        
        return pinView
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        if control == view.rightCalloutAccessoryView {
         
            if let annotation = view.annotation {
                let coordinate = annotation.coordinate
                let placemark = MKPlacemark(coordinate: coordinate)
                let mapItem = MKMapItem(placemark: placemark)
                mapItem.name = annotation.title ?? "Destination"
                let options = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving]
                mapItem.openInMaps(launchOptions: options)
            }
        }
    }
    
    
    
    
   }
    


