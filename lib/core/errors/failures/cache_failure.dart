part of 'failures.dart';

class CacheFailure extends Failure {
  CacheFailure({required super.message});
  factory CacheFailure.fromHiveError(HiveError hiveError) {
    return CacheFailure(message: hiveError.message);
  }
}
