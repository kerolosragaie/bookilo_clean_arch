import 'package:bookilo_clean_arch/features/home/domain/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/book_entity.dart';

class FetchFeaturedBooksUsecase {
  final HomeRepository homeRepository;

  FetchFeaturedBooksUsecase({required this.homeRepository});
  Future<Either<Failure, List<BookEntity>>> call() {
    //ex: check internet permission
    return homeRepository.fetchFeaturedBooks();
  }
}
