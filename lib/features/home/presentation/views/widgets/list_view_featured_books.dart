import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import '../../../../../core/models/book_model/book_model.dart';
import 'item_book_image.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({super.key});

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
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: BookImageItem(
                showButton: true,
                bookModel: BookModel(),
              ),
            ),
          );
        },
        scrollDirection: Axis.horizontal,
        itemCount: 10,
      ),
    );
  }
}
