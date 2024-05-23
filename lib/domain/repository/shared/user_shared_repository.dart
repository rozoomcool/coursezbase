import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/prefs_constants.dart';
import '../../model/user_data.dart';

class UserDataSharedRepository {
  final SharedPreferences _sharedPreferences;

  UserDataSharedRepository(this._sharedPreferences);

  void setUserData(UserData userData) {
    _sharedPreferences.setString(
        userDataPrefsName, userData.toJson().toString());
  }

  UserData? getUserData() {
    final jsonString = _sharedPreferences.getString(userDataPrefsName);
    if (jsonString == null) {
      return null;
    }
    final jsonMap = json.decode(jsonString) as Map<String, dynamic>;
    return UserData.fromJson(jsonMap);
  }
}
