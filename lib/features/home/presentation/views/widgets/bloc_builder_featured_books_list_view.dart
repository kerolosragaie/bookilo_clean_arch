import 'package:bookilo_clean_arch/features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/widget_custom_error.dart';
import '../../../../../core/widgets/widget_loading_indicator.dart';
import '../manager/featured_books_cubit/featured_books_cubit.dart';
import 'list_view_featured_books.dart';

class FeaturedBooksListviewBlocBuilder extends StatefulWidget {
  const FeaturedBooksListviewBlocBuilder({super.key});

  @override
  State<FeaturedBooksListviewBlocBuilder> createState() =>
      _FeaturedBooksListviewBlocBuilderState();
}

class _FeaturedBooksListviewBlocBuilderState
    extends State<FeaturedBooksListviewBlocBuilder> {
  List<BookEntity> booksList = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeaturedBooksCubit, FeaturedBooksState>(
      listener: (context, state) {
        if (state is FeaturedBooksSuccess) {
          booksList.addAll(state.booksList);
        }
      },
      builder: (context, state) {
        if (state is FeaturedBooksLoading) {
          return const LoadingIndicatorWidget();
        } else if (state is FeaturedBooksFailure) {
          return CustomErrorWidget(errorMessage: state.errorMessage);
        } else if (state is FeaturedBooksSuccess ||
            state is FeaturedBooksPaginationLoading) {
          return FeaturedBooksListView(
            booksList: booksList,
          );
        }
        return const LoadingIndicatorWidget();
      },
    );
  }
}
