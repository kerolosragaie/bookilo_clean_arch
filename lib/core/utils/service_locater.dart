import 'package:bookilo_clean_arch/core/utils/api_service.dart';
import 'package:bookilo_clean_arch/features/home/data/data_sources/home_local_data_source.dart';
import 'package:bookilo_clean_arch/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:bookilo_clean_arch/features/home/data/repositories/home_repository_impl.dart';
import 'package:bookilo_clean_arch/features/home/domain/repositories/home_repository.dart';
import 'package:bookilo_clean_arch/features/home/domain/use_cases/featured_books_use_case.dart';
import 'package:bookilo_clean_arch/features/home/domain/use_cases/newest_books_use_case.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> setupServiceLocater() async {
  //! Features
  //Usecases
  sl.registerLazySingleton(() => FeaturedBooksUsecase(homeRepository: sl()));
  sl.registerLazySingleton(() => NewestBooksUsecase(homeRepository: sl()));

  //Repository
  sl.registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl(
        homeRemoteDatasource: sl(),
        homeLocalDatasource: sl(),
      ));
  //Datasoruces
  sl.registerLazySingleton<HomeLocalDatasource>(
      () => HomeLocalDatasourceImpl());
  sl.registerLazySingleton<HomeRemoteDatasource>(
      () => HomeRemoteDatasourceImpl(apiService: sl()));
  //! Core

  //! External
  sl.registerLazySingleton<ApiService>(() => ApiService(dio: Dio()));
}
