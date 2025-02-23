part of mklocal_search;

abstract class MklocalSearchPlatform extends PlatformInterface {
  /// Constructs a MklocalSearchPlatform.
  MklocalSearchPlatform() : super(token: _token);

  static final Object _token = Object();

  static MklocalSearchPlatform _instance = MethodChannelMklocalSearch();

  /// The default instance of [MklocalSearchPlatform] to use.
  ///
  /// Defaults to [MethodChannelMklocalSearch].
  static MklocalSearchPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [MklocalSearchPlatform] when
  /// they register themselves.
  static set instance(MklocalSearchPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<MklocalSearchResponse?> naturalLanguageQuery(String query, Coordinate center, Span span) {
    throw UnimplementedError('mklocalSearch() has not been implemented.');
  }
}
