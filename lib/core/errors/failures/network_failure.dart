part of 'failures.dart';

class NetworkFailure extends Failure {
  NetworkFailure({
    super.message,
  });
  factory NetworkFailure.fromInternetConnection(
      InternetConnectionStatus internetConnectionStatus) {
    return NetworkFailure(
        message:
            "Cannot connect to internet, please check your connection and try again.");
  }
}
