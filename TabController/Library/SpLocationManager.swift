//
//  SpLocationManager.swift
//  EKTracking
//
//  Created by Debashree on 12/22/16.
//  Copyright © 2016 Debashree. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation


protocol LocationDidUpdateDelegate: class {
    func didUpdateLocationWithResult(location: CLLocationCoordinate2D?, error: Error?)
}

protocol LocationServiceType {
    
    var delegate: LocationDidUpdateDelegate? {get set}
    func getLocation() -> Bool
    
}


//TODO:-  update user location in 120 second.
class LocationManager: NSObject, LocationServiceType {
    static let shared: LocationManager = LocationManager()
    public var location: CLLocation? = CLLocation(latitude: 27.679481480007, longitude: 85.3220117899974)
    
    let manager: CLLocationManager?
    weak var delegate: LocationDidUpdateDelegate?
    
    override init() {
        manager = CLLocationManager()
        super.init()
        manager?.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        manager?.delegate = self
        manager?.requestWhenInUseAuthorization()
        manager?.pausesLocationUpdatesAutomatically = true
        manager?.startUpdatingLocation()
    }
    
    func startLocationUpdate() {
        self.manager?.startUpdatingLocation()
    }
    
    func stopLocationUpdate() {
        self.manager?.stopUpdatingLocation()
    }
    
    func getLocation() -> Bool {
        return locationPermissionAuthorized()
    }
    
    func locationPermissionAuthorized() -> Bool {
        return [CLAuthorizationStatus.authorizedAlways, CLAuthorizationStatus.authorizedWhenInUse, CLAuthorizationStatus.notDetermined].contains(CLLocationManager.authorizationStatus())
    }
    
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.location = locations.last
        delegate?.didUpdateLocationWithResult(location: self.location?.coordinate, error: nil)
        self.delegate = nil
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        // delegate?.didUpdateLocationWithResult(location: nil, error: error)
    }
}
