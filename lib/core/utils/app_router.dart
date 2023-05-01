import 'package:bookilo_clean_arch/core/models/book_model/book_model.dart';
import 'package:bookilo_clean_arch/features/home/presentation/views/book_details_view.dart';
import 'package:bookilo_clean_arch/features/search/presentation/views/search_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/home/presentation/views/home_view.dart';
import '../../features/splash/presentation/views/splash_view.dart';

//?Routes names
const kSplashView = '/';
const kHomeView = '/homeView';
const kBookDetailsView = '/bookDetailsView';
const kSearchView = '/searchView';

abstract class AppRouter {
  static final router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: kSplashView,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kHomeView,
        pageBuilder: (context, state) => CustomTransitionPage<void>(
          transitionDuration: const Duration(seconds: 1),
          key: state.pageKey,
          child: const HomeView(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              ScaleTransition(scale: animation, child: child),
        ),
      ),
      GoRoute(
        path: kBookDetailsView,
        builder: (context, state) {
          return const BookDetailsView(
            bookModel: BookModel(),
          );
        },
      ),
      GoRoute(
        path: kSearchView,
        pageBuilder: (context, state) => CustomTransitionPage<void>(
          transitionDuration: const Duration(milliseconds: 200),
          key: state.pageKey,
          child: const SearchView(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              FadeTransition(opacity: animation, child: child),
        ),
      ),
    ],
  );
}
