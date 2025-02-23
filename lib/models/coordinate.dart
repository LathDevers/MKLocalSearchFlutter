part of mklocal_search;

class Coordinate {
  Coordinate({
    this.longitude,
    this.latitude,
  });

  Coordinate.fromJson(Map<String, dynamic> json) {
    longitude = json['longitude'];
    latitude = json['latitude'];
  }

  double? longitude;
  double? latitude;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['longitude'] = longitude;
    data['latitude'] = latitude;
    return data;
  }
}
