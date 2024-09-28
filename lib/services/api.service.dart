import 'package:diet_macro/models/food_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'dart:math';

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

Future<void> fetchFoodNutrition() async {
  // FatSecret API 정보
  const String consumerKey = '6bb1fb0f9bdd48f0a3c19103b768d573'; // 실제 Consumer Key
  const String consumerSecret = 'b550a99ae0d44695b9faa1d6380c622c'; // 실제 Consumer Secret
  const String apiUrl = 'https://platform.fatsecret.com/rest/server.api';

  // 요청 파라미터 설정
  final Map<String, String> params = {
    'method': 'foods.search', // 호출할 API 메서드
    'search_expression': 'creamcheese', // 검색어
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
    final Map<String, dynamic> jsonResponse = json.decode(response.body);
    final List<dynamic> foodList = jsonResponse['foods']['food'];

    List<FoodNutrition> foodNutritions = [];
    for (var food in foodList) {
      String description = food['food_description'];

      // "Per" 뒤에 오는 서빙 양 추출
      String servingUnit = description.split(' - ')[0].substring(4).trim();

      List<String> parts = description.split(' - ')[1].split(' | ');

      foodNutritions.add(FoodNutrition(
        name: food['food_name'], // food_name 추가
        calories: int.parse(parts[0].split(': ')[1].replaceAll('kcal', '')),
        fat: double.parse(parts[1].split(': ')[1].replaceAll('g', '')).round(), // 정수형 변환
        carbs: double.parse(parts[2].split(': ')[1].replaceAll('g', '')).round(), // 정수형 변환
        protein: double.parse(parts[3].split(': ')[1].replaceAll('g', '')).round(), // 정수형 변환
        servingUnit: servingUnit,
      ));
    }

    // 검색에 나오는 모든 식품의 Nutrition 출력
    for (var nutriotionItem in foodNutritions) {
      print(nutriotionItem);
      print('\n');
    }

    print('API Response: $jsonResponse');
  } else {
    print('API Error: ${response.statusCode}');
    print('Error Body: ${response.body}');
  }
}
