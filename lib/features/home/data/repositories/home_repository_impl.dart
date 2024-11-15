import 'package:bookilo_clean_arch/features/home/data/data_sources/home_local_data_source.dart';
import 'package:bookilo_clean_arch/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:bookilo_clean_arch/features/home/domain/entities/book_entity.dart';
import 'package:bookilo_clean_arch/features/home/domain/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../../../../core/errors/failures/failures.dart';

class HomeRepositoryImpl extends HomeRepository {
  final HomeRemoteDatasource homeRemoteDatasource;
  final HomeLocalDatasource homeLocalDatasource;

  HomeRepositoryImpl({
    required this.homeRemoteDatasource,
    required this.homeLocalDatasource,
  });
  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks(
      {int pageNumber = 0}) async {
    try {
      List<BookEntity> booksList;
      booksList =
          homeLocalDatasource.fetchFeaturedBooks(pageNumber: pageNumber);
      if (booksList.isNotEmpty) {
        return Right(booksList);
      }
      booksList =
          await homeRemoteDatasource.fetchFeaturedBooks(pageNumber: pageNumber);
      return Right(booksList);
    } catch (e) {
      return _catchingError(e);
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks() async {
    try {
      List<BookEntity> booksList;
      booksList = homeLocalDatasource.fetchNewestBooks();
      if (booksList.isNotEmpty) {
        return Right(booksList);
      }
      booksList = await homeRemoteDatasource.fetchNewestBooks();
      return Right(booksList);
    } catch (e) {
      return _catchingError(e);
    }
  }

  Left<Failure, List<BookEntity>> _catchingError(Object e) {
    if (e is HiveError) {
      return Left(CacheFailure.fromHiveError(e));
    } else if (e is DioException) {
      return Left(ServerFailure.fromDioError(e));
    } else if (e is InternetConnectionStatus) {
      return Left(NetworkFailure.fromInternetConnection(e));
    }
    return Left(UnkownFailure(message: e.toString()));
  }
}
