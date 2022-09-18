import 'dart:convert';

import 'entity_category.dart';

class EntityCours {
  String id;
  String title;
  String resume;
  String dateFin;
  String dateCreation;
  String filename;
  String originalname;
  String idCategory;
  String createdAt;
  String logo;
  String updatedAt;
  final categoryEntity;
  
  EntityCours({
    this.id,
    this.title,
    this.resume,
    this.filename,
    this.originalname,
    this.dateCreation,
    this.dateFin,
    this.createdAt,
    this.logo,
    this.updatedAt,
    this.categoryEntity,
  });

  EntityCours copyWith({
    String id,
    String title,
    String resume,
    String dateFin,
    String dateCreation,
    String filename,
    String originalname,
    String idCategory,
    String createdAt,
    String logo,
    String updatedAt,
    EntityCategory categoryEntity,
  }) {
    return EntityCours(
      id: id ?? this.id,
      title: title ?? this.title,
      resume: resume ?? this.resume,
      filename: filename ?? this.filename,
      originalname: originalname ?? this.originalname,
      dateCreation: dateCreation ?? this.dateCreation,
      dateFin: dateFin ?? this.dateFin,
      logo: logo ?? logo,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      categoryEntity: categoryEntity ?? this.categoryEntity,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'title': title,
      'resume': resume,
      'filename': filename,
      'originalname': originalname,
      'dateCreation': dateCreation,
      'dateFin': dateCreation,
      'logo': logo,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'idCategory': categoryEntity,
    };
  }

  factory EntityCours.fromMap(Map<String, dynamic> map) {
    return EntityCours(
      id: map['_id'],
      title: map['title'],
      resume: map['resume'],
      originalname: map['originalname'],
      filename: map['filename'],
      dateCreation: map['dateCreation'],
      dateFin: map['dateFin'],
      logo: map['logo'],
      createdAt: map['createdAt'],
      updatedAt: map['updatedAt'],
      categoryEntity: map['idCategory'],
    );
  }

  String toJson() => json.encode(toMap());

  factory EntityCours.fromJson(String source) =>
      EntityCours.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Cours(id: $id, title: $title, resume: $resume, filename: $filename, dateCreation: $dateCreation, createdAt: $createdAt, updatedAt: $updatedAt, idCategory: $categoryEntity)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is EntityCours &&
        other.id == id &&
        other.title == title &&
        other.resume == resume &&
        other.filename == filename &&
        other.originalname == originalname &&
        other.dateCreation == dateCreation &&
        other.dateFin == dateFin &&
        other.logo == logo &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.categoryEntity == categoryEntity;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        resume.hashCode ^
        filename.hashCode ^
        originalname.hashCode ^
        dateCreation.hashCode ^
        dateFin.hashCode ^
        logo.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode ^
        categoryEntity.hashCode;
  }
}
