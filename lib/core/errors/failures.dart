import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;
  const Failure(this.errorMessage);
}

class ServerFailure extends Failure {
  const ServerFailure(super.errorMessage);

  factory ServerFailure.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.connectionTimeout:
        return const ServerFailure("Connection timeout with server!");
      case DioErrorType.sendTimeout:
        return const ServerFailure("Send timeout, please try again later!");
      case DioErrorType.receiveTimeout:
        return const ServerFailure("Receive timeout, please try again later!");
      case DioErrorType.badCertificate:
        return const ServerFailure("Incorrect certificate.");
      case DioErrorType.badResponse:
        return ServerFailure.fromResponse(
            dioError.response!.statusCode!, dioError.response!.data);
      case DioErrorType.cancel:
        return const ServerFailure("Cancelled connection");
      case DioErrorType.connectionError:
        return const ServerFailure("Connection error");
      case DioErrorType.unknown:
        return const ServerFailure("Unkown error, please try again!");
      default:
        return const ServerFailure(
            "Opps, unkown error, please try again later!");
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic reponse) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(reponse["error"]["message"]);
    } else if (statusCode == 404) {
      return const ServerFailure(
          "Your request not found, please try again later!");
    } else if (statusCode == 500) {
      return const ServerFailure(
          "Internal server error, please try again later!");
    } else {
      return const ServerFailure("Opps, unkown error, please try again later!");
    }
  }
}

class OfflineFailure extends Failure {
  const OfflineFailure(super.errorMessage);
}
