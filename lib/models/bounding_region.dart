import 'package:mklocal_search/models/span.dart';

import 'coordinate.dart';

class BoundingRegion {
  Coordinate? center;
  Span? span;

  BoundingRegion({this.center, this.span});

  BoundingRegion.fromJson(Map<String, dynamic> json) {
    center =
        json['center'] != null ? Coordinate.fromJson(json['center']) : null;
    span = json['span'] != null ? Span.fromJson(json['span']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (center != null) {
      data['center'] = center!.toJson();
    }
    if (span != null) {
      data['span'] = span!.toJson();
    }
    return data;
  }
}
