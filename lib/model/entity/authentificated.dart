import 'dart:convert';

class Authentificated {
  String username;
  String password;
  String id;
  String refEntreprise;
  Authentificated({
    this.username,
    this.password,
    this.id,
    this.refEntreprise,
  });

  Authentificated copyWith({
    String username,
    String password,
    String id,
    String refEntreprise,
  }) {
    return Authentificated(
      username: username ?? this.username,
      password: password ?? this.password,
      id: id ?? this.id,
      refEntreprise: refEntreprise ?? this.refEntreprise,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'password': password,
      '_id': id,
      'refEntreprise': refEntreprise,
    };
  }

  factory Authentificated.fromMap(Map<String, dynamic> map) {
    return Authentificated(
      username: map['username'],
      password: map['password'],
      id: map['_id'],
      refEntreprise: map['refEntreprise'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Authentificated.fromJson(String source) =>
      Authentificated.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Authentificated(username: $username, password: $password, _id: $id, refEntreprise: $refEntreprise)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Authentificated &&
        other.username == username &&
        other.password == password &&
        other.id == id &&
        other.refEntreprise == refEntreprise;
  }

  @override
  int get hashCode {
    return username.hashCode ^
        password.hashCode ^
        id.hashCode ^
        refEntreprise.hashCode;
  }
}
