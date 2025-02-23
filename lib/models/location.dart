part of mklocal_search;

class Location {
  Location({
    this.verticalAccuracy,
    this.course,
    this.speed,
    this.horizontalAccuracy,
    this.speedAccuracy,
    this.timestamp,
    this.ellipsoidalAltitude,
    this.courseAccuracy,
    this.altitude,
    this.coordinate,
  });

  Location.fromJson(Map<String, dynamic> json) {
    verticalAccuracy = json['verticalAccuracy'];
    course = json['course'];
    speed = json['speed'];
    horizontalAccuracy = json['horizontalAccuracy'];
    speedAccuracy = json['speedAccuracy'];
    timestamp = json['timestamp'];
    ellipsoidalAltitude = json['ellipsoidalAltitude'];
    courseAccuracy = json['courseAccuracy'];
    altitude = json['altitude'];
    coordinate = json['coordinate'] != null ? Coordinate.fromJson(json['coordinate']) : null;
  }

  int? verticalAccuracy;
  int? course;
  int? speed;
  int? horizontalAccuracy;
  int? speedAccuracy;
  double? timestamp;
  int? ellipsoidalAltitude;
  int? courseAccuracy;
  int? altitude;
  Coordinate? coordinate;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['verticalAccuracy'] = verticalAccuracy;
    data['course'] = course;
    data['speed'] = speed;
    data['horizontalAccuracy'] = horizontalAccuracy;
    data['speedAccuracy'] = speedAccuracy;
    data['timestamp'] = timestamp;
    data['ellipsoidalAltitude'] = ellipsoidalAltitude;
    data['courseAccuracy'] = courseAccuracy;
    data['altitude'] = altitude;
    if (coordinate != null) {
      data['coordinate'] = coordinate!.toJson();
    }
    return data;
  }
}
