//
//  CLLocation.swift
//  mklocal_search
//
//  Created by Jonathan Eduardo Garcia Garcia on 27/09/22.
//

import Foundation
import MapKit

struct CLLocation: Codable {
    var coordinate: CLLocationCoordinate2D
    var altitude: Double
    var ellipsoidalAltitude: Double
    var horizontalAccuracy: Double
    var verticalAccuracy: Double
    var course: Double
    var courseAccuracy: Double
    var speed: Double
    var speedAccuracy: Double
    var timestamp: Date
    var floorLevel: Int?
    //var sourceInformation: CLLocationSourceInformation? ;

    init(cclLocation: MapKit.CLLocation) {
        coordinate = CLLocationCoordinate2D(coords: cclLocation.coordinate)
        altitude = cclLocation.altitude
        horizontalAccuracy = cclLocation.horizontalAccuracy
        verticalAccuracy = cclLocation.verticalAccuracy
        course = cclLocation.course
        speed = cclLocation.speed
        speedAccuracy = cclLocation.speedAccuracy
        timestamp = cclLocation.timestamp
        floorLevel = cclLocation.floor?.level

        if #available(iOS 13.4, *) {
            courseAccuracy = cclLocation.courseAccuracy
        } else {
            courseAccuracy = -1
        }
        if #available(iOS 15, *) {
            ellipsoidalAltitude = cclLocation.ellipsoidalAltitude
        } else {
            ellipsoidalAltitude = -1.0
        }
    }
}