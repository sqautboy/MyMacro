import 'package:diet_macro/core/network/oauth1.0/oauth_helper.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:diet_macro/core/network/api_error_handler.dart';
import 'package:diet_macro/core/network/api_exception.dart';

/// FatSecret API 호출을 담당하는 클래스
class FoodSearchApi {
  final String baseUrl = 'https://platform.fatsecret.com/rest/server.api';
  final OAuthHelper oAuthHelper;

  FoodSearchApi()
      : oAuthHelper = OAuthHelper(
          dotenv.env['FATSECRET_CONSUMER_KEY']!,
          dotenv.env['FATSECRET_CONSUMER_SECRET']!,
        );

  /// 음식 영양 정보 조회
  Future<String> fetchFoodNutrition(String foodName) async {
    final params = {
      'method': 'foods.search',
      'search_expression': foodName,
      'format': 'json',
      ...oAuthHelper.getOAuthParams(),
    };

    params['oauth_signature'] = oAuthHelper.generateSignature('GET', baseUrl, params);

    final uri = Uri.parse(baseUrl).replace(queryParameters: params);

    try {
      final response = await http.get(uri);
      return ApiErrorHandler.handleResponse(response);
    } on ApiException catch (e) {
      print('ApiException 발생: $e');
    } catch (e) {
      print('Exception 발생: $e');
    }
    return '';
  }
}
