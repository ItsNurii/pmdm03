import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:pmdm03/models/models.dart';

class BookSwiper extends StatelessWidget {
  final List<Doc> books; // Asegúrate de que esta sea la lista de libros

  const BookSwiper({Key? key, required this.books}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    if (this.books.isEmpty) {
      return Container(
        width: double.infinity,
        height: size.height * 0.5,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Container(
      width: double.infinity,
      height: size.height * 0.5,
      child: Swiper(
        itemCount: books.length,
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.6,
        itemHeight: size.height * 0.4,
        itemBuilder: (BuildContext context, int index) {
          final book = books[index];

          return GestureDetector(
            onTap: () => Navigator.pushNamed(
              context,
              'details',
              arguments: book,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: const AssetImage('assets/no-image.jpg'),
                image: NetworkImage(
                  'https://covers.openlibrary.org/b/id/${book.coverI}-L.jpg',
                ), // Asegúrate de usar la URL correcta para la portada del libro
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
