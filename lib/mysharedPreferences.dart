import 'package:shared_preferences/shared_preferences.dart';

class MyPreferences {
 static MyPreferences getInstance() {
    return MyPreferences();
  }

  Future<void> setToken(String token) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.setString("token", token);
  }

    Future<void> getToken() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.getString("token");
  }
}
