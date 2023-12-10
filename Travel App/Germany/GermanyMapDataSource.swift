//
//  GermanyMapDataSource.swift
//  Travel App
//
//  Created by Tolga Sarikaya on 13.04.23.
//

import UIKit
import MapKit


class GermanyMapDataSource {
    
    var annotationsByCategory: [String: [MKAnnotation]] = [:]
    
    
    init() {
        fillAnnotations()
    }
        
       
        func fillAnnotations() {
            var annotationsSkiCenters = [MKAnnotation]()
            var annotationsCastles = [MKAnnotation]()
         
            // SKi Centers
            annotationsSkiCenters.append(createAnnotation(title: "Garmisch-Partenkirchen", latitude: 47.4919, longitude: 11.0958))
            annotationsSkiCenters.append(createAnnotation(title: "Oberstdorf", latitude: 47.4078, longitude: 10.2797))
            annotationsSkiCenters.append(createAnnotation(title: "Winterberg", latitude: 51.1970, longitude: 8.5201))
            annotationsSkiCenters.append(createAnnotation(title: "Feldberg", latitude: 47.8672, longitude: 8.0039))
            annotationsSkiCenters.append(createAnnotation(title: "Berchtesgaden", latitude: 47.6338 , longitude:13.0048))
            
            // Castles
            annotationsCastles.append(createAnnotation(title: "Heidelberg", latitude: 49.4094, longitude: 8.6947))
            annotationsCastles.append(createAnnotation(title: "Nürnberg", latitude: 49.4550, longitude: 11.0778))
            annotationsCastles.append(createAnnotation(title: "Rothenburg ob der Tauber", latitude: 49.3800, longitude: 10.1797))
            annotationsCastles.append(createAnnotation(title: "Cochem", latitude: 50.1453, longitude: 7.1673))
            annotationsCastles.append(createAnnotation(title: "Marksburg", latitude: 50.2786, longitude: 7.6407))
            
            annotationsByCategory["SkiCenters"] = annotationsSkiCenters
            annotationsByCategory["Castles"] = annotationsCastles
            
        }
    
    func createAnnotation(title: String, latitude: Double, longitude: Double) -> MKAnnotation {
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        annotation.title = title
        return annotation
    }
}
    

