import 'dart:convert';
import 'package:formation_client/model/entity/entity_category.dart';

class ResponseCategory {
  EntityCategory contents;
  String msg;
  String token;
  ResponseCategory({this.contents, this.msg, this.token});

  ResponseCategory copyWith({
    EntityCategory contents,
    String msg,
  }) {
    return ResponseCategory(
      contents: contents ?? this.contents,
      msg: msg ?? this.msg,
      token: token ?? this.token,
    );
  }

  Map<String, dynamic> toMap() {
    return {'contents': contents.toMap(), 'msg': msg, 'token': token};
  }

  factory ResponseCategory.fromMap(Map<String, dynamic> map) {
    return ResponseCategory(
        contents: EntityCategory.fromMap(map['contents']),
        msg: map['msg'],
        token: map['token']);
  }

  String toJson() => json.encode(toMap());

  factory ResponseCategory.fromJson(String source) =>
      ResponseCategory.fromMap(json.decode(source));

  @override
  String toString() =>
      'ResponseCategory(contents: $contents, msg: $msg, token: $token)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ResponseCategory &&
        other.contents == contents &&
        other.msg == msg;
  }

  @override
  int get hashCode => contents.hashCode ^ msg.hashCode;
}
