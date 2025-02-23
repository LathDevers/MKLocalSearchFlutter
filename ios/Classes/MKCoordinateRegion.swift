//
//  MklocalSearchResponse.swift
//  mklocal_search
//
//  Created by Jonathan Eduardo Garcia Garcia on 27/09/22.
//

import Foundation
import MapKit

public struct MKCoordinateRegion: Codable {

    var center: CLLocationCoordinate2D
    var span: MKCoordinateSpan

    init(boundingRegion: MapKit.MKCoordinateRegion) {
        center = CLLocationCoordinate2D(coords:boundingRegion.center)
        span = MKCoordinateSpan(mkCoordinateSpan:boundingRegion.span)
    }

}
