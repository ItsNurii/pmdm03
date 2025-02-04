import 'dart:convert';

class Doc {
  List<String> authorKey;
  List<String> authorName;
  String coverEditionKey;
  int coverI;
  int editionCount;
  int firstPublishYear;
  bool hasFulltext;
  List<String> ia;
  String iaCollectionS;
  String key;
  List<String> language;
  bool publicScanB;
  String title;
  String? lendingEditionS;
  String? lendingIdentifierS;
  String? subtitle;
  String description;

  Doc({
    required this.authorKey,
    required this.authorName,
    required this.coverEditionKey,
    required this.coverI,
    required this.editionCount,
    required this.firstPublishYear,
    required this.hasFulltext,
    required this.ia,
    required this.iaCollectionS,
    required this.key,
    required this.language,
    required this.publicScanB,
    required this.title,
    this.lendingEditionS,
    this.lendingIdentifierS,
    this.subtitle,
    required this.description,
  });

  factory Doc.fromRawJson(String str) => Doc.fromJson(json.decode(str));

  factory Doc.fromJson(Map<String, dynamic> json) => Doc(
        authorKey: json["author_key"] != null // Valor por defecto si es nulo
            ? List<String>.from(json["author_key"].map((x) => x))
            : [],
        authorName: json["author_name"] != null
            ? List<String>.from(json["author_name"].map((x) => x))
            : [],
        coverEditionKey: json["cover_edition_key"] ?? '',
        coverI: json["cover_i"] ?? 0,
        editionCount: json["edition_count"] ?? 0,
        firstPublishYear: json["first_publish_year"] ?? 0,
        hasFulltext: json["has_fulltext"] ?? false,
        ia: json["ia"] != null
            ? List<String>.from(json["ia"].map((x) => x))
            : [],
        iaCollectionS: json["ia_collection_s"] ?? '',
        key: json["key"] ?? '',
        language: json["language"] != null
            ? List<String>.from(json["language"].map((x) => x))
            : [],
        publicScanB: json["public_scan_b"] ?? false,
        title: json["title"] ?? 'Sin título',
        lendingEditionS: json["lending_edition_s"],
        lendingIdentifierS: json["lending_identifier_s"], // Puede ser nulo
        subtitle: json["subtitle"], // Puede ser nulo
        description: json["description"] ?? "",
      );
}
