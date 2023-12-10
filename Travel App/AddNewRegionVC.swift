//
//  AddNewRegionVC.swift
//  Travel App
//
//  Created by Tolga Sarikaya on 03.08.23.
//

import UIKit
import MapKit

class AddNewRegionVC: UIViewController,  CLLocationManagerDelegate {

    @IBOutlet var AddNewPlace: MKMapView!
    
   
    
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //AddNewPlace.delegate = self
        locationManager.delegate = self
        
        let recognizer = UILongPressGestureRecognizer(target: self, action: #selector(chooseLocation(gestureRecognizer:)))
        recognizer.minimumPressDuration = 2
        AddNewPlace.addGestureRecognizer(recognizer)
        
    }
    
    
  
    @objc func chooseLocation(gestureRecognizer: UIGestureRecognizer) {
    
        if gestureRecognizer.state == UIGestureRecognizer.State.began {
            
            let touches = gestureRecognizer.location(in: self.AddNewPlace)
            let coordinates = self.AddNewPlace.convert(touches, toCoordinateFrom: self.AddNewPlace)
            
            let annotation = MKPointAnnotation()
            annotation.coordinate = coordinates
            annotation.title = PlaceModel.sharedinstance.placeName
            annotation.subtitle = PlaceModel.sharedinstance.placeType
            
            self.AddNewPlace.addAnnotation(annotation)
            
            PlaceModel.sharedinstance.placeLatitude = String(coordinates.latitude)
            PlaceModel.sharedinstance.placeLongitude = String(coordinates.longitude)
            
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = CLLocationCoordinate2D(latitude: locations[0].coordinate.latitude , longitude: locations[0].coordinate.longitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.020, longitudeDelta: 0.020)
        let region = MKCoordinateRegion(center: location, span: span)
        AddNewPlace.setRegion(region, animated: true)
    }
    
   
    
    @IBAction func saveButtonClicked(_ sender: Any) {
        
        
        
    }
    
   
 

}
