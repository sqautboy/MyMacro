import 'dart:convert';
import 'package:crypto/crypto.dart';

// OAuth 1.0 Signature 생성
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
