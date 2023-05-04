import 'package:bookilo_clean_arch/features/home/domain/entities/book_entity.dart';
import 'package:bookilo_clean_arch/features/home/presentation/views/widgets/widget_book_details_actions.dart';
import 'package:bookilo_clean_arch/features/home/presentation/views/widgets/widget_book_rating.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/styles.dart';
import 'image_custom_book.dart';

class BookDetailsInfoWidget extends StatelessWidget {
  final BookEntity bookEntity;
  const BookDetailsInfoWidget({super.key, required this.bookEntity});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.22),
          child: CustomBookImage(
            imageUrl: bookEntity.image,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Text(
          bookEntity.title ?? "Batman",
          maxLines: 2,
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          style: Styles.textStyle30.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        Text(
          bookEntity.author ?? "Unknown",
          style: Styles.textStyle18.copyWith(
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.italic,
              color: const Color(0xff707070)),
        ),
        const SizedBox(
          height: 18,
        ),
        BookRatingWidget(
          mainAxisAlignment: MainAxisAlignment.center,
          rating: bookEntity.rating,
          averageRatingCount: bookEntity.ratingCount,
        ),
        const SizedBox(
          height: 16,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: BookActionsWidget(bookEntity: bookEntity),
        ),
      ],
    );
  }
}
