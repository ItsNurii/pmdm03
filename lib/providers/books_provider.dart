import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:pmdm03/models/models.dart';

class BooksProvider extends ChangeNotifier {
  String _baseUrl = 'openlibrary.org';
  List<Doc> onDisplayBooks = [];

  BooksProvider() {
    print('BooksProvider inicialitzat');
    this.getOnDisplayBooks();
  }

  getOnDisplayBooks() async {
    print('getOnDisplayBooks');
    var url = Uri.https(_baseUrl, 'search.json', {'title': 'harry potter'});

    final result = await http.get(url);
    if (result.statusCode == 200) {
      final booksResponse = BooksResponse.fromRawJson(result.body);
      onDisplayBooks = booksResponse.docs;
      notifyListeners();
    } else {
      throw Exception('Error al cargar los libros');
    }
  }
}
