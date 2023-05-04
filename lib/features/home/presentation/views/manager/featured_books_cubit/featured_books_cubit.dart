import 'package:bookilo_clean_arch/features/home/domain/entities/book_entity.dart';
import 'package:bookilo_clean_arch/features/home/domain/use_cases/featured_books_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  final FeaturedBooksUsecase featuredBooksUsecase;
  FeaturedBooksCubit(this.featuredBooksUsecase) : super(FeaturedBooksInitial());

  Future<void> fetchFeaturedBooks() async {
    emit(FeaturedBooksLoading());
    var data = await featuredBooksUsecase.call();
    data.fold(
        (failure) => emit(
            FeaturedBooksFailure(errorMessage: failure.message.toString())),
        (booksList) => emit(FeaturedBooksSuccess(booksList: booksList)));
  }
}