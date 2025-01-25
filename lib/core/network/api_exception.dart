class ApiException implements Exception {
  final String message;
  final int? statusCode;
  final String? responseBody;

  ApiException(this.message, this.statusCode, this.responseBody);

  @override
  String toString() {
    return 'ApiException: $message, Status Code: $statusCode, Response Body: $responseBody';
  }
}
