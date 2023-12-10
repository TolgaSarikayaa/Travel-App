//
//  TurkeyMapDataSource.swift
//  Travel App
//
//  Created by Tolga Sarikaya on 13.04.23.
//

import UIKit
import MapKit

class MapDataSource {
    
    var annotationsByCategory: [String: [MKAnnotation]] = [:]

        init() {
            fillAnnotations()
        }

        func fillAnnotations() {
            var annotationsWarmRegions = [MKAnnotation]()
            var annotationsColdRegions = [MKAnnotation]()

            // Warm Regions
            annotationsWarmRegions.append(createAnnotation(title: "Antalya", latitude: 36.884804, longitude: 30.704044))
            annotationsWarmRegions.append(createAnnotation(title: "İzmir", latitude: 38.423733, longitude: 27.142826))
            annotationsWarmRegions.append(createAnnotation(title: "Muğla", latitude: 37.215374, longitude: 28.363394))
            annotationsWarmRegions.append(createAnnotation(title: "Bodrum", latitude: 37.0331, longitude: 27.4290))
            annotationsWarmRegions.append(createAnnotation(title: "Kuşadası", latitude: 37.8594, longitude: 27.2647))
            annotationsWarmRegions.append(createAnnotation(title: "Marmaris", latitude: 36.8554, longitude: 28.2744))
            annotationsWarmRegions.append(createAnnotation(title: "Fethiye", latitude: 36.6213, longitude: 29.1141))

            // Cold Regions
            annotationsColdRegions.append(createAnnotation(title: "Erzurum: Palandöken", latitude: 39.9086, longitude: 41.2597))
            annotationsColdRegions.append(createAnnotation(title: "Kars: Sarıkamış", latitude: 40.4467, longitude: 42.5569))
            annotationsColdRegions.append(createAnnotation(title: "Bursa: Uludağ", latitude: 40.0981, longitude: 29.3117))
            annotationsColdRegions.append(createAnnotation(title: "Isparta: Davraz", latitude: 37.7615, longitude: 30.5882))

            annotationsByCategory["Warm"] = annotationsWarmRegions
            annotationsByCategory["Cold"] = annotationsColdRegions
        }

        func createAnnotation(title: String, latitude: Double, longitude: Double) -> MKAnnotation {
            let annotation = MKPointAnnotation()
            annotation.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
            annotation.title = title
            return annotation
        }
    }
