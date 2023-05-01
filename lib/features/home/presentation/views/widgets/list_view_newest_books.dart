import 'package:auto_animated/auto_animated.dart';
import 'package:bookilo_clean_arch/core/models/book_model/book_model.dart';
import 'package:flutter/material.dart';
import 'item_book.dart';

class NewestBooksListView extends StatelessWidget {
  const NewestBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      sliver: LiveSliverList(
        controller: ScrollController(),
        showItemDuration: const Duration(milliseconds: 400),
        itemCount: 10,
        itemBuilder: (context, index, animation) {
          return SlideTransition(
            position:
                Tween<Offset>(begin: const Offset(0, -0.1), end: Offset.zero)
                    .animate(animation),
            child: FadeTransition(
              opacity: Tween<double>(begin: 0, end: 1).animate(animation),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: BookItem(
                  bookModel: BookModel(),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
