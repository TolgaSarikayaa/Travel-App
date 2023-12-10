//
//  GermanyMapVcCastles.swift
//  Travel App
//
//  Created by Tolga Sarikaya on 14.04.23.
//

import UIKit
import MapKit

class GermanyMapVcCastles: UIViewController {

    @IBOutlet var mapview: MKMapView!
    
    private let dataSource: GermanyMapDataSource
    
    required init?(coder: NSCoder) {
        dataSource = GermanyMapDataSource()
        super.init(coder: coder)
        
        title = "Castles"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        mapview.delegate = self
        
        if let annotations = dataSource.annotationsByCategory["Castles"] {
            mapview.addAnnotations(annotations)
            mapview.showAnnotations(annotations, animated: false)
            
        }
        
    
        
    }
    
}

extension GermanyMapVcCastles : MKMapViewDelegate {
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
