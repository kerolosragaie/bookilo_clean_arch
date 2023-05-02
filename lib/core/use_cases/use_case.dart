import 'package:bookilo_clean_arch/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class Usecase<T, Param> {
  Future<Either<Failure, T>> call([Param param]);
}

class NoParam {}
