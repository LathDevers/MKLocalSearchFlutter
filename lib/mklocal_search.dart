library mklocal_search;

import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'package:plugin_platform_interface/plugin_platform_interface.dart';

part 'mklocal_search_method_channel.dart';
part 'mklocal_search_platform_interface.dart';
part 'models/mklocal_search_response.dart';
part 'models/placemark.dart';
part 'models/coordinate.dart';
part 'models/location.dart';
part 'models/map_item.dart';
part 'models/span.dart';
part 'models/bounding_region.dart';

class MklocalSearch {
  Future<MklocalSearchResponse?> naturalLanguageQuery(String query, Coordinate center, Span span) {
    return MklocalSearchPlatform.instance.naturalLanguageQuery(query, center, span);
  }
}
