import 'package:bookilo_clean_arch/features/home/data/data_sources/home_local_data_source.dart';
import 'package:bookilo_clean_arch/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:bookilo_clean_arch/features/home/domain/entities/book_entity.dart';
import 'package:bookilo_clean_arch/core/errors/failures.dart';
import 'package:bookilo_clean_arch/features/home/domain/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';

class HomeRepositoryImpl extends HomeRepository {
  final HomeRemoteDatasource homeRemoteDatasource;
  final HomeLocalDatasource homeLocalDatasource;

  HomeRepositoryImpl({
    required this.homeRemoteDatasource,
    required this.homeLocalDatasource,
  });
  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks() async {
    try {
      var booksListLocal = homeLocalDatasource.fetchFeaturedBooks();
      if (booksListLocal.isNotEmpty) {
        return Right(booksListLocal);
      }
      var booksList = await homeRemoteDatasource.fetchFeaturedBooks();
      return Right(booksList);
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.runtimeType.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks() async {
    try {
      var booksListLocal = homeLocalDatasource.fetchNewestBooks();
      if (booksListLocal.isNotEmpty) {
        return Right(booksListLocal);
      }
      var booksList = await homeRemoteDatasource.fetchNewestBooks();
      return Right(booksList);
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.runtimeType.toString()));
    }
  }
}
