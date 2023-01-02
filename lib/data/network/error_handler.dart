import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../common/strings_manager.dart';
import 'failure.dart';

Failure handleError(dynamic error) {
  // DioError exits only in errors like
  // [connectTimeout, sendTimeout, receiveTimeout, cancel, other]
  // [response] When the server response, but with a incorrect status, such as 404, 503...
  if (error is DioError) {
    return _handleDioError(error);
  } else {
    return ResponseStatus.unknown.getFailure();
  }
}

///  [_handleDioError] for handling Dio error enum only
Failure _handleDioError(DioError error) {
  switch (error.type) {
    case DioErrorType.connectTimeout:
      return ResponseStatus.connectTimeout.getFailure();

    case DioErrorType.sendTimeout:
      return ResponseStatus.sendTimeout.getFailure();

    case DioErrorType.receiveTimeout:
      return ResponseStatus.receiveTimeout.getFailure();

    case DioErrorType.response:
      int? statusCode = error.response?.statusCode;
      String? statusMessage = error.response?.statusMessage;

      if (statusCode != null && statusMessage != null) {
        return Failure(code: statusCode, message: statusMessage);
      } else {
        return ResponseStatus.unknown.getFailure();
      }

    case DioErrorType.cancel:
      return ResponseStatus.cancel.getFailure();

    case DioErrorType.other:
      return ResponseStatus.unknown.getFailure();
  }
}

enum ResponseStatus {
  /// It occurs when url is opened timeout.
  connectTimeout,

  /// It occurs when url is sent timeout.
  sendTimeout,

  ///It occurs when receiving timeout.
  receiveTimeout,

  /// When the request is cancelled, dio will throw a error with this type.
  cancel,

  noInternetConnection,

  /// Default error type, Some other Error. In this case, you can
  /// use the DioError.error if it is not null.
  unknown,
}

extension ResponseStatusExtensions on ResponseStatus {
  Failure getFailure() {
    switch (this) {
      case ResponseStatus.connectTimeout:
        return Failure(
          code: ResponseCode.connectTimeout,
          message: ResponseMessage.connectTimeout.tr(),
        );

      case ResponseStatus.sendTimeout:
        return Failure(code: ResponseCode.sendTimeout, message: ResponseMessage.sendTimeout.tr());

      case ResponseStatus.receiveTimeout:
        return Failure(
          code: ResponseCode.receiveTimeout,
          message: ResponseMessage.receiveTimeout.tr(),
        );

      case ResponseStatus.cancel:
        return Failure(code: ResponseCode.cancel, message: ResponseMessage.cancel.tr());

      case ResponseStatus.noInternetConnection:
        return Failure(
          code: ResponseCode.noInternetConnection,
          message: ResponseMessage.noInternetConnection.tr(),
          failureType: FailureType.network,
        );

      case ResponseStatus.unknown:
        return Failure(code: ResponseCode.unknown, message: ResponseMessage.unknown.tr());
    }
  }
}

// Have all possible response messages that can be local from DIO or From Api
class ResponseMessage {
  // local status code
  static const String connectTimeout = AppStrings.timeoutError;
  static const String cancel = AppStrings.cancel;
  static const String receiveTimeout = AppStrings.timeoutError;
  static const String sendTimeout = AppStrings.timeoutError;
  static const String noInternetConnection = AppStrings.noInternetError;
  static const String unknown = AppStrings.unknownError;
}

// Have all possible response codes that can be local from DIO or From Api
class ResponseCode {
  // local status code
  static const int connectTimeout = -1;
  static const int cancel = -2;
  static const int receiveTimeout = -3;
  static const int sendTimeout = -4;
  static const int noInternetConnection = -6;
  static const int unknown = -7;
}
