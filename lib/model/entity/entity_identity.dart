import 'dart:convert';

class EntityIdentity {
  String nom;
  String postnom;
  String prenom;
  String genre;
  String dateNaissance;
  String contact;
  String email;
  String status;
  String refEntreprise;
  String password;

  EntityIdentity({
    this.nom,
    this.postnom,
    this.prenom,
    this.genre,
    this.dateNaissance,
    this.contact,
    this.email,
    this.status,
    this.refEntreprise,
    this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'nom': nom,
      'postnom': postnom,
      'prenom': prenom,
      'genre': genre,
      'dateNaissance': dateNaissance,
      'telephone': contact,
      'email': email,
      'password': password,
      'status': status,
      'refEntreprise': refEntreprise,
    };
  }

  factory EntityIdentity.fromMap(Map<String, dynamic> map) {
    return EntityIdentity(
      nom: map['nom'],
      postnom: map['postnom'],
      prenom: map['prenom'],
      genre: map['genre'],
      dateNaissance: map['dateNaissance'],
      email: map['email'],
      contact: map['telephone'],
      password: map['password'],
      status: map['status'],
      refEntreprise: map['refEntreprise'],
    );
  }

  String toJson() => json.encode(toMap());

  factory EntityIdentity.fromJson(String source) =>
      EntityIdentity.fromMap(json.decode(source));

  @override
  String toString() {
    return 'EntityIdentity(nom: $nom, postnom: $postnom, prenom: $prenom, genre: $genre, dateNaissance: $dateNaissance, email: $email, contact: $contact, refEntreprise: $refEntreprise, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is EntityIdentity &&
        other.nom == nom &&
        other.postnom == postnom &&
        other.prenom == prenom &&
        other.genre == genre &&
        other.dateNaissance == dateNaissance &&
        other.email == email &&
        other.contact == contact &&
        other.status == status &&
        other.refEntreprise == refEntreprise &&
        other.password == password;
  }

  @override
  int get hashCode {
    return nom.hashCode ^
        postnom.hashCode ^
        prenom.hashCode ^
        genre.hashCode ^
        dateNaissance.hashCode ^
        contact.hashCode ^
        email.hashCode ^
        password.hashCode ^
        status.hashCode ^
        refEntreprise.hashCode;
  }

  EntityIdentity copyWith({
    String nom,
    String postnom,
    String prenom,
    String genre,
    String dateNaissance,
    String lieuNaissance,
    String nomPere,
    String nomMere,
    String origine,
    String status,
    String refEntreprise,
  }) {
    return EntityIdentity(
      nom: nom ?? this.nom,
      postnom: postnom ?? this.postnom,
      prenom: prenom ?? this.prenom,
      genre: genre ?? this.genre,
      dateNaissance: dateNaissance ?? this.dateNaissance,
      contact: contact ?? this.contact,
      email: email ?? this.email,
      status: status ?? this.status,
      refEntreprise: refEntreprise ?? this.refEntreprise,
    );
  }
}
