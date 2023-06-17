import 'package:bookilo_clean_arch/features/home/domain/entities/book_entity.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures/failures.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks(
      {int pageNumber = 0});
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks();
}
