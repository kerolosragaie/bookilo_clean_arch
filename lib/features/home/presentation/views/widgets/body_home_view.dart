import 'package:flutter/material.dart';
import '../../../../../core/utils/styles.dart';
import 'app_bar_home.dart';
import 'list_view_newest_books.dart';
import 'list_view_featured_books.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: HomeAppBar(),
              ),
              const FeaturedBooksListView(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      "Newest Books",
                      style: Styles.textStyle18,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const NewestBooksListView(),
      ],
    );
  }
}
