import 'package:flutter/material.dart';
import '../../../../../core/utils/styles.dart';
import 'list_view_similar_books.dart';

class ShowSimilarBooksWidget extends StatelessWidget {
  const ShowSimilarBooksWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "You may also like",
          style: Styles.textStyle14.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        const SimilarBooksListView(),
      ],
    );
  }
}
