import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:pmdm03/models/models.dart'; // Importa el modelo de libros

class BookSlider extends StatelessWidget {
  final List<Doc> books;

  const BookSlider({Key? key, required this.books}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    if (this.books.isEmpty) {
      return Container(
        width: double.infinity,
        height: size.height * 0.5,
        child: Center(
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
          final coverUrl =
              'https://covers.openlibrary.org/b/id/${book.coverI}-L.jpg'; // Formato de la URL de la portada

          return GestureDetector(
            onTap: () => Navigator.pushNamed(
              context,
              'details',
              arguments: book
                  .title, // Pasar el título del libro a la página de detalles
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: AssetImage('assets/no-image.jpg'),
                image: NetworkImage(coverUrl),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
