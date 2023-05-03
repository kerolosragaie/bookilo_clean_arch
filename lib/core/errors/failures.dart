import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;
  const Failure({required this.errorMessage});
}

class ServerFailure extends Failure {
  const ServerFailure({required super.errorMessage});

  factory ServerFailure.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.connectionTimeout:
        return const ServerFailure(
            errorMessage: "Connection timeout with server!");
      case DioErrorType.sendTimeout:
        return const ServerFailure(
            errorMessage: "Send timeout, please try again later!");
      case DioErrorType.receiveTimeout:
        return const ServerFailure(
            errorMessage: "Receive timeout, please try again later!");
      case DioErrorType.badCertificate:
        return const ServerFailure(errorMessage: "Incorrect certificate.");
      case DioErrorType.badResponse:
        return ServerFailure.fromResponse(
            dioError.response!.statusCode!, dioError.response!.data);
      case DioErrorType.cancel:
        return const ServerFailure(errorMessage: "Cancelled connection");
      case DioErrorType.connectionError:
        return const ServerFailure(errorMessage: "Connection error");
      case DioErrorType.unknown:
        return const ServerFailure(
            errorMessage: "Unkown error, please try again!");
      default:
        return const ServerFailure(
            errorMessage: "Opps, unkown error, please try again later!");
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic reponse) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(errorMessage: reponse["error"]["message"]);
    } else if (statusCode == 404) {
      return const ServerFailure(
          errorMessage: "Your request not found, please try again later!");
    } else if (statusCode == 500) {
      return const ServerFailure(
          errorMessage: "Internal server error, please try again later!");
    } else {
      return const ServerFailure(
          errorMessage: "Opps, unkown error, please try again later!");
    }
  }
}

class OfflineFailure extends Failure {
  const OfflineFailure({required super.errorMessage});
}
