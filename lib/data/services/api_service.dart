import 'package:diet_macro/data/models/food_model.dart';
import 'package:diet_macro/core/utils/logic/data_process.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'dart:math';
import 'package:flutter_dotenv/flutter_dotenv.dart';

String generateSignature(
    String httpMethod, String baseUrl, Map<String, String> params, String consumerSecret, String? tokenSecret) {
  // 1. 파라미터 정렬
  final sortedParams = Map.fromEntries(params.entries.toList()..sort((a, b) => a.key.compareTo(b.key)));

  // 2. 파라미터 문자열 생성
  String parameterString = sortedParams.entries.map((e) => '${e.key}=${e.value}').join('&');
  parameterString = Uri.encodeQueryComponent(parameterString);

  // 3. Signature Base String 생성
  String signatureBaseString = '$httpMethod&${Uri.encodeQueryComponent(baseUrl)}&$parameterString';

  // 4. Signing Key 생성
  String signingKey = '$consumerSecret&${tokenSecret ?? ''}';

  // 5. HMAC-SHA1 해싱 및 Base64 인코딩
  final hmacSha1 = Hmac(sha1, utf8.encode(signingKey));

  final signature = hmacSha1.convert(utf8.encode(signatureBaseString));
  final base64EncodedSignature = base64Encode(signature.bytes);

  return base64EncodedSignature;
}

Future<List<FoodNutrition>> fetchFoodNutrition(String foodName) async {
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
    return _parseFoodNutrition(response.body);
  } else {
    return [];
  }
}

List<FoodNutrition> _parseFoodNutrition(String responseBody) {
  final Map<String, dynamic> jsonResponse = json.decode(responseBody);
  final List<dynamic> foodList = jsonResponse['foods']['food'];

  List<FoodNutrition> foodNutritions = [];

  for (var food in foodList) {
    parseFoodNutrition(food, foodNutritions);
  }
  return foodNutritions;
}
