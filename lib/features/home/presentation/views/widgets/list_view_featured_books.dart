import 'package:auto_animated/auto_animated.dart';
import 'package:bookilo_clean_arch/features/home/domain/entities/book_entity.dart';
import 'package:bookilo_clean_arch/features/home/presentation/views/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'item_book_image.dart';

class FeaturedBooksListView extends StatefulWidget {
  final List<BookEntity> booksList;

  const FeaturedBooksListView({
    super.key,
    required this.booksList,
  });

  @override
  State<FeaturedBooksListView> createState() => _FeaturedBooksListViewState();
}

class _FeaturedBooksListViewState extends State<FeaturedBooksListView> {
  late final ScrollController _scrollController;
  int nextPage = 1;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_scrollListener)
      ..dispose();
    super.dispose();
  }

  void _scrollListener() {
    double currentPosition = _scrollController.position.pixels;
    double maxScrollLength = _scrollController.position.maxScrollExtent;
    if (currentPosition >= 0.7 * maxScrollLength) {
      if (!isLoading) {
        isLoading = true;
        BlocProvider.of<FeaturedBooksCubit>(context)
            .fetchFeaturedBooks(pageNumber: nextPage++)
            .whenComplete(() => isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: LiveList.options(
        controller: _scrollController,
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
                bookEntity: widget.booksList[index],
              ),
            ),
          );
        },
        scrollDirection: Axis.horizontal,
        itemCount: widget.booksList.length,
      ),
    );
  }
}
