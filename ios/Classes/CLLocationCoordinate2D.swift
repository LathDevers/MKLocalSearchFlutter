//
//  CLLocationCoordinate2D.swift
//  mklocal_search
//
//  Created by Jonathan Eduardo Garcia Garcia on 27/09/22.
//

import Foundation
import MapKit

struct CLLocationCoordinate2D: Codable {

    public var latitude: CLLocationDegrees

    public var longitude: CLLocationDegrees

    init(coords: MapKit.CLLocationCoordinate2D) {
        latitude = coords.latitude
        longitude = coords.longitude
    }
}
