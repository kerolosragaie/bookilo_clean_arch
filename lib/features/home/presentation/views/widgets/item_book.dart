import 'package:bookilo_clean_arch/core/utils/styles.dart';
import 'package:bookilo_clean_arch/features/home/domain/entities/book_entity.dart';
import 'package:bookilo_clean_arch/features/home/presentation/views/widgets/widget_book_rating.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/app_router.dart';
import 'image_custom_book.dart';

class BookItem extends StatelessWidget {
  final BookEntity bookEntity;
  const BookItem({super.key, required this.bookEntity});
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
      child: SizedBox(
        height: 125,
        child: Row(
          children: [
            CustomBookImage(
              imageUrl: bookEntity.image,
            ),
            const SizedBox(
              width: 30,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Text(
                      bookEntity.title ?? "Batman",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Styles.textStyle20,
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Text(
                      bookEntity.author ?? "Unknown",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Styles.textStyle14,
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Free",
                        style: Styles.textStyle20.copyWith(
                            color: Colors.green, fontWeight: FontWeight.bold),
                      ),
                      BookRatingWidget(
                        rating: bookEntity.rating,
                        averageRatingCount: bookEntity.ratingCount,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
