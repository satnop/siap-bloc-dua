class TokenManager {
  static final TokenManager _instance = TokenManager._internal();

  factory TokenManager() {
    return _instance;
  }

  TokenManager._internal();

  String _token = '';
  String _kodebag = '';

  String get token => _token;
  String get kodebag => _kodebag;

  void setToken(String token, String kodebag) {
    _token = token;
    _kodebag = kodebag;
  }

  void clearToken() {
    _token = '';
    _kodebag = '';
  }
}
