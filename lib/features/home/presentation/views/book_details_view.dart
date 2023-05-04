import 'package:bookilo_clean_arch/features/home/domain/entities/book_entity.dart';
import 'package:bookilo_clean_arch/features/home/presentation/views/widgets/body_book_details.dart';
import 'package:flutter/material.dart';

class BookDetailsView extends StatelessWidget {
  final BookEntity bookEntity;
  const BookDetailsView({super.key, required this.bookEntity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BookDetailsBody(
          bookEntity: bookEntity,
        ),
      ),
    );
  }
}
