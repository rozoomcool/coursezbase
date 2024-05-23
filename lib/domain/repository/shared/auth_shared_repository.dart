import 'package:shared_preferences/shared_preferences.dart';

class AuthSharedRepository {
  final SharedPreferences _sharedPreferences;

  AuthSharedRepository(this._sharedPreferences);

  void setTokens(String accessToken, String refreshToken) {
    _sharedPreferences.setString("access", accessToken);
    _sharedPreferences.setString("refresh", refreshToken);
  }

  String getAccessToken() {
    return _sharedPreferences.getString("access") ?? "";
  }

  String getRefreshToken() {
    return _sharedPreferences.getString("refresh") ?? "";
  }
}