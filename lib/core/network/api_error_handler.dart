import 'package:http/http.dart' as http;
import 'api_exception.dart';

class ApiErrorHandler {
  /// API 응답 상태 코드를 확인하고, 실패 시 ApiException 을 던진다
  static String handleResponse(http.Response response) {
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw ApiException(
        'API 요청 실패',
        response.statusCode,
        response.body,
      );
    }
  }
}
