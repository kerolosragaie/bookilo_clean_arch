part of 'failures.dart';

class ServerFailure extends Failure {
  const ServerFailure({required super.message});

  factory ServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return const ServerFailure(message: "Connection timeout with server!");
      case DioExceptionType.sendTimeout:
        return const ServerFailure(message: "Send timeout with API server!");
      case DioExceptionType.receiveTimeout:
        return const ServerFailure(message: "Receive timeout with API server!");
      case DioExceptionType.badCertificate:
        return const ServerFailure(message: "Incorrect certificate.");
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          dioError.response!.statusCode!,
          dioError.response!.data,
        );
      case DioExceptionType.cancel:
        return const ServerFailure(
            message: "Request to API server was cancelled.");
      case DioExceptionType.connectionError:
        return const ServerFailure(message: "No internet connection.");
      case DioExceptionType.unknown:
        return const ServerFailure(message: "Unkown error, please try again!");
      default:
        return const ServerFailure(
            message: "Opps, unkown error, please try again later!");
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      //?The message Depend on API
      return ServerFailure(message: response["error"]["message"]);
    } else if (statusCode == 404) {
      return const ServerFailure(
          message: "Your request not found, please try again later!");
    } else if (statusCode >= 500) {
      return const ServerFailure(
          message: "Internal server error, please try again later!");
    } else {
      return const ServerFailure(
          message: "Opps, unkown error, please try again later!");
    }
  }
}
