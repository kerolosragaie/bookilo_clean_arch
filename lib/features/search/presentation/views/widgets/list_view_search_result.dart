import 'package:bookilo_clean_arch/core/models/book_model/book_model.dart';
import 'package:flutter/material.dart';
import '../../../../../core/constants/assets_data.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../home/presentation/views/widgets/item_book.dart';

class SearchResultListView extends StatelessWidget {
  final List<BookModel> booksList;
  const SearchResultListView({super.key, required this.booksList});

  @override
  Widget build(BuildContext context) {
    if (booksList.isEmpty) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AssetsData.kAngryBook,
            width: MediaQuery.of(context).size.width * 0.2,
          ),
          const SizedBox(
            width: 15,
          ),
          Text(
            "Nothing found!",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Styles.textStyle20,
          ),
        ],
      );
    } else {
      return ListView.builder(
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        itemCount: booksList.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: BookItem(
              bookEntity: booksList[index],
            ),
          );
        },
      );
    }
  }
}
