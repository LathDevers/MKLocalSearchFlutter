import Flutter
import MapKit
import CoreLocation
import UIKit

public class SwiftMklocalSearchPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(
            name: "mklocal_search", binaryMessenger: registrar.messenger())
        let instance = SwiftMklocalSearchPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "naturalLanguageQuery":
            guard let args = call.arguments as? [String: Any],
                  let query = args["query"] as? String, !query.isEmpty else {
                result(FlutterError(code: "INVALID_ARGUMENT", message: "Query string must not be empty", details: nil))
                return
            }

            var region: MapKit.MKCoordinateRegion?
            if let regionData = args["region"] as? [String: Any],
               let lat = regionData["latitude"] as? Double,
               let lon = regionData["longitude"] as? Double,
               let latDelta = regionData["latitudeDelta"] as? Double,
               let lonDelta = regionData["longitudeDelta"] as? Double {

                region = MapKit.MKCoordinateRegion(
                    center: CoreLocation.CLLocationCoordinate2D(latitude: lat, longitude: lon),
                    span: MapKit.MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: lonDelta)
                )
            }

            naturalLanguageQuery(query, region: region, flutterResult: result)
        default:
            result(FlutterError(code: "INVALID_METHOD", message: "Invalid method call", details: nil))
        }
    }

    private func naturalLanguageQuery(_ query: String, region: MapKit.MKCoordinateRegion?, flutterResult: @escaping FlutterResult) {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = query
        
        // Use provided region if available
        if let region = region {
            request.region = region
        }

        let search = MKLocalSearch(request: request)
        search.start { result, error in
            if let error = error {
                flutterResult(FlutterError(code: "SEARCH_ERROR", message: "Error performing search", details: error.localizedDescription))
            } else if let result = result {
                do {
                    let json = try self.getResponse(result)
                    flutterResult(json)
                } catch {
                    flutterResult(FlutterError(code: "ENCODING_ERROR", message: "Failed to encode search results", details: error.localizedDescription))
                }
            } else {
                flutterResult(FlutterError(code: "NO_RESULTS", message: "No results found", details: nil))
            }
        }
    }

    private func getResponse(_ result: MKLocalSearch.Response) throws -> String {
        let encodableResponse = MklocalSearchResponse(
            mapItems: result.mapItems, boundingRegion: result.boundingRegion)
        
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        
        let encodedData = try encoder.encode(encodableResponse)
        guard let json = String(data: encodedData, encoding: .utf8) else {
            throw NSError(domain: "JSONEncodingError", code: 0, userInfo: nil)
        }
        
        return json
    }
}