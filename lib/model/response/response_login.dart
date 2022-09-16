import 'dart:convert';

import 'package:formation_client/model/entity/authentificated.dart';

class ResponseLogin {
  String msg;
  String token;
  Authentificated contents;
  ResponseLogin({
    this.msg,
    this.token,
    this.contents,
  });

  Map<String, dynamic> toMap() {
    return {
      'msg': msg,
      'token': token,
      'contents': contents.toMap(),
    };
  }

  factory ResponseLogin.fromMap(Map<String, dynamic> map) {
    return ResponseLogin(
      msg: map['msg'],
      token: map['token'],
      contents: Authentificated.fromMap(map['contents']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ResponseLogin.fromJson(String source) {
    return ResponseLogin.fromMap(json.decode(source));
  }

  @override
  String toString() =>
      'ResponseLogin(msg: $msg, token: $token, contents: $contents)';
}
