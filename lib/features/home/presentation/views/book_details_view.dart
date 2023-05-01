import 'package:bookilo_clean_arch/core/models/book_model/book_model.dart';
import 'package:bookilo_clean_arch/features/home/presentation/views/widgets/body_book_details.dart';
import 'package:flutter/material.dart';

class BookDetailsView extends StatelessWidget {
  final BookModel bookModel;
  const BookDetailsView({super.key, required this.bookModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BookDetailsBody(
          bookModel: bookModel,
        ),
      ),
    );
  }
}
