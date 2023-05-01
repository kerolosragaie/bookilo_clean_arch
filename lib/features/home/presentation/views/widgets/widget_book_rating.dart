import 'package:bookilo_clean_arch/core/models/book_model/volume_info.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../../core/utils/styles.dart';

class BookRatingWidget extends StatelessWidget {
  final MainAxisAlignment mainAxisAlignment;
  final VolumeInfo volumeInfo;
  const BookRatingWidget(
      {super.key,
      this.mainAxisAlignment = MainAxisAlignment.start,
      required this.volumeInfo});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        const Icon(
          FontAwesomeIcons.solidStar,
          size: 16,
          color: Color(0xffFFDD4F),
        ),
        const SizedBox(
          width: 6.3,
        ),
        Text(
          volumeInfo.averageRating == null
              ? "0"
              : volumeInfo.averageRating.toString(),
          style: Styles.textStyle16.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Opacity(
          opacity: .5,
          child: Text(
            volumeInfo.ratingsCount == null
                ? "(0)"
                : "(${volumeInfo.ratingsCount.toString()})",
            style: Styles.textStyle14,
          ),
        ),
      ],
    );
  }
}
