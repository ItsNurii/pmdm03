import 'dart:convert';
import 'package:pmdm03/models/doc.dart';

class BooksResponse {
  int numFound;
  int start;
  bool numFoundExact;
  int booksResponseNumFound;
  String documentationUrl;
  String q;
  dynamic offset;
  List<Doc> docs;

  BooksResponse({
    required this.numFound,
    required this.start,
    required this.numFoundExact,
    required this.booksResponseNumFound,
    required this.documentationUrl,
    required this.q,
    required this.offset,
    required this.docs,
  });

  factory BooksResponse.fromRawJson(String str) =>
      BooksResponse.fromJson(json.decode(str));

  //String toRawJson() => json.encode(toJson());

  factory BooksResponse.fromJson(Map<String, dynamic> json) => BooksResponse(
        numFound: json["numFound"],
        start: json["start"],
        numFoundExact: json["numFoundExact"],
        booksResponseNumFound: json["num_found"],
        documentationUrl: json["documentation_url"],
        q: json["q"],
        offset: json["offset"],
        docs: List<Doc>.from(json["docs"].map((x) => Doc.fromJson(x))),
      );

  /*Map<String, dynamic> toJson() => {
        "numFound": numFound,
        "start": start,
        "numFoundExact": numFoundExact,
        "num_found": booksResponseNumFound,
        "documentation_url": documentationUrl,
        "q": q,
        "offset": offset,
        "docs": List<dynamic>.from(docs.map((x) => x.toJson())),
      };*/
}
