import 'package:bookilo_clean_arch/features/home/domain/entities/book_entity.dart';
import 'package:bookilo_clean_arch/features/home/presentation/views/widgets/app_bar_book_details.dart';
import 'package:bookilo_clean_arch/features/home/presentation/views/widgets/widget_book_details_info.dart';
import 'package:bookilo_clean_arch/features/home/presentation/views/widgets/widget_show_similar_books.dart';
import 'package:flutter/material.dart';

class BookDetailsBody extends StatelessWidget {
  final BookEntity bookEntity;
  const BookDetailsBody({super.key, required this.bookEntity});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: BookDetailsAppBar(),
                ),
                BookDetailsInfoWidget(
                  bookEntity: bookEntity,
                ),
                const Expanded(
                  child: SizedBox(
                    height: 16,
                  ),
                ),
                const ShowSimilarBooksWidget(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
