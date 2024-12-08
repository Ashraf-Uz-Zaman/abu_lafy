import 'dart:convert';

import 'package:abu_lafy/domain/model/user_model.dart';
import 'package:abu_lafy/presentation/resources/language_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String PREFS_KEY_LANG = "PREFS_KEY_LANG";
const String PREFS_KEY_IS_USER_LOGGED_IN = "PREFS_KEY_IS_USER_LOGGED_IN";
const String PREFS_KEY_TOKEN = "PREFS_KEY_TOKEN";
const String PREFS_KEY_USER_DETAILS = "PREFS_KEY_USER_DETAILS";

class AppPreferences {
  final SharedPreferences _sharedPreferences;
  AppPreferences(this._sharedPreferences);

  Future<String> getAppLanguage() async {
    String? language = _sharedPreferences.getString(PREFS_KEY_LANG);

    if (language != null && language.isNotEmpty) {
      return language;
    } else {
      return LanguageType.ENGLISH.getValue();
    }
  }

  Future<void> setUser(UserModel model) async {


    _sharedPreferences.setString(PREFS_KEY_USER_DETAILS,  jsonEncode(model.toJson()));
  }
  Future<void> removeUser() async {


    _sharedPreferences.remove(PREFS_KEY_USER_DETAILS);
  }
  Future<UserModel> getUser() async {
    String? userJson = _sharedPreferences.getString(PREFS_KEY_USER_DETAILS);

    if (userJson != null) {
      return UserModel.fromJson(jsonDecode(userJson));
    } else {
      return UserModel();
    }

  }
  Future<void> setUserToken(String token) async {
    _sharedPreferences.setString(PREFS_KEY_TOKEN, token);
  }

  Future<void> setIsUserLoggedIn(bool value) async {
    _sharedPreferences.setBool(PREFS_KEY_IS_USER_LOGGED_IN, value);
  }

  Future<bool> getIsUserLoggedIn() async {
   return  _sharedPreferences.getBool(PREFS_KEY_IS_USER_LOGGED_IN) ?? false;
  }

}