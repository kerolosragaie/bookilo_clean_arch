part of 'featured_books_cubit.dart';

abstract class FeaturedBooksState extends Equatable {
  const FeaturedBooksState();

  @override
  List<Object> get props => [];
}

class FeaturedBooksInitial extends FeaturedBooksState {}

class FeaturedBooksLoading extends FeaturedBooksState {}

class FeaturedBooksPaginationLoading extends FeaturedBooksState {}

class FeaturedBooksPaginationFailure extends FeaturedBooksState {
  final String errorMessage;

  const FeaturedBooksPaginationFailure({required this.errorMessage});
}

class FeaturedBooksFailure extends FeaturedBooksState {
  final String errorMessage;

  const FeaturedBooksFailure({required this.errorMessage});
}

class FeaturedBooksSuccess extends FeaturedBooksState {
  final List<BookEntity> booksList;

  const FeaturedBooksSuccess({required this.booksList});
}
