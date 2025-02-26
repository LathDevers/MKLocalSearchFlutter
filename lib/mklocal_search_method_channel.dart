part of mklocal_search;

/// An implementation of [MklocalSearchPlatform] that uses method channels.
class MethodChannelMklocalSearch extends MklocalSearchPlatform {
  @visibleForTesting
  final methodChannel = const MethodChannel('mklocal_search');

  @override
  Future<MklocalSearchResponse?> naturalLanguageQuery(String query, Coordinate center, Span span) async {
    final jsonResponse = await methodChannel.invokeMethod('naturalLanguageQuery', {
      'query': query,
      'region': {
        'latitude': center.latitude,
        'longitude': center.longitude,
        'latitudeDelta': span.latitudeDelta,
        'longitudeDelta': span.longitudeDelta,
      }
    });
    if (jsonResponse != null && jsonResponse.isNotEmpty) {
      try {
        return MklocalSearchResponse.fromJson(json.decode(jsonResponse));
      } catch (e) {
        log(e.toString());
        return null;
      }
    }
    return null;
  }
}
