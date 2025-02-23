//
//  MKPlacemark.swift
//  mklocal_search
//
//  Created by Jonathan Eduardo Garcia Garcia on 27/09/22.
//

import Foundation
import MapKit

struct MKPlacemark: Codable {

    var location: CLLocation?

    var name: String?

    var thoroughfare: String?  // street name, eg. Infinite Loop

    var subThoroughfare: String?  // eg. 1

    var locality: String?

    var subLocality: String?

    var administrativeArea: String?  // state, eg. CA

    var subAdministrativeArea: String?

    var postalCode: String?

    var isoCountryCode: String?  // eg. US

    var country: String?

    var inlandWater: String?  // eg. Lake Tahoe

    var ocean: String?

    var areasOfInterest: [String]?

    init(mkPlacemark: MapKit.MKPlacemark) {
        name = mkPlacemark.name
        thoroughfare = mkPlacemark.thoroughfare
        subThoroughfare = mkPlacemark.subThoroughfare
        locality = mkPlacemark.locality
        subLocality = mkPlacemark.subLocality
        administrativeArea = mkPlacemark.administrativeArea
        subAdministrativeArea = mkPlacemark.subAdministrativeArea
        postalCode = mkPlacemark.postalCode
        isoCountryCode = mkPlacemark.isoCountryCode
        country = mkPlacemark.country
        inlandWater = mkPlacemark.inlandWater
        ocean = mkPlacemark.ocean
        areasOfInterest = mkPlacemark.areasOfInterest
        if let _location = mkPlacemark.location {
            location = CLLocation(cclLocation: _location)
        }

    }

}
