import 'dart:math';
import 'package:bookilo_clean_arch/features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';
import '../../../../../core/widgets/button_custom.dart';

class BookActionsWidget extends StatelessWidget {
  final BookEntity bookEntity;
  const BookActionsWidget({super.key, required this.bookEntity});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomButton(
            text: "Free",
            oldPrice: Random().nextInt((500 - 100)),
            textColor: Colors.green,
            onPressed: () {},
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              bottomLeft: Radius.circular(16),
            ),
          ),
        ),
        Expanded(
          child: _buildFreePreviewCustomButton(context, isLoading: false),
        ),
      ],
    );
  }

  Widget _buildFreePreviewCustomButton(BuildContext context,
      {required bool isLoading}) {
    return CustomButton(
      text: "Preview",
      backgroundColor: const Color(0xffEF8262),
      textColor: Colors.white,
      isLoading: isLoading,
      onPressed: () {},
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(16),
        bottomRight: Radius.circular(16),
      ),
    );
  }
}
