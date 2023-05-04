import 'package:bookilo_clean_arch/core/use_cases/use_case.dart';
import 'package:bookilo_clean_arch/features/home/domain/entities/book_entity.dart';
import 'package:bookilo_clean_arch/features/home/domain/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures/failures.dart';

class FetchNewestBooksUsecase extends Usecase<List<BookEntity>, NoParam> {
  final HomeRepository homeRepository;

  FetchNewestBooksUsecase({required this.homeRepository});
  @override
  Future<Either<Failure, List<BookEntity>>> call([NoParam? param]) async {
    return await homeRepository.fetchNewestBooks();
  }
}
