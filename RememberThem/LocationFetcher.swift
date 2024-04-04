//
//  LocationFetcher.swift
//  RememberThem
//
//  Created by enesozmus on 2.04.2024.
//

import CoreLocation
import Foundation

class LocationFetcher: NSObject, CLLocationManagerDelegate {
    let manager = CLLocationManager()
    var lastKnownLocation: CLLocationCoordinate2D?
    
    override init() {
        super.init()
        manager.delegate = self
    }
    
    func start() {
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        lastKnownLocation = locations.first?.coordinate
    }
}

/*
    CoreLocation (framework)
 
        → CoreLocation provides services that determine a device’s geographic location, altitude, and orientation.
        → The framework gathers data using all available components on the device, including the Wi-Fi, GPS, Bluetooth, magnetometer, barometer, and cellular hardware.
        → You use instances of the CLLocationManager class to configure, start, and stop the CoreLocation services.
 */


/*
    NSObject
 
        → The root class of most Objective-C class hierarchies, from which subclasses inherit a basic interface to the runtime system and the ability to behave as Objective-C objects.
 */


/*
 
    CLLocationManagerDelegate
        → The methods that you use to receive events from an associated location-manager object.
        → The location manager calls its delegate’s methods to report location-related events to your app.
        → For example, you might use the current location to update the user’s position on a map or you might return search results relevant only to the user’s current location.
 
    CLLocationManager
        → The object that you use to start and stop the delivery of location-related events to your app.
        → A CLLocationManager object is the central place to manage your app’s location-related behaviors.
        → Use a location-manager object to configure, start, and stop location services.
    
    CLLocationCoordinate2D
        → The latitude and longitude associated with a location, specified using the WGS 84 reference frame.
    
    requestWhenInUseAuthorization()
        → Requests the user’s permission to use location services while the app is in use.
    
    startUpdatingLocation()
        → Starts the generation of updates that report the user’s current location.
    
    CLLocation
        → The latitude, longitude, and course information reported by the system.
 */
