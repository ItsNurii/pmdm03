import 'package:flutter/material.dart';
import 'package:pmdm03/providers/books_provider.dart';
import 'package:pmdm03/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final booksProvider = Provider.of<BooksProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Llibres'),
        elevation: 0,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search_outlined))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              // Carrousel de libros
              BookSwiper(books: booksProvider.onDisplayBooks),

              // Título para la sección de libros populares
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  'Llibres més populars',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),

              // Cards de libros
              BookCards(
                books: booksProvider.onDisplayBooks,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
