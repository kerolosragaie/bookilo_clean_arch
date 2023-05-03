import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
part 'server_failure.dart';
part 'cache_failure.dart';
part 'network_failure.dart';

abstract class Failure {
  final String? message;
  const Failure({this.message});
}

class UnkownFailure extends Failure {
  UnkownFailure({required super.message});
}
