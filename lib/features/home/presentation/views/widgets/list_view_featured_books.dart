import 'package:auto_animated/auto_animated.dart';
import 'package:bookilo_clean_arch/features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';
import 'item_book_image.dart';

class FeaturedBooksListView extends StatelessWidget {
  final List<BookEntity> booksList;
  const FeaturedBooksListView({
    Key? key,
    required this.booksList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: LiveList.options(
        physics: const BouncingScrollPhysics(),
        options: const LiveOptions(
          showItemDuration: Duration(milliseconds: 200),
        ),
        itemBuilder: (context, index, animation) {
          return ScaleTransition(
            scale: Tween<double>(
              begin: 0,
              end: 1,
            ).animate(animation),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: BookImageItem(
                showButton: true,
                bookEntity: booksList[index],
              ),
            ),
          );
        },
        scrollDirection: Axis.horizontal,
        itemCount: booksList.length,
      ),
    );
  }
}
