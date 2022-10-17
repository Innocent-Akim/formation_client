import 'package:shared_preferences/shared_preferences.dart';

class MyPreferences {
  static MyPreferences _instance;
  static String USER_CONNECTER;
  static String ID_USER_CONNECTER;
  static String REF_ENTREPRISE;
  static var TOKEN;
  static List dataUser = <String>[];
  static MyPreferences get getInstance {
    return _instance == null ? _instance = MyPreferences() : _instance;
  }

  Future<bool> setToken({token}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("token", token);
  }

  Future<void> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    TOKEN = "Bearer ${prefs.getString("token")}";
  }
    Future<bool> setId({token}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("token", token);
  }

  Future<void> getId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    TOKEN = "Bearer ${prefs.getString("token")}";
  }

  Future<bool> setDataUser({data}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool status = await prefs.setStringList("element", data);
    if (status) {
      getDataUser();
    }
    print(dataUser);
    return status;
  }

  Future<void> getDataUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    dataUser = prefs.getStringList("element");
  }
}
