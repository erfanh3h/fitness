import '../../Network/network_exceptions.dart';

class ApiResult<T> {
  T? resultData;
  NetworkExceptions? errorData;
  bool? haveNextPage;

  ApiResult({
    this.resultData,
    this.errorData,
    this.haveNextPage,
  });
  factory ApiResult.success({required final T data}) {
    return ApiResult(resultData: data);
  }
  factory ApiResult.failure({required final NetworkExceptions error}) {
    return ApiResult(errorData: error);
  }
}
