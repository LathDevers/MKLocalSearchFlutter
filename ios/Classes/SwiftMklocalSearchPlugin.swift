import Flutter
import MapKit
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
            if call.arguments == nil {
                result("Natural query string must not be nil")
            }
            let query: String = String(describing: call.arguments!)
            naturalLanguageQuery(query, flutterResult: result)
            return
        default:
            result("Invalid flutter call invokeMethod name")
        }
    }

    private func naturalLanguageQuery(_ query: String, flutterResult: @escaping FlutterResult) {
        if query.isEmpty {
            flutterResult("Natural query string must not be empty")
            return
        }
        var region: MapKit.MKCoordinateRegion? = nil
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = query
        if let r: MapKit.MKCoordinateRegion = region {
            request.region = r
        }
        let search = MKLocalSearch(request: request)
        search.start(completionHandler: { _result, _error in
            if let result = _result {
                let json: String = self.getResponse(result)
                flutterResult(json)
            } else if let error = _error {
                flutterResult("Unexpected error: \(error).")
            }
        })
    }

    private func getResponse(_ result: MKLocalSearch.Response) -> String {
        let encodableResponse: MklocalSearchResponse = MklocalSearchResponse(
            mapItems: result.mapItems, boundingRegion: result.boundingRegion)
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        let encodedData = try! encoder.encode(encodableResponse)
        let json = String(data: encodedData, encoding: .utf8)!
        return json
    }
}
