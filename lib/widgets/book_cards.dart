import 'package:flutter/material.dart';
import 'package:pmdm03/models/models.dart';

class BookCards extends StatelessWidget {
  final List<Doc> books;

  const BookCards({Key? key, required this.books}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      width: double.infinity,
      height: 180,
      child: ListView.builder(
        itemCount: books.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) =>
            _BookCard(book: books[index]),
      ),
    );
  }
}

class _BookCard extends StatelessWidget {
  final Doc book;

  const _BookCard({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Construir la URL de la portada del libro
    final coverUrl = 'https://covers.openlibrary.org/b/id/${book.coverI}-L.jpg';

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: 110,
      height: 100,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'),
              image: NetworkImage(coverUrl),
              height: 140,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            book.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
