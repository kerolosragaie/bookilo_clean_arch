import 'package:bookilo_clean_arch/features/home/domain/entities/book_entity.dart';
import 'package:bookilo_clean_arch/features/home/domain/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures/failures.dart';
import '../../../../core/use_cases/use_case.dart';

class FetchFeaturedBooksUsecase extends Usecase<List<BookEntity>, NoParam> {
  final HomeRepository homeRepository;

  FetchFeaturedBooksUsecase({required this.homeRepository});

  @override
  Future<Either<Failure, List<BookEntity>>> call([NoParam? param]) async {
    //ex: check internet permission
    return await homeRepository.fetchFeaturedBooks();
  }
}
