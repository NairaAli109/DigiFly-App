// ignore_for_file: avoid_print

import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static late SharedPreferences sharedPreferences;

  Future<void> initSharedPref() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  bool initialPageRoute() {
    bool loginFistTime = sharedPreferences.getBool('loginFistTime') ?? false;
    print("Login First Time :::::: ${loginFistTime.toString()}");
    return loginFistTime;
  }

  Future<void> setLoginForFirstTime() async {
    await sharedPreferences.setBool("loginFistTime", true);
  }

  Future<bool> logOut() async {
    bool logoutResponse =
        await sharedPreferences.setBool("loginFistTime", false);
    print("User Logout :::::: ${logoutResponse.toString()}");
    return logoutResponse;
  }

  void saveLanguageCode(String languageCode) {
    sharedPreferences.setString('language_code', languageCode);
  }

  String? getLanguageCode() {
    return sharedPreferences.getString('language_code');
  }
}
