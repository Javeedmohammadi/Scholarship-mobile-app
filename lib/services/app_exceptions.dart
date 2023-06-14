


class AppException implements Exception {

  final String? message;
  final String? prefix;
  final String? url;
  AppException({this.message,this.prefix,this.url});

}


class BadRequestException extends AppException {
  BadRequestException({required String? message, required String? url}) : super (message: message, url: url);
}

class FetchDataException extends AppException {
  FetchDataException({required String? message, required String? url}) : super (message: message, url: url);
}

class ApiNotResponding extends AppException {
  ApiNotResponding({required String? message, required String? url}) : super (message: message, url: url);
}

class UnAuthorizedException extends AppException {
  UnAuthorizedException({required String? message, required String? url}) : super (message:message, url: url);
}
class AlreadySavedException extends AppException {
  AlreadySavedException({required String? message, required String? url}) : super (message: message, url: url);
}

class ValidationError extends AppException {
  ValidationError({required String? message, required String? url}) : super (message: message, url: url);
}
