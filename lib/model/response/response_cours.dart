import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:formation_client/model/entity/entity_cours.dart';

class ResponseCours {
  String msg;
  String token;
  List<EntityCours> contents;
  ResponseCours({
    this.msg,
    this.token,
    this.contents,
  });

  ResponseCours copyWith({
    String msg,
    String token,
    List<EntityCours> contents,
  }) {
    return ResponseCours(
      msg: msg ?? this.msg,
      token: token ?? this.token,
      contents: contents ?? this.contents,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'msg': msg,
      'token': token,
      'contents': contents?.map((x) => x.toMap())?.toList(),
    };
  }

  factory ResponseCours.fromMap(Map<String, dynamic> map) {
    return ResponseCours(
      msg: map['msg'],
      token: map['token'],
      contents: List<EntityCours>.from(
          map['contents']?.map((x) => EntityCours.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory ResponseCours.fromJson(String source) =>
      ResponseCours.fromMap(json.decode(source));

  @override
  String toString() =>
      'ResponseCours(msg: $msg, token: $token, contents: $contents)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ResponseCours &&
        other.msg == msg &&
        other.token == token &&
        listEquals(other.contents, contents);
  }

  @override
  int get hashCode => msg.hashCode ^ token.hashCode ^ contents.hashCode;
}
