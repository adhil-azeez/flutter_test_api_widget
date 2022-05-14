class AppException implements Exception {
  final String msg;
  final dynamic exception;
  final dynamic others;

  AppException({
    this.msg = "Something went wrong. Please try again later",
    this.exception,
    this.others,
  });

  @override
  String toString() => msg;
}
