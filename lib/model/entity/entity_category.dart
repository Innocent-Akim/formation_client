import 'dart:convert';

class EntityCategory {
  String id;
  String refEntreprise;
  String designation;
  String description;
  EntityCategory({
    this.id,
    this.refEntreprise,
    this.designation,
    this.description,
  });

  EntityCategory copyWith({
    String id,
    String refEntreprise,
    String designation,
    String description,
  }) {
    return EntityCategory(
      id: id ?? this.id,
      refEntreprise: refEntreprise ?? this.refEntreprise,
      designation: designation ?? this.designation,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'refEntreprise': refEntreprise,
      'designation': designation,
      'description': description,
    };
  }

  factory EntityCategory.fromMap(Map<String, dynamic> map) {
    return EntityCategory(
      id: map['_id'],
      refEntreprise: map['refEntreprise'],
      designation: map['designation'],
      description: map['description'],
    );
  }

  String toJson() => json.encode(toMap());

  factory EntityCategory.fromJson(String source) =>
      EntityCategory.fromMap(json.decode(source));

  @override
  String toString() {
    return 'EntityCategory(_id: $id, refEntreprise: $refEntreprise, designation: $designation, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is EntityCategory &&
        other.id == id &&
        other.refEntreprise == refEntreprise &&
        other.designation == designation &&
        other.description == description;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        refEntreprise.hashCode ^
        designation.hashCode ^
        description.hashCode;
  }
}
