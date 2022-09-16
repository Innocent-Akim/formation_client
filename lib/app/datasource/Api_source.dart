import 'package:formation_client/model/response/response_identity.dart';
import 'package:http/http.dart' as http;

class ApiSource {
  static ApiSource _instance;
  var baseUrl = 'http://localhost:3000/public/';
  static ApiSource get getInstance => _instance ?? ApiSource();

  Future<ResponseIdentity> addIdentity(Map<String, dynamic> body) async {
    try {
      var url = "${baseUrl}inscrire/add";
      print(url);
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
}
