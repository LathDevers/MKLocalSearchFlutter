//
//  MKCoordinateSpan.swift
//  mklocal_search
//
//  Created by Jonathan Eduardo Garcia Garcia on 27/09/22.
//

import Foundation
import MapKit

public struct MKCoordinateSpan: Codable {

    public var latitudeDelta: CLLocationDegrees

    public var longitudeDelta: CLLocationDegrees

    public init(mkCoordinateSpan: MapKit.MKCoordinateSpan) {
        latitudeDelta = mkCoordinateSpan.latitudeDelta
        longitudeDelta = mkCoordinateSpan.longitudeDelta
    }

}
