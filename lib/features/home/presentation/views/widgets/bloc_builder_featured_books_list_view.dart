import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/widget_custom_error.dart';
import '../../../../../core/widgets/widget_loading_indicator.dart';
import '../manager/featured_books_cubit/featured_books_cubit.dart';
import 'list_view_featured_books.dart';

class FeaturedBooksListviewBlocBuilder extends StatelessWidget {
  const FeaturedBooksListviewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksLoading) {
          return const LoadingIndicatorWidget();
        } else if (state is FeaturedBooksFailure) {
          return CustomErrorWidget(errorMessage: state.errorMessage);
        } else if (state is FeaturedBooksSuccess) {
          return FeaturedBooksListView(
            booksList: state.booksList,
          );
        }
        return const LoadingIndicatorWidget();
      },
    );
  }
}
