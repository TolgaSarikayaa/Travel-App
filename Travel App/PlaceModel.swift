//
//  PlaceModel.swift
//  Travel App
//
//  Created by Tolga Sarikaya on 03.08.23.
//

import Foundation
import UIKit


class PlaceModel {
    
    static let sharedinstance = PlaceModel()
    
    var placeName = ""
    var placeType = ""
    var placeAtmosphere = ""
    var placeImage = UIImage()
    var placeLatitude = ""
    var placeLongitude = ""
    
    private init(){}
    
    
}
