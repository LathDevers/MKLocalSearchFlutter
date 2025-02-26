import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:mklocal_search/mklocal_search.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  MklocalSearchResponse? searchResponse;
  final _mklocalSearchPlugin = MklocalSearch();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    MklocalSearchResponse? searchResponse;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      searchResponse = await _mklocalSearchPlugin.naturalLanguageQuery(
        "apple store",
        Coordinate(latitude: 37.7749, longitude: -122.4194),
        Span(latitudeDelta: 0.1, longitudeDelta: 0.1),
      );
    } on PlatformException {
      searchResponse = null;
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      this.searchResponse = searchResponse;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Apple stores found:'),
        ),
        body: Column(children: [
          Expanded(
            child: ListView.builder(
              itemCount: searchResponse?.mapItems?.length ?? 0,
              itemBuilder: (context, index) {
                return Card(
                    child: Column(children: [
                  const Text("Is current location:"),
                  Text(searchResponse?.mapItems?[index].isCurrentLocation == null
                      ? "not avaible"
                      : searchResponse?.mapItems?[index].isCurrentLocation ?? false
                          ? "Yes"
                          : "No"),
                  const Text("Name:"),
                  Text(searchResponse?.mapItems?[index].name ?? ""),
                  const Text("Phone:"),
                  Text(searchResponse?.mapItems?[index].phoneNumber ?? ""),
                  const Text("Website:"),
                  Text(searchResponse?.mapItems?[index].url ?? ""),
                  const Text("Placemark data:"),
                  const Text("Country:"),
                  Text(searchResponse?.mapItems?[index].placemark?.country ?? ""),
                  const Text("Country code:"),
                  Text(searchResponse?.mapItems?[index].placemark?.isoCountryCode ?? ""),
                  const Text("Postal code:"),
                  Text(searchResponse?.mapItems?[index].placemark?.postalCode ?? ""),
                  const Text("Administrative area:"),
                  Text(searchResponse?.mapItems?[index].placemark?.administrativeArea ?? ""),
                  const Text("Locality:"),
                  Text(searchResponse?.mapItems?[index].placemark?.locality ?? ""),
                  const Text("Thoroughfare:"),
                  Text(searchResponse?.mapItems?[index].placemark?.thoroughfare ?? ""),
                  const Text("Sub thoroughfare:"),
                  Text(searchResponse?.mapItems?[index].placemark?.subThoroughfare ?? ""),
                  const Text("Name:"),
                  Text(searchResponse?.mapItems?[index].placemark?.name ?? ""),
                  const Text("Location data:"),
                  const Text("Latitude:"),
                  Text(searchResponse?.mapItems?[index].placemark?.location?.coordinate?.latitude.toString() ?? ""),
                  const Text("Longitude:"),
                  Text(searchResponse?.mapItems?[index].placemark?.location?.coordinate?.longitude.toString() ?? ""),
                  const Text("Altitude:"),
                  Text(searchResponse?.mapItems?[index].placemark?.location?.altitude.toString() ?? ""),
                  const Text("Horizontal accuracy:"),
                  Text(searchResponse?.mapItems?[index].placemark?.location?.horizontalAccuracy.toString() ?? ""),
                  const Text("Vertical accuracy:"),
                  Text(searchResponse?.mapItems?[index].placemark?.location?.verticalAccuracy.toString() ?? ""),
                  const Text("Speed:"),
                  Text(searchResponse?.mapItems?[index].placemark?.location?.speed.toString() ?? ""),
                  const Text("Course:"),
                  Text(searchResponse?.mapItems?[index].placemark?.location?.course.toString() ?? ""),
                  const Text("Timestamp:"),
                  Text(searchResponse?.mapItems?[index].placemark?.location?.timestamp.toString() ?? ""),
                ]));
              },
            ),
          ),
        ]),
      ),
    );
  }
}
