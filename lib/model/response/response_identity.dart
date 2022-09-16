import 'dart:convert';

import 'package:formation_client/model/entity/entity_identity.dart';

class ResponseIdentity {
  String token;
  String msg;
  EntityIdentity contents;
  ResponseIdentity({
    this.token,
    this.msg,
    this.contents,
  });

  ResponseIdentity copyWith({
    String token,
    String msg,
    EntityIdentity contents,
  }) {
    return ResponseIdentity(
      token: token ?? this.token,
      msg: msg ?? this.msg,
      contents: contents ?? this.contents,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'token': token,
      'msg': msg,
      'contents': contents.toMap(),
    };
  }

  factory ResponseIdentity.fromMap(Map<String, dynamic> map) {
    return ResponseIdentity(
      token: map['token'],
      msg: map['msg'],
      contents: EntityIdentity.fromMap(map['contents']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ResponseIdentity.fromJson(String source) =>
      ResponseIdentity.fromMap(json.decode(source));

  @override
  String toString() =>
      'ResponseIdentity(token: $token, msg: $msg, contents: $contents)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ResponseIdentity &&
        other.token == token &&
        other.msg == msg &&
        other.contents == contents;
  }

  @override
  int get hashCode => token.hashCode ^ msg.hashCode ^ contents.hashCode;
}
