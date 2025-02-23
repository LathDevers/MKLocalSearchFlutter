part of mklocal_search;

class BoundingRegion {
  BoundingRegion({
    this.center,
    this.span,
  });

  BoundingRegion.fromJson(Map<String, dynamic> json) {
    center = json['center'] != null ? Coordinate.fromJson(json['center']) : null;
    span = json['span'] != null ? Span.fromJson(json['span']) : null;
  }

  Coordinate? center;
  Span? span;

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
