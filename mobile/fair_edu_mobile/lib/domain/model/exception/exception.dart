import 'package:fair_edu_mobile/domain/model/exception/code.dart';

abstract class BaseException {
  const BaseException({
    this.exception,
    this.stackTrace,
    this.isFatal = false,
  });

  final Object? exception;
  final StackTrace? stackTrace;
  final bool isFatal;

  @override
  String toString() => 'BaseException('
      'exception: $exception,'
      'isFatal: $isFatal,'
      ')';
}

class ApiException extends BaseException implements Exception {
  const ApiException({
    super.exception,
    super.stackTrace,
    super.isFatal,
    required this.code,
  }) : super();

  final ApiExceptionCode code;

  @override
  String toString() => 'ApiException('
      'exception: $exception,'
      'code: $code,'
      'isFatal: $isFatal,'
      ')';
}

class AuthException extends BaseException implements Exception {
  const AuthException({
    super.exception,
    super.stackTrace,
    super.isFatal,
    required this.code,
  }) : super();

  final AuthExceptionCode code;

  @override
  String toString() => 'AuthException('
      'exception: $exception,'
      'code: $code,'
      'isFatal: $isFatal,'
      ')';
}

class RepositoryException extends BaseException implements Exception {
  const RepositoryException({
    super.exception,
    super.stackTrace,
    super.isFatal,
    required this.code,
  });

  final RepositoryExceptionCode code;

  @override
  String toString() => 'RepositoryException('
      'exception: $exception,'
      'code: $code,'
      'isFatal: $isFatal,'
      ')';
}

class UseCaseException extends BaseException implements Exception {
  const UseCaseException({
    super.exception,
    super.stackTrace,
    super.isFatal,
    required this.code,
  });

  final UseCaseExceptionCode code;

  @override
  String toString() => 'UseCaseException('
      'exception: $exception,'
      'code: $code,'
      'isFatal: $isFatal,'
      ')';
}
