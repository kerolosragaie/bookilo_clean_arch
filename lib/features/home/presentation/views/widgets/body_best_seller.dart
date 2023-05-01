import 'package:bookilo_clean_arch/core/utils/styles.dart';
import 'package:flutter/material.dart';

import 'list_view_newest_books.dart';

class BestSellerBody extends StatelessWidget {
  const BestSellerBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 16,
        ),
        Text(
          "Best Seller",
          style: Styles.textStyle18,
        ),
        const SizedBox(
          height: 20,
        ),
        const NewestBooksListView(),
      ],
    );
  }
}
