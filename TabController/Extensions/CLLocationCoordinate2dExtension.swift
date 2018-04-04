//
//  CLLocationCoordinate2dExtension.swift
//  Sipradi
//
//  Created by shishir sapkota on 7/7/17.
//  Copyright © 2017 Ekbana. All rights reserved.
//
import Foundation
import CoreLocation
import MapKit

extension CLLocationCoordinate2D {
    func openMapForPlace(title: String) {
        
        if UIApplication.shared.canOpenURL(URL(string: "comgooglemaps://")!) {
            // google map exists
            UIApplication.shared.open(URL(string: "comgooglemaps://?saddr=&daddr=\(self.latitude),\(self.longitude)&directionsmode=driving")!, options: [:], completionHandler: nil)
        }else {
            let startPoint: String
            if let coordiante = LocationManager.shared.location?.coordinate {
                startPoint = "\(coordiante.latitude),\(coordiante.longitude)"
            }else {
                startPoint = ""
            }
            // google map doesnt exist
            UIApplication.shared.open(URL(string:"http://maps.google.com/?saddr=\(startPoint)&daddr=\(self.latitude),\(self.longitude)")!, options: [:], completionHandler: nil)
        }
    }
    
}

