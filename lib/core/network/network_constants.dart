class NetworkConstants {
  static const String _kBaseUrl = 'https://gateway.marvel.com:443/';
  static const String _kVersion = 'v1';
  static const String _kPublic = 'public';

  // full BaseUrl
  static const String kFullBaseUrl = '$_kBaseUrl$_kVersion/$_kPublic/';

  // endpoints
  static const String kCharacters = 'characters';
}
