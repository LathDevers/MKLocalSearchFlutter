//
//  MklocalSearchResponse.swift
//  mklocal_search
//
//  Created by Jonathan Eduardo Garcia Garcia on 27/09/22.
//

import Foundation
import MapKit

public struct MKMapItem: Codable {
    var isCurrentLocation: Bool
    var url: URL?
    var name: String?
    var phoneNumber: String?
    // If this MKMapItem represents your current location (isCurrentLocation == YES), then placemark will be nil.
    var placemark: MKPlacemark

    init(mapItem: MapKit.MKMapItem) {
        isCurrentLocation = mapItem.isCurrentLocation
        name = mapItem.name
        phoneNumber = mapItem.phoneNumber
        url = mapItem.url
        placemark = MKPlacemark(mkPlacemark: mapItem.placemark)
    }

}
