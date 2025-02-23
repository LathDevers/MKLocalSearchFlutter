part of mklocal_search;

class MklocalSearchResponse {
  MklocalSearchResponse({
    this.mapItems,
    this.boundingRegion,
  });

  MklocalSearchResponse.fromJson(Map<String, dynamic> json) {
    if (json['mapItems'] != null) {
      mapItems = <MapItem>[];
      json['mapItems'].forEach((v) {
        mapItems!.add(MapItem.fromJson(v));
      });
    }
    boundingRegion = json['boundingRegion'] != null ? BoundingRegion.fromJson(json['boundingRegion']) : null;
  }

  List<MapItem>? mapItems;
  BoundingRegion? boundingRegion;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (mapItems != null) {
      data['mapItems'] = mapItems!.map((v) => v.toJson()).toList();
    }
    if (boundingRegion != null) {
      data['boundingRegion'] = boundingRegion!.toJson();
    }
    return data;
  }
}
