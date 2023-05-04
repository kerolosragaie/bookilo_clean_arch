import 'package:bookilo_clean_arch/features/home/domain/entities/book_entity.dart';
import 'package:bookilo_clean_arch/features/home/domain/use_cases/newest_books_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  final NewestBooksUsecase newestBooksUsecase;
  NewestBooksCubit(this.newestBooksUsecase) : super(NewestBooksInitial());
  Future<void> fetchNewestBooks() async {
    emit(NewestBooksLoading());
    var data = await newestBooksUsecase.call();
    data.fold(
        (failure) =>
            emit(NewestBooksFailure(errorMessage: failure.message.toString())),
        (booksList) => emit(NewestBooksSuccess(booksList: booksList)));
  }
}
