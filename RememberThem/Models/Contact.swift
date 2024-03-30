//
//  Contact.swift
//  RememberThem
//
//  Created by enesozmus on 30.03.2024.
//

import CoreLocation
import Foundation
import SwiftUI

struct Contact: Identifiable, Codable, Comparable {
    var id = UUID()
    var name: String
    var imagePath: String?
    var locationRecord: Bool = false
    var latitude: Double = 0
    var longitude: Double = 0
    
    var coordinate: CLLocationCoordinate2D? {
        guard locationRecord else { return nil }
        
        // .init(latitude: ..., longitude: ...) → Creates a location coordination object with the specified latitude and longitude values.
        return .init(latitude: latitude, longitude: longitude)
    }
    
    
    // → Applying this protocol(Comparable) means writing a static method called < that takes two instances of Contact and internally compares the name properties of each of them:
    // → We can also create methods that can be accessed without creating objects. These types of methods are called static methods.
    static func <(lhs: Contact, rhs: Contact) -> Bool {
        // → The < function needs to accept two instances of your type, one of the left-hand side and one on the right, and return true if the left-hand object should be ordered before the right-hand object.
        lhs.name < rhs.name
    }
}


/*
    CoreLocation (framewoek)
 
        → Core Location provides services that determine a device’s geographic location, altitude, and orientation.
        → The framework gathers data using all available components on the device, including the Wi-Fi, GPS, Bluetooth, magnetometer, barometer, and cellular hardware.
        → You use instances of the CLLocationManager class to configure, start, and stop the Core Location services.
        → A location manager object supports the following location-related activities:
 
            1. Standard and significant location updates. Track large or small changes in the user’s current location with a configurable degree of accuracy.
            2. Region monitoring. Monitor distinct regions of interest and generate location events when the user enters or leaves those regions.
 */


/*
 
    protocol Identifiable
 
        → Identifiable is a protocol in Swift that enforces types to include a unique identifier property.
        → The Identifiable protocol is used to provide a stable notion of identity to a class or value type.
 
            Identities can have any of the following characteristics:
                 1. ✅ Guaranteed always unique, like UUIDs.
                 2. Persistently unique per environment, like database record keys.
                 3. Unique for the lifetime of a process, like global incrementing integers.
                 4. Unique for the lifetime of an object, like object identifiers.
                 5. Unique within the current collection, like collection indices.
 */


/*
 
    protocol Codable
 
    → A type that can convert itself into and out of an external representation.
    → When you use Codable as a type or a generic constraint, it matches any type that conforms to both protocols(Encodable and Decodable).
 
        -> Encodable → A type that can encode itself to an external representation.
        -> Decodable → A type that can decode itself from an external representation.
 
     → Many programming tasks involve sending data over a network connection, saving data to disk, or submitting data to APIs and services.
     → These tasks often require data to be encoded and decoded to and from an intermediate format while the data is being transferred.
     → The Swift standard library defines a standardized approach to data encoding and decoding.
     → You adopt this approach by implementing the Encodable and Decodable protocols on your custom types.
     → Adopting these protocols lets implementations of the Encoder and Decoder protocols take your data and encode or decode it to and from an external representation such as JSON or property list.
     → To support both encoding and decoding, declare conformance to Codable, which combines the Encodable and Decodable protocols.
     → This process is known as making your types codable.
 */


/*
 
    protocol Comparable
 
    → A type that can be compared using the relational operators <, <=, >=, and >.
    → Add Comparable conformance to your own custom types when you want to be able to compare instances using relational operators.
    → The Comparable protocol allows use to the <, >, <=, and >= operators with conforming data types.
    → Most of Swift’s built-in types support Comparable out of the box, but if you want your own type to conform to them then you need to implement < –
 */


/*
 
    UUID
 
        → universally unique identifier
        → A universally unique value to identify types, interfaces, and other items.
        → init() -> Creates a UUID with RFC 4122 version 4 random bytes.
 */


/*
 
    CLLocationCoordinate2D
 
        → The latitude and longitude associated with a location, specified using the WGS 84 reference frame.
        → init() → Creates a location coordinate object.
 */


/*
 
    guard
 
        → A guard statement is used to transfer program control out of a scope if one or more conditions aren’t met.
 
 
             guard expression else {
                // ...statements
                // ...control statement: return, break, continue or throw.
             }
 
        → Here, expression returns either true or false. If the expression evaluates to
 
            true - statements inside the code block of guard are not executed
            false - statements inside the code block of guard are executed
 
        → the code inside the else clause is executed if the condition isn’t true.
        → If the guard statement’s condition is met, code execution continues after the guard statement’s closing brace.
 */
