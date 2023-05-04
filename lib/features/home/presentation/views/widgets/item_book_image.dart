import 'package:bookilo_clean_arch/features/home/domain/entities/book_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/app_router.dart';
import 'image_custom_book.dart';

class BookImageItem extends StatelessWidget {
  final bool? showButton;
  final BookEntity bookEntity;
  const BookImageItem({
    super.key,
    this.showButton,
    required this.bookEntity,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (GoRouterState.of(context).location == kBookDetailsView) {
          GoRouter.of(context)
              .pushReplacement(kBookDetailsView, extra: bookEntity);
        } else {
          GoRouter.of(context).push(kBookDetailsView, extra: bookEntity);
        }
      },
      child: CustomBookImage(
        imageUrl: null,
        showButton: showButton ?? false,
      ),
    );
  }
}
