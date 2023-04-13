class NetworkExceptions {
  int? statusCode;
  String? result;
  NetworkExceptions({
    this.statusCode,
    this.result,
  });
  factory NetworkExceptions.fromResult(int statusCode, String result) {
    return NetworkExceptions(result: result, statusCode: statusCode);
  }
}
