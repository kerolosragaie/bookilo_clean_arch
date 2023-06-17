import 'package:bookilo_clean_arch/features/home/domain/entities/book_entity.dart';
import 'package:bookilo_clean_arch/features/home/domain/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures/failures.dart';
import '../../../../core/use_cases/use_case.dart';

class FeaturedBooksUsecase extends Usecase<List<BookEntity>, int> {
  final HomeRepository homeRepository;

  FeaturedBooksUsecase({required this.homeRepository});

  @override
  Future<Either<Failure, List<BookEntity>>> call([int pageNumber = 0]) async {
    //ex: check internet permission
    return await homeRepository.fetchFeaturedBooks(
      pageNumber: pageNumber,
    );
  }
}
