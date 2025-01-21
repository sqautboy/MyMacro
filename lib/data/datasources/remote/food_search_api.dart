
import 'package:diet_macro/core/network/signature_helper.dart';
import 'package:http/http.dart' as http;
import 'dart:math';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class FoodSearchApi {
  Future<String> fetchFoodNutrition(String foodName) async {
    // FatSecret API 정보
    final String consumerKey = dotenv.env['FATSECRET_CONSUMER_KEY']!;
    final String consumerSecret = dotenv.env['FATSECRET_CONSUMER_SECRET']!;
    const String apiUrl = 'https://platform.fatsecret.com/rest/server.api';

    // 요청 파라미터 설정 (Search 사용)
    final Map<String, String> params = {
      'method': 'foods.search', // 호출할 API 메서드
      'search_expression': foodName, // 검색어
      'format': 'json',
      'oauth_consumer_key': consumerKey,
      'oauth_signature_method': 'HMAC-SHA1',
      'oauth_timestamp': (DateTime.now().millisecondsSinceEpoch / 1000).floor().toString(),
      'oauth_nonce': Random().nextInt(1000000).toString(), // 랜덤 nonce 생성
      'oauth_version': '1.0',
    };

    // 서명 생성
    final signature = generateSignature('GET', apiUrl, params, consumerSecret, null);
    params['oauth_signature'] = Uri.encodeQueryComponent(signature);

    // 요청 URL 생성
    final finalUrl = Uri.parse('$apiUrl?${params.entries.map((e) => '${e.key}=${e.value}').join('&')}');

    // API 호출
    final response = await http.get(finalUrl);

    // 응답 처리
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return '';
    }
  }
}
