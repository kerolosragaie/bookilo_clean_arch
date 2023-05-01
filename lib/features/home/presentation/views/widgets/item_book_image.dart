import 'package:bookilo_clean_arch/core/models/book_model/book_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/app_router.dart';
import 'image_custom_book.dart';

class BookImageItem extends StatelessWidget {
  final bool? showButton;
  final BookModel bookModel;
  const BookImageItem({
    super.key,
    this.showButton,
    required this.bookModel,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (GoRouterState.of(context).location == kBookDetailsView) {
          GoRouter.of(context)
              .pushReplacement(kBookDetailsView, extra: bookModel);
        } else {
          GoRouter.of(context).push(kBookDetailsView, extra: bookModel);
        }
      },
      child: CustomBookImage(
        imageUrl: null,
        showButton: showButton ?? false,
      ),
    );
  }
}
