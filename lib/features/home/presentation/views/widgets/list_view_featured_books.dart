import 'package:auto_animated/auto_animated.dart';
import 'package:bookilo_clean_arch/core/models/book_model/book_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/widget_custom_error.dart';
import '../../../../../core/widgets/widget_loading_indicator.dart';
import '../manager/featured_books_cubit/featured_books_cubit.dart';
import 'item_book_image.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
        builder: (context, state) {
          if (state is FeaturedBooksLoading) {
            return const LoadingIndicatorWidget();
          } else if (state is FeaturedBooksFailure) {
            return CustomErrorWidget(errorMessage: state.errorMessage);
          } else if (state is FeaturedBooksSuccess) {
            return LiveList.options(
              physics: const BouncingScrollPhysics(),
              options: const LiveOptions(
                showItemDuration: Duration(milliseconds: 200),
              ),
              itemBuilder: (context, index, animation) {
                return ScaleTransition(
                  scale: Tween<double>(
                    begin: 0,
                    end: 1,
                  ).animate(animation),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: BookImageItem(
                      showButton: true,
                      bookModel: state.booksList[index] as BookModel,
                    ),
                  ),
                );
              },
              scrollDirection: Axis.horizontal,
              itemCount: state.booksList.length,
            );
          }
          return const LoadingIndicatorWidget();
        },
      ),
    );
  }
}
