import 'package:flutter/material.dart';
import 'package:pmdm03/models/models.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Obtener los detalles del libro desde los argumentos
    final Doc book = ModalRoute.of(context)?.settings.arguments as Doc? ??
        Doc(
          authorKey: [],
          authorName: [],
          coverEditionKey: '',
          coverI: 0,
          editionCount: 0,
          firstPublishYear: 0,
          hasFulltext: false,
          ia: [],
          iaCollectionS: '',
          key: '',
          language: [],
          publicScanB: false,
          title: '',
          lendingEditionS: '',
          lendingIdentifierS: '',
          subtitle: '',
          description: '',
        );

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(book: book),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                _PosterAndTitle(book: book),
                _Overview(book: book),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  final Doc book;

  const _CustomAppBar({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: EdgeInsets.all(0),
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          color: Colors.black12,
          padding: const EdgeInsets.only(bottom: 10),
          child: Text(
            book.title,
            style: TextStyle(fontSize: 16),
            maxLines: 2, // Permite que el título se muestre en 2 líneas
            overflow: TextOverflow
                .ellipsis, // Añade puntos suspensivos si excede las dos líneas
          ),
        ),
        background: FadeInImage(
          placeholder: AssetImage('assets/loading.gif'),
          image: NetworkImage(
              'https://covers.openlibrary.org/b/id/${book.coverI}-L.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  final Doc book;

  const _PosterAndTitle({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: AssetImage('assets/loading.gif'),
              image: NetworkImage(
                  'https://covers.openlibrary.org/b/id/${book.coverI}-L.jpg'),
              height: 150,
            ),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                book.title,
                style: textTheme.headlineSmall,
                overflow: TextOverflow.ellipsis,
              ),
              // Asegúrate de que subtitle no sea nulo antes de acceder
              Text(
                book.subtitle ?? '',
                style: textTheme.titleMedium,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              Row(
                children: [
                  const Icon(Icons.star_outline, size: 15, color: Colors.grey),
                  const SizedBox(width: 5),
                  Text(
                    'Primera publicació: ${book.firstPublishYear}',
                    style: textTheme.bodySmall,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Overview extends StatelessWidget {
  final Doc book;

  const _Overview({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Text(
        book.description.isNotEmpty
            ? book.description
            : 'El llibre de ${book.title} és una gran obra que explora temes fascinants...',
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}
