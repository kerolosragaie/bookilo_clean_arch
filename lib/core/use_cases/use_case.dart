import 'package:dartz/dartz.dart';
import '../errors/failures/failures.dart';

abstract class Usecase<T, Param> {
  Future<Either<Failure, T>> call([Param param]);
}

class NoParam {}
