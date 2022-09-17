import 'package:formation_client/model/response/response_cours.dart';
import 'package:formation_client/model/response/response_identity.dart';
import 'package:formation_client/model/response/response_login.dart';
import 'package:formation_client/router/mypreferences.dart';
import 'package:http/http.dart' as http;

class ApiSource {
  static ApiSource _instance;
  var baseUrl = 'http://localhost:3000/public/';
  static ApiSource get getInstance => _instance ?? ApiSource();

  Future<ResponseIdentity> addIdentity(Map<String, dynamic> body) async {
    try {
      var url = "${baseUrl}inscrire/add";
      var response = await http.post(Uri.parse(url),
          headers: <String, String>{
            'Content-Type': 'application/x-www-form-urlencoded'
          },
          body: body);
      return ResponseIdentity.fromJson(response.body);
    } catch (_) {
      print("--------ERROR-------> ${_.toString()}");
    }
    return null;
  }

  Future<ResponseLogin> login(Map<String, dynamic> body) async {
    try {
      var url = "${baseUrl}users/login";
      final response = await http.post(Uri.parse(url),
          headers: <String, String>{
            'Content-Type': 'application/x-www-form-urlencoded',
          },
          body: body);
      if (response.statusCode == 200)
      return ResponseLogin.fromJson(response.body);
    } catch (_) {
      print(_.toString());
    }
    return null;
  }
    Future<ResponseCours> findCours() async {
    try {
      var url = "${baseUrl}cours/find";
      var response = await http.get(Uri.parse(url), headers: <String, String>{
        "Accept": "application/json",
        'Authorization': MyPreferences.TOKEN,
      });

      print(response.body);
      return ResponseCours.fromJson(response.body);
    } catch (_) {
      print("--------ERROR-------> ${_.toString()}");
    }
    return null;
  }
}
